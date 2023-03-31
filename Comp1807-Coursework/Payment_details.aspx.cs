using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp1807_Coursework
{
    public partial class Payment_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ServiceType = (string)Session["servicetype"];
            lblService.Text = ServiceType;

            lblPassengerName.Text = (string)Session["passengername"];
            lblFlight.Text = (string)Session["flightnumber"];
            PickUp.Text = (string)Session["pickup"];
            Destination.Text = (string)Session["destination"];
            Date.Text = (string)Session["date"];
            Time.Text = (string)Session["time"];
            minicab.Text = (string)Session["minicab"];
            lblDistance.Text = (string)Session["distance"];

            if (ServiceType != "Rental Service")
            {
                string DistanceKM = lblDistance.Text;
                string DistanceOnly = Regex.Replace(DistanceKM, "[ km]", "");
                double Distance = double.Parse(DistanceOnly);
                double totalAmount = Distance * 0.8;
                if (totalAmount <= 3)
                {
                    totalAmount = 3;
                }
                lblTotalAmount.Text = "£" + totalAmount.ToString();

                double discountOnline = 15;
                lblDiscount.Text = discountOnline + "%";

                double grandTotal = totalAmount * (1 - (discountOnline / 100));
                lblGrandTotal.Text = "£" + grandTotal.ToString();
            }
            else
            {
                lblTotalAmount.Text = "£200";
                double discountOnline = 15;
                lblDiscount.Text = discountOnline + "%";
                double grandTotal = 200 * (1 - (discountOnline / 100));
                lblGrandTotal.Text = "£" + grandTotal.ToString();
            }
        }

        protected void changeLink_Click(object sender, EventArgs e)
        {
            string previousPageUrl = Session["PreviousPage"].ToString();
            Response.Redirect(previousPageUrl);
        }
    }
}