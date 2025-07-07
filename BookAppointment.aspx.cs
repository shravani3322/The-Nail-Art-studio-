using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace finalnailart05
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string serviceId = Request.QueryString["serviceId"];
                string serviceName = Request.QueryString["serviceName"];
                string price = Request.QueryString["price"];

                if (!string.IsNullOrEmpty(serviceId) && !string.IsNullOrEmpty(serviceName) && !string.IsNullOrEmpty(price))
                {
                    hfServiceId.Value = serviceId;
                    txtService.Text = serviceName;
                    txtPrice.Text = price;
                }
                else
                {
                    Response.Write("<script>alert('Error: Service details are missing!');</script>");
                }
            }
        }

        protected void ConfirmAppointment(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();

                // Check for duplicate appointment
                string checkQuery = "SELECT COUNT(*) FROM appointmentsnew WHERE phone_no = @phone AND appointment_date = @date AND serviceid = @serviceId";
                using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                    checkCmd.Parameters.AddWithValue("@date", txtDate.Text);
                    checkCmd.Parameters.AddWithValue("@serviceId", hfServiceId.Value);

                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (count > 0)
                    {
                        Response.Write("<script>alert('You already have an appointment for this service on this date!');</script>");
                        return;
                    }
                }

                // Insert new appointment
                string insertQuery = "INSERT INTO appointmentsnew (userid, serviceid, appointment_date, customer_name, address, phone_no, status, created_at) VALUES (@userid, @serviceid, @date, @name, @address, @phone, 'Pending', NOW())";
                using (MySqlCommand cmd = new MySqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@userid", 1);  // Change based on logged-in user
                    cmd.Parameters.AddWithValue("@serviceid", hfServiceId.Value);
                    cmd.Parameters.AddWithValue("@date", txtDate.Text);
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@address", "N/A");
                    cmd.Parameters.AddWithValue("@phone", txtPhone.Text);

                    cmd.ExecuteNonQuery();
                }

                Response.Write("<script>alert('Appointment Confirmed! Proceed to Payment.'); window.location='Payment.aspx?serviceId=" + hfServiceId.Value + "&amount=" + txtPrice.Text + "&userId=1';</script>");
            }
        }
    }
}
