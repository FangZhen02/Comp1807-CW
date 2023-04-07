using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class Payment_details : System.Web.UI.Page
    {
        public string username;
        public string usertype;
        public string userID;
        private string driverID;
        private string minicabID;
        private string bookingID;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnpay.UniqueID;
            username = (string)Session["username"];
            usertype = (string)Session["usertype"];
            userID = (string)Session["userID"];

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

                if(usertype == "customer")
                {
                    double discountOnline = 15;
                    lblDiscount.Text = discountOnline + "%";
                    double grandTotal = totalAmount * (1 - (discountOnline / 100));
                    grandTotal = Math.Round(grandTotal, 2);
                    lblGrandTotal.Text = "£" + grandTotal.ToString();
                }
                else
                {
                    double discountOnline = 0;
                    lblDiscount.Text = discountOnline + "%";
                    double grandTotal = totalAmount * (1 - (discountOnline / 100));
                    grandTotal = Math.Round(grandTotal, 2);
                    lblGrandTotal.Text = "£" + grandTotal.ToString();
                }

            }
            else
            {
                lblTotalAmount.Text = "£200";
                double discountOnline = 15;
                lblDiscount.Text = discountOnline + "%";
                double grandTotal = 200 * (1 - (discountOnline / 100));
                grandTotal = Math.Round(grandTotal, 2);
                lblGrandTotal.Text = "£" + grandTotal.ToString();
            }
        }

        protected void changeLink_Click(object sender, EventArgs e)
        {
            string previousPageUrl = Session["PreviousPage"].ToString();
            Response.Redirect(previousPageUrl);
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            
            if(radioPayMethod.SelectedValue == "Paypal")
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;

                Session["servicetype"] = lblService.Text;
                Session["passengername"] = lblPassengerName.Text;
                Session["distance"] = lblDistance.Text;
                Session["pickup"] = PickUp.Text;
                Session["destination"] = Destination.Text;
                Session["date"] = Date.Text;
                Session["time"] = Time.Text;
                Session["minicab"] = minicab.Text;
                Session["flightnumber"] = lblFlight.Text;
                Session["totalprice"] = lblGrandTotal.Text;

                string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
                string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

                using (OleDbConnection connection = new OleDbConnection(connString))
                {
                    //get 1st driver who is available
                    connection.Open();

                    string query2 = "SELECT TOP 1 DriverID FROM Driver WHERE Availability = True";
                    OleDbCommand commandDriverID = new OleDbCommand(query2, connection);
                    object resultDriver = commandDriverID.ExecuteScalar();
                    driverID = resultDriver.ToString();
                    Session["driverID"] = driverID;

                    //set the driver's availability to no
                    string query3 = "UPDATE Driver SET Availability = False WHERE DriverID = " + driverID;
                    OleDbCommand commandDriverAvail = new OleDbCommand(query3, connection);
                    commandDriverAvail.ExecuteNonQuery();

                    //get 1st minicab which is available
                    string query4 = "SELECT TOP 1 RegistrationNum FROM Minicab WHERE Availability = True";
                    OleDbCommand commandminicabID = new OleDbCommand(query4, connection);
                    object resultMinicab = commandminicabID.ExecuteScalar();
                    minicabID = resultMinicab.ToString();
                    Session["minicabID"] = minicabID;

                    //set the minicab's availability to no
                    string query5 = "UPDATE Minicab SET Availability = False WHERE RegistrationNum = '" + minicabID + "'";
                    OleDbCommand commandMinicabAvail = new OleDbCommand(query5, connection);
                    commandMinicabAvail.ExecuteNonQuery();

                    //insert record to booking table
                    string query6 = "INSERT INTO [Booking] ([PasName], [CustID], [Date], [Time], [Service], [PickUp], [Destination], [FlightNumber], [Status], [DriverID], [RegistrationNum]) VALUES " + "(@PasName, @CustID, @Date, @Time, @Service, @PickUp, @Destination, @FlightNumber, @Status, @DriverID, @RegNum)";
                    OleDbCommand cmd = new OleDbCommand(query6, connection);

                    cmd.Parameters.AddWithValue("@PasName", lblPassengerName.Text);
                    cmd.Parameters.AddWithValue("@CustID", userID);
                    cmd.Parameters.AddWithValue("@Date", Date.Text);
                    cmd.Parameters.AddWithValue("@Time", Time.Text);
                    cmd.Parameters.AddWithValue("@Service", lblService.Text);
                    cmd.Parameters.AddWithValue("@PickUp", PickUp.Text);
                    cmd.Parameters.AddWithValue("@Destination", Destination.Text);
                    cmd.Parameters.AddWithValue("@FlightNumber", lblFlight.Text);
                    cmd.Parameters.AddWithValue("@Status", "pending");
                    cmd.Parameters.AddWithValue("@DriverID", driverID);
                    cmd.Parameters.AddWithValue("@RegNum", minicabID);

                    cmd.ExecuteNonQuery();

                    //get the latest bookingID using the userID
                    string query7 = "SELECT BookingDetailsID FROM Booking WHERE BookingDetailsID = (SELECT MAX(BookingDetailsID) FROM Booking) AND CustID = " + Convert.ToInt32(userID);
                    OleDbCommand commandbookingID = new OleDbCommand(query7, connection);
                    object resultBookingID = commandbookingID.ExecuteScalar();
                    bookingID = resultBookingID.ToString();
                    Session["bookingID"] = bookingID;

                    //insert into payment table
                    string query8 = "INSERT INTO [Payment] ([PaymentMethod], [TotalAmount], [PaymentDate], [BookingDetailsID]) VALUES " + "(@PaymentMethod, @TotalAmount, @PaymentDate, @BookingID)";
                    OleDbCommand cmdPayment = new OleDbCommand(query8, connection);

                    string currentDate = DateTime.Today.ToString("dd-MM-yyyy");

                    cmdPayment.Parameters.AddWithValue("@PaymentMethod", "Paypal");         //no records are being inserted into payment table, check datatype
                    cmdPayment.Parameters.AddWithValue("@TotalAmount", lblGrandTotal.Text);
                    cmdPayment.Parameters.AddWithValue("@PaymentDate", currentDate);
                    cmdPayment.Parameters.AddWithValue("@BookingID", bookingID);

                    cmdPayment.ExecuteNonQuery();

                    connection.Close();
                }


                string message = "Payment Successfull";
                string script = "if (window.confirm('" + message + "')) { window.location.href = 'BookingConfirm.aspx'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
            }
            else
            {
                Session["username"] = username;
                Session["usertype"] = usertype;
                Session["userID"] = userID;

                string message = "Payment Unsuccessfull. Please try again";
                string script = "if (window.confirm('" + message + "')) { window.location.href = 'Booking.aspx'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
            }
            
        }
    }
}