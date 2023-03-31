using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp1807_Coursework
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void local_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Service.aspx");
        }

        protected void rental_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Rental.aspx");
        }

        protected void airports_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Airport.aspx");
        }

        protected void hotelTransfer_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HotelTransfer.aspx");
        }

        protected void meetGreet_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Meet_Greet.aspx");
        }
    }
}