﻿using System;
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
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblVerifyPassword.Visible = true;
            }
            else
            {
                string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
                string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";
                bool emailExists = false;
                OleDbConnection con = new OleDbConnection();
                con.ConnectionString = connString;
                con.Open();

                using (OleDbCommand checkEmailCmd = new OleDbCommand("SELECT COUNT(*) FROM Customer WHERE [Email] = @Email", con))
                {
                    checkEmailCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    int emailCount = (int)checkEmailCmd.ExecuteScalar();

                    if (emailCount > 0)
                    {
                        emailExists = true;
                        lblEmailExist.Visible = true;
                    }
                }

                if (!emailExists)
                {
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
                        string message = "Your account has been successfully created.";
                        string script = "if (window.confirm('" + message + "')) { window.location.href = 'Login.aspx'; }";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                    }
                }
                con.Close();
            }
        }
    }
}