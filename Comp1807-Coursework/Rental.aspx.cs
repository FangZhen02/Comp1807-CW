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
    public partial class Rental : System.Web.UI.Page
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
                    string PickUp = txtPickup.Text;
                    string origin = PickUp;

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "initMap", $"initMap('{origin}');", true);
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
                Session["pickup"] = txtPickup.Text;
                Session["destination"] = "-";
                Session["date"] = txtDate.Text;
                Session["time"] = txtTime.Text;
                Session["totalpassenger"] = txtCapacity.Text;
                Session["minicab"] = MinicabOption.SelectedItem.Text;

                if (txtPickup.Text != "" && txtDate.Text != "" && txtTime.Text != "" && txtCapacity.Text != "")
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