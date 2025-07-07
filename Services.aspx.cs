using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace finalnailart05
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServices();
            }
        }

        private void LoadServices()
        {
            string connStr = ConfigurationManager.ConnectionStrings["vbdb"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT * FROM services3";
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptServices.DataSource = dt;
                        rptServices.DataBind();
                    }
                }
            }
        }

        protected void BookService(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            string serviceId = btn.CommandArgument;
            string serviceName = ((HiddenField)item.FindControl("hfServiceName")).Value;
            string price = ((HiddenField)item.FindControl("hfPrice")).Value;

            Response.Redirect($"BookAppointment.aspx?serviceId={serviceId}&serviceName={serviceName}&price={price}");
        }
    }
}
