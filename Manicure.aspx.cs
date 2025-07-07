using System;
using System.Data;
using MySql.Data.MySqlClient; // ✅ Use MySQL library
using System.Configuration;

namespace finalnailart05
{
    public partial class Manicure : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadManicureServices();
            }
        }

        private void LoadManicureServices()
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connStr)) // ✅ Use MySqlConnection
            {
                try
                {
                    conn.Open(); // ✅ Always open connection before using it

                    string query = "SELECT * FROM services3 WHERE type = 'Manicure'";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, conn); // ✅ Use MySqlDataAdapter
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    RepeaterManicure.DataSource = dt;
                    RepeaterManicure.DataBind();
                }
                catch (Exception ex)
                {
                    // ✅ Handle errors properly
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
