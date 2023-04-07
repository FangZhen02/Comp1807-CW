using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private string resetEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            resetEmail = (string)Session["ResetPasswordEmail"];
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            if (resetEmail != null)
            {


                string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
                string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";


                using (OleDbConnection connection = new OleDbConnection(connString))
                {
                    connection.Open();

                    string query1 = "SELECT [Email],[Password] FROM Customer WHERE Email = @Email";
                    using (OleDbCommand command = new OleDbCommand(query1, connection))
                    {   
                        command.Parameters.AddWithValue("@Email", Session["ResetPasswordEmail"].ToString());
                        OleDbDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            reader.Read();
                            string password = reader.GetString(1);

                            if (txtTempoPassword.Text == password)
                            {
                                if (txtNewPassword.Text == txtConfirmPassword.Text)
                                {
                                    string query2 = "UPDATE Customer SET [Password]= @Password WHERE [Email] = @Email";
                                    OleDbCommand command2 = new OleDbCommand(query2, connection);
                                    command2.Parameters.AddWithValue("@Password", txtNewPassword.Text);
                                    command2.Parameters.AddWithValue("@Email", Session["ResetPasswordEmail"].ToString());
                                    int rowsAffected = command2.ExecuteNonQuery();
                                    if (rowsAffected == 1)
                                    {
                                        string message = "Successfull changed your password, please login.";
                                        string script = "if (window.confirm('" + message + "')) { window.location.href = 'Login.aspx'; }";
                                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                                    }
                                }
                                else
                                {
                                    string message = "New password and confirm password do not match.";
                                    string script = "alert('" + message + "');";
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                                }
                            }
                            else
                            {
                                string message = "Invalid temporary password.";
                                string script = "alert('" + message + "');";
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                            }
                        }
                        else
                        {
                            string message = "Invalid email address.";
                            string script = "alert('" + message + "');";
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                        }

                        reader.Close();

                    }


                    connection.Close();
                }
            }
        }
    }
}