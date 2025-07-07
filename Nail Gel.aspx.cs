using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace finalnailart05
{
    public partial class NailGel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNailGelServices();
            }
        }

        private void LoadNailGelServices()
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    string query = "SELECT * FROM services3 WHERE type = 'Nail Gel'";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    RepeaterNailGel.DataSource = dt;
                    RepeaterNailGel.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
