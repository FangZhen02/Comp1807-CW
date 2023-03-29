using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp1807_Coursework
{
    public partial class Payment_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PickUp.Text = (string)Session["pickup"];
            Destination.Text = (string)Session["destination"];
            Date.Text = (string)Session["date"];
            Time.Text = (string)Session["time"];
            minicab.Text = (string)Session["minicab"];
        }
    }
}