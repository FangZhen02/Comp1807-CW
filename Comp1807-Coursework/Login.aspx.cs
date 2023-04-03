using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";
            string query = "SELECT COUNT(*) FROM Customer WHERE [Email]=@Email AND Password=@Password";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    connection.Open();
                    command.Parameters.AddWithValue("@Email", txtEmail.Text);
                    command.Parameters.AddWithValue("@Password", txtPassword.Text);
                    int count = (int)command.ExecuteScalar();
                    connection.Close();

                    if (count > 0)
                    {
                        connection.Open();
                        string query2 = "SELECT FirstName FROM Customer WHERE Email = '" + txtEmail.Text + "'";
                        OleDbCommand commandUsername = new OleDbCommand(query2, connection);
                        object resultName = commandUsername.ExecuteScalar();

                        string query3 = "SELECT CustID FROM Customer WHERE Email = '" + txtEmail.Text + "'";
                        OleDbCommand commandcustID = new OleDbCommand(query3, connection);
                        object resultID = commandcustID.ExecuteScalar();

                        string username = resultName.ToString();
                        string custID = resultID.ToString();
                        Session["username"] = username;
                        Session["usertype"] = "customer";
                        Session["userID"] = custID;
                        connection.Close();
                        string message = "Login successful";
                        string script = "if (window.confirm('" + message + "')) { window.location.href = 'Booking.aspx'; }";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                    }
                    else
                    {
                        lblIncorrect.Visible = true;
                    }
                }
            }
        }
    }
}