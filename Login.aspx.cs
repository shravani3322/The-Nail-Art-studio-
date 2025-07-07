using System;
using System.Data;
using MySql.Data.MySqlClient; // Import MySQL library
using System.Web.UI;

namespace finalnailart05
{
    public partial class Login : Page
    {
        // ✅ Use direct connection string
        string connectionString = "Server=localhost;Database=vbdb;User ID=root;Password=;SslMode=none;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                emailInput.Attributes.Add("placeholder", "Enter Your Email");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = emailInput.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter your email.');", true);
                return;
            }

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM users WHERE email = @Email";

                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());

                        if (count > 0)
                        {
                            // ✅ Email exists → Login successful
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login successful!'); window.location='Home.aspx';", true);
                        }
                        else
                        {
                            // ❌ Email not found → Ask to register
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please register first to login.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                    }
                }
            }
        }
    }
}
