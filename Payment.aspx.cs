using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace finalnailart05
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string serviceId = Request.QueryString["serviceId"];
                string userId = Request.QueryString["userId"];
                string amount = Request.QueryString["amount"];

                if (!string.IsNullOrEmpty(serviceId) && !string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(amount))
                {
                    hfServiceId.Value = serviceId;
                    hfUserId.Value = userId;
                    txtAmount.Text = amount;
                    txtTransactionId.Text = GenerateTransactionId();
                }
                else
                {
                    Response.Write("<script>alert('Error: Missing payment details!');</script>");
                }
            }
        }

        private string GenerateTransactionId()
        {
            return "TXN" + DateTime.Now.Ticks;
        }

        protected void ConfirmPayment(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();

                // Check if transaction already exists
                string checkQuery = "SELECT COUNT(*) FROM payments WHERE transaction_id = @transactionId";
                using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@transactionId", txtTransactionId.Text);
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        Response.Write("<script>alert('Duplicate transaction detected! Payment already recorded.');</script>");
                        return;
                    }
                }

                // Insert new payment record
                string query = "INSERT INTO payments (userid, serviceid, amount, transaction_id, payment_status) " +
                               "VALUES (@userid, @serviceid, @amount, @transactionId, 'Completed')";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@userid", hfUserId.Value);
                    cmd.Parameters.AddWithValue("@serviceid", hfServiceId.Value);
                    cmd.Parameters.AddWithValue("@amount", txtAmount.Text);
                    cmd.Parameters.AddWithValue("@transactionId", txtTransactionId.Text);

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Payment successful!'); window.location='Bill.aspx?transactionId=" + txtTransactionId.Text + "';</script>");
                }
            }
        }
    }
}
