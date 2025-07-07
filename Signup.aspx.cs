using System;
using System.Data;
using MySql.Data.MySqlClient; // Import MySQL library
using System.Web.UI;

namespace finalnailart05
{
    public partial class Signup : Page
    {
        // ✅ Use the same connection string as login
        string connectionString = "Server=localhost;Database=vbdb;User ID=root;Password=;SslMode=none;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nameInput.Attributes.Add("placeholder", "Enter Your Name");
                emailInput.Attributes.Add("placeholder", "Enter Your Email");
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string name = nameInput.Text.Trim();
            string email = emailInput.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all fields.');", true);
                return;
            }

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // ✅ Check if email already exists
                    string checkQuery = "SELECT COUNT(*) FROM users WHERE email = @Email";
                    using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, connection))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            // ❌ Email already registered
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email is already registered. Please login.');", true);
                            return;
                        }
                    }

                    // ✅ Insert new user
                    string insertQuery = "INSERT INTO users (name, email) VALUES (@Name, @Email)";
                    using (MySqlCommand insertCmd = new MySqlCommand(insertQuery, connection))
                    {
                        insertCmd.Parameters.AddWithValue("@Name", name);
                        insertCmd.Parameters.AddWithValue("@Email", email);

                        int result = insertCmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration successful! You can now login.'); window.location='Login.aspx';", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration failed. Try again.');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}
