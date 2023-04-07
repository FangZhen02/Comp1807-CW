using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Net;
using System.Net.Mail;
namespace Comp1807_Coursework
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private string UserName;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnComfirm_Click(object sender, EventArgs e)
        {
            
            
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            string randomString = new string(Enumerable.Repeat(chars, 8)
              .Select(s => s[random.Next(s.Length)]).ToArray());

            using (OleDbConnection connection = new OleDbConnection(connString))
{
                //get 1st driver who is available
                connection.Open();

                string query1 = "SELECT [Email],[FirstName] FROM Customer WHERE Email = @Email";
                OleDbCommand command = new OleDbCommand(query1, connection);
                command.Parameters.AddWithValue("@Email", txtConfirmEmail.Text);
                OleDbDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    string email = reader.GetString(0);
                    UserName = reader.GetString(1);

                    // use the firstName variable here
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("privatehiresup@gmail.com");
                    mail.To.Add(txtConfirmEmail.Text);
                    mail.Subject = "Reset Password";
                    mail.Body = "Dear " + UserName + ",\n\nThis is the temporary password to reset the password. Your temporary password is " + randomString + "\n\nBest regards,\nPrivateHire Team";

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential("privatehiresup@gmail.com", "gcwozivqooacudur");
                    smtp.Send(mail);
                }

                else
                {
                    string message = "The account is not found. Please sign up a new account";
                    string script = "if (window.confirm('" + message + "')) { window.location.href = 'SignUp.aspx'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                }

                

                string query2 = "UPDATE Customer SET [Password] = @Password WHERE [Email] = @Email";
                OleDbCommand command2 = new OleDbCommand(query2, connection);
                command2.Parameters.AddWithValue("@Password", randomString);
                command2.Parameters.AddWithValue("@Email", txtConfirmEmail.Text);
                int rowsAffected = command2.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    Session["ResetPasswordEmail"] = txtConfirmEmail.Text;
                    string message = "Temporary password has been sent to your mail.";
                    string script = "if (window.confirm('" + message + "')) { window.location.href = 'ResetPassword.aspx'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                }
                connection.Close();
            }

        }
    }
}