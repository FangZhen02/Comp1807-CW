using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class AddMinicab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnAdd.UniqueID;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
                string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

                string regNum = (string)GridView1.DataKeys[e.RowIndex].Value;
                string query = "DELETE FROM Minicab WHERE RegistrationNum = ?";
                using (OleDbConnection conn = new OleDbConnection(connString))
                using (OleDbCommand cmd = new OleDbCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@RegistrationNum", regNum);
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

            using (OleDbCommand checkRegistrationCmd = new OleDbCommand("SELECT COUNT(*) FROM Minicab WHERE [RegistrationNum] = @RegNum", con))
            {
                checkRegistrationCmd.Parameters.AddWithValue("@RegNum", txtRegistration.Text);
                int contactCount = (int)checkRegistrationCmd.ExecuteScalar();

                if (contactCount > 0)
                {
                    lblExists.Visible = true;
                }
                else
                {
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.CommandText = "INSERT INTO [Minicab] ([RegistrationNum], [Colour], [Brand], [SeatSize]) VALUES (@regNum, @colour, @brand, @seatsize)";
                    cmd.Parameters.AddWithValue("@regNum", txtRegistration.Text);
                    cmd.Parameters.AddWithValue("@colour", txtColor.Text);
                    cmd.Parameters.AddWithValue("@brand", txtBrand.Text);
                    cmd.Parameters.AddWithValue("@seatsize", txtSeatSize.Text);
                    cmd.Connection = con;
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        string message = "Minicab successfully added.";
                        string script = "if (window.confirm('" + message + "')) { window.location.href = 'AddMinicab.aspx'; }";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                    }
                }
            }
            con.Close();
        }
    }
}