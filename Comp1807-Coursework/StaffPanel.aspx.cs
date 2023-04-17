using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp1807_Coursework
{
    public partial class StaffPanel : System.Web.UI.Page
    {
        public string username;
        public string usertype;
        public string userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)Session["username"];
            usertype = (string)Session["usertype"];
            userID = (string)Session["userID"];
        }

        protected void local_Click(object sender, ImageClickEventArgs e)
        {
            if (username == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;
                Response.Redirect("Service.aspx");
            }
        }

        protected void rental_Click(object sender, ImageClickEventArgs e)
        {
            if (username == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;
                Response.Redirect("Rental.aspx");
            }
        }

        protected void airports_Click(object sender, ImageClickEventArgs e)
        {
            if (username == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;
                Response.Redirect("Airport.aspx");
            }
        }

        protected void hotelTransfer_Click(object sender, ImageClickEventArgs e)
        {
            if (username == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;
                Response.Redirect("Hoteltransfer.aspx");
            }
        }

        protected void meetGreet_Click(object sender, ImageClickEventArgs e)
        {
            if (username == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;
                Response.Redirect("Meet_Greet.aspx");
            }
        }

        protected void btnAddDriver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDriver.aspx");
        }

        protected void btnAddMinicab_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMinicab.aspx");
        }

        protected void btnRegisterCustomer_Click(object sender, EventArgs e)
        {
            Session["usertype"] = usertype;
            Response.Redirect("SignUp.aspx");
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateStatus.aspx");
        }
    }
}