using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace finalnailart05
{
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string transactionId = Request.QueryString["transactionId"];
                if (!string.IsNullOrEmpty(transactionId))
                {
                    LoadBillDetails(transactionId);
                }
                else
                {
                    Response.Write("<script>alert('Error: Transaction ID is missing!');</script>");
                }
            }
        }

        private void LoadBillDetails(string transactionId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();

                string query = @"SELECT p.transaction_id, p.amount, p.payment_status, 
                                        s.service_name
                                FROM payments p
                                JOIN services3 s ON p.serviceid = s.id
                                WHERE p.transaction_id = @transactionId";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@transactionId", transactionId);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTransactionId.Text = reader["transaction_id"].ToString();
                            lblServiceName.Text = reader["service_name"].ToString();
                            lblAmount.Text = "₹ " + reader["amount"].ToString();
                            lblStatus.Text = reader["payment_status"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('Error: No payment found for this transaction ID!');</script>");
                        }
                    }
                }
            }
        }
    }
}
