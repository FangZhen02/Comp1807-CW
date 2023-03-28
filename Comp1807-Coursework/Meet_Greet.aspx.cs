using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoogleMaps;
using System.Net;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using System.IO;

namespace Comp1807_Coursework
{
    public partial class Meet_Greet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void checkConfirm_CheckedChanged(object sender, EventArgs e)
        {
            if (checkConfirm.Checked)
            {
                lblCheck.Visible = false;
                try
                {
                    string PickUp = AirportOption.SelectedItem.Text;
                    string origin = PickUp;
                    string des = txtDestination.Text;
                    string destination = des;


                    string url = $"https://maps.googleapis.com/maps/api/distancematrix/json?origins={origin}&destinations={destination}&mode=driving&key=AIzaSyBcPiqhnEgEh6PjUmFyvfsYK_A5nWKYaiI";

                    WebClient client = new WebClient();
                    string jsonContent = client.DownloadString(url);
                    JObject json = JObject.Parse(jsonContent);

                    string distance = "";
                    JToken distanceToken = json.SelectToken("rows[0].elements[0].distance.text");
                    if (distanceToken != null)
                    {
                        distance = distanceToken.ToString();
                    }
                    else
                    {
                        throw new Exception("Incorrect or incomplete address input. Please enter a proper address");
                    }

                    lblTesting.Text = $"Distance between {origin} and {destination}: {distance}";
                    lblTesting.Visible = true;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "initMap", "initMap();", true);
                }
                catch (Exception ex)
                {
                    // Handle the exception by displaying an error message to the user
                    lblTesting.Text = ex.Message;
                    lblTesting.Visible = true;
                }

            }
            else
            {
                lblTesting.Visible = false;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (checkConfirm.Checked)
            {
                lblCheck.Visible = false;
                Session["passengername"] = txtName.Text;
                Session["pickup"] = AirportOption.SelectedItem.Text;
                Session["flightnumber"] = txtFlight.Text;
                Session["destination"] = txtDestination.Text;
                Session["date"] = txtDate.Text;
                Session["time"] = txtTime.Text;
                Session["totalpassenger"] = txtCapacity.Text;
                Session["minicab"] = MinicabOption.SelectedItem.Text;

                if (txtName.Text != "" && txtFlight.Text != "" && txtDestination.Text != "" && txtDate.Text != "" && txtTime.Text != "" && txtCapacity.Text != "")
                {
                    Response.Redirect("Payment_details.aspx");
                }
                else
                {
                    string message = "Please input all values before proceeding";
                    string script = "if (window.confirm('" + message + "')) { window.location.href = ''; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                }
            }
            else
            {
                lblCheck.Visible = true;
                lblCheck.Focus();
            }
        }
    }
}