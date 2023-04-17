using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Diagnostics;

namespace Comp1807_Coursework
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnAdd.UniqueID;
            //*

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
                string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

                int driverID = (int)GridView1.DataKeys[e.RowIndex].Value;
                string query = "DELETE FROM Driver WHERE DriverID = ?";
                using (OleDbConnection conn = new OleDbConnection(connString))
                using (OleDbCommand cmd = new OleDbCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DriverID", driverID);
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result == 1)
                    {
                        // show success message
                        string message = "Record deleted successfully.";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);
                    }
                    else
                    {
                        // show error message
                        string message = "Record could not be deleted.";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);
                    }
                }
            }
            catch (OleDbException ex)
            {
                e.Cancel = true;
                lblDeleteFail.Text = ex.Message;
                lblDeleteFail.Visible = true;
            }
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