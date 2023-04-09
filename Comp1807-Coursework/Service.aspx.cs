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
    
    public partial class Service : System.Web.UI.Page
    {
        public string username;
        public string usertype;
        public string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = txtDateTime.UniqueID;
            if (!IsPostBack)
            {
                DateTime minDateTime = DateTime.Now.AddHours(1);
                DateTime maxDateTime = DateTime.Now.AddDays(90);

                txtDateTime.Attributes.Add("min", minDateTime.ToString("yyyy-MM-dd HH:mm"));
                txtDateTime.Attributes.Add("max", maxDateTime.ToString("yyyy-MM-dd HH:mm"));
            }
            Page.Form.DefaultButton = btnContinue.UniqueID;
            username = (string)Session["username"];
            usertype = (string)Session["usertype"];
            userID = (string)Session["userID"];
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkConfirm.Checked)
            {
                lblCheck.Visible = false;
                try
                {
                    string PickUp = txtAdLine1.Text + " " + txtAdLine2.Text;
                    string origin = PickUp;
                    string des = txtDes1.Text + " " + txtDes2.Text;
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
                    Session["distance"] = distance;
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
        protected void MinicabOption_SelectedIndexChanged(object sender, EventArgs e)
        {
            int luggageLimit = 0;
            switch (MinicabOption.SelectedValue)
            {
                case "1":
                    luggageLimit = 4;
                    break;
                case "2":
                    luggageLimit = 6;
                    break;
                case "3":
                    luggageLimit = 8;
                    break;
                default:
                    break;
            }
            LuggageLimit.Text = $"You can only bring {luggageLimit} luggage.";
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string DateTime = txtDateTime.Text;
            DateTime = DateTime.Replace("T", " ");
            if (checkConfirm.Checked)
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;

                lblCheck.Visible = false;
                Session["servicetype"] = lblServiceType.Text;
                Session["passengername"] = txtPassenger.Text;
                Session["pickup"] = txtAdLine1.Text + " " + txtAdLine2.Text;
                Session["destination"] = txtDes1.Text + " " + txtDes2.Text;
                Session["datetime"] = DateTime;
                Session["minicab"] = MinicabOption.SelectedItem.Text;
                Session["flightnumber"] = "-";
                Session["PreviousPage"] = Request.UrlReferrer.ToString();

                if (txtPassenger.Text != "" && txtAdLine1.Text != "" && txtDes1.Text != "" && txtDateTime.Text != "")
                {
                    Response.Redirect("Payment_details.aspx");
                }
                else
                {
                    string message = "Please input all values before proceeding";
                    string script = "if (window.confirm('" + message + "')) { window.location.href = 'Service.aspx'; }";
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