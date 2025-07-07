using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace finalnailart05
{
    public partial class Contact : Page
    {
        protected void SubmitContact(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

            string connString = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(connString))
            {
                string query = "INSERT INTO contact (name, email, message) VALUES (@Name, @Email, @Message)";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", message);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            // Show alert and redirect to Home.aspx
            Response.Write("<script>alert('Message sent successfully!'); window.location='Home.aspx';</script>");
        }
    }
}
