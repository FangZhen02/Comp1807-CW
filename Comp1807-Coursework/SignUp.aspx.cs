using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\user\\source\\repos\\FangZhen02\\Comp1807-CW\\COMP1807_CW.accdb";

            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = connectionString;
            con.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandText = "INSERT INTO [Customer] ([FirstName], [LastName], [Email], [Contact], [Password]) VALUES (@Firstname, @Lastname, @email, @ContactNum, @ConfirmPassword)";
            cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@ContactNum", txtContactNum.Text);
            cmd.Parameters.AddWithValue("@ConfirmPassword", txtConfirmPassword.Text);
            cmd.Connection = con;
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                string message = "Registration Successful";
                string script = "if (window.confirm('" + message + "')) { window.location.href = 'Homepage.aspx'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
            }
        }
    }
}