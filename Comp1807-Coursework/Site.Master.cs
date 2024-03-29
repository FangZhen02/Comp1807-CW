﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Drawing;
namespace Comp1807_Coursework
{
    public partial class SiteMaster : MasterPage
    {
        private string usertype;
        protected void Page_Load(object sender, EventArgs e)
        {
            usertype = (string)Session["usertype"];

            if (usertype == "customer")
            {
                bookingHistoryItem.Visible = true;
                staffPanelItem.Visible = false;
            }
            else if(usertype == "staff")
            {
                bookingHistoryItem.Visible = false;
                staffPanelItem.Visible = true;
            }
            else
            {
                bookingHistoryItem.Visible = false;
                staffPanelItem.Visible = false;
            }

            lblSiteUserName.ForeColor = System.Drawing.Color.White;
            string username = (string)Session["username"];
            if (username == null || username == "")
            {
                btnSignOut.Text = "Login";
            }
            else
            {
                lblSiteUserName.Text = (string)Session["username"] + "  (" + (string)Session["usertype"] + ")";
                btnSignOut.Text = "SignOut";
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            string username = (string)Session["username"];
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
            if (username == null || username == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                lblSiteUserName.Text = null;
            }
        }
    }
}