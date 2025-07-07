using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace finalnailart05
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected string customerName = "";
        protected string serviceName = "";
        protected string amount = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string appointmentId = Request.QueryString["appointmentId"];

                if (!string.IsNullOrEmpty(appointmentId))
                {
                    LoadInvoiceDetails(appointmentId);
                }
                else
                {
                    Response.Write("<script>alert('Error: No appointment selected!');</script>");
                }
            }
        }

        private void LoadInvoiceDetails(string appointmentId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT a.customer_name, s.service_name, s.price FROM appointmentsnew a " +
                               "JOIN services3 s ON a.serviceid = s.id WHERE a.id = @appointmentId";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@appointmentId", appointmentId);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            customerName = reader["customer_name"].ToString();
                            serviceName = reader["service_name"].ToString();
                            amount = reader["price"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('Error: No data found!');</script>");
                        }
                    }
                }
            }
        }
    }
}
