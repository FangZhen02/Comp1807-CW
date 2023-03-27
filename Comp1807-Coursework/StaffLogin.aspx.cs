using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnStaffLogin_Click(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";
            string query = "SELECT COUNT(*) FROM Staff WHERE [StaffEmail]=@StaffEmail AND StaffPassword=@StaffPassword";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    connection.Open();
                    command.Parameters.AddWithValue("@StaffEmail", txtStaffEmail.Text);
                    command.Parameters.AddWithValue("@StaffPassword", txtStaffPassword.Text);
                    int count = (int)command.ExecuteScalar();
                    connection.Close();

                    if (count > 0)
                    {
                        string message = "Login successful";
                        string script = "if (window.confirm('" + message + "')) { window.location.href = 'Booking.aspx'; }";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                    }
                    else
                    {
                        lblIncorrectStaff.Visible = true;
                    }
                }
            }
        }
    }
}