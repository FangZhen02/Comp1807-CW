using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnAdd.UniqueID;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = connString;
            con.Open();

            using (OleDbCommand checkContactCmd = new OleDbCommand("SELECT COUNT(*) FROM Driver WHERE [Contact] = @contact", con))
            {
                checkContactCmd.Parameters.AddWithValue("@contact", txtContact.Text);
                int contactCount = (int)checkContactCmd.ExecuteScalar();

                if (contactCount > 0)
                {
                    lblExists.Visible = true;
                }
                else
                {
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.CommandText = "INSERT INTO [Driver] ([DriverName], [Contact]) VALUES (@Drivername, @contact)";
                    cmd.Parameters.AddWithValue("@Drivername", txtDriverName.Text);
                    cmd.Parameters.AddWithValue("@contact", txtContact.Text);
                    cmd.Connection = con;
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        string message = "Driver successfully added.";
                        string script = "if (window.confirm('" + message + "')) { window.location.href = 'AddDriver.aspx'; }";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                    }
                }
            }
            con.Close();


        }
    }
}