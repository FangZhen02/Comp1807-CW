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


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CheckMap_Click(object sender, EventArgs e)
        {
            try
            {
                string origin = txtPickUp.Text;
                string destination = txtDestination1.Text;

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

                Page.ClientScript.RegisterStartupScript(this.GetType(), "initMap", "initMap();", true);
            }
            catch (Exception ex)
            {
                // Handle the exception by displaying an error message to the user
                lblTesting.Text = ex.Message;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }
    }
}