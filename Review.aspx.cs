using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace finalnailart05
{
    public partial class Review : System.Web.UI.Page
    {
        protected void SubmitReview(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string ratingStr = hfRating.Value; // HiddenField for star rating
            string comment = txtComment.Text.Trim();

            // Validate input
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(ratingStr) || string.IsNullOrEmpty(comment))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('All fields are required!');", true);
                return;
            }

            int rating;
            if (!int.TryParse(ratingStr, out rating) || rating < 1 || rating > 5)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a valid rating!');", true);
                return;
            }

            // Database connection string
            string connString = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(connString))
            {
                string query = "INSERT INTO reviews (name, rating, comment) VALUES (@Name, @Rating, @Comment)";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Rating", rating);
                    cmd.Parameters.AddWithValue("@Comment", comment);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            // Show success message without page reload
            ClientScript.RegisterStartupScript(this.GetType(), "success", "document.getElementById('successMessage').style.display='block';", true);

            // Clear form fields
            txtName.Text = "";
            hfRating.Value = "";
            txtComment.Text = "";
        }
    }
}
