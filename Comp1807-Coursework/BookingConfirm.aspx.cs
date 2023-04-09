using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Drawing;
using System.Drawing.Printing;

namespace Comp1807_Coursework
{
    public partial class BookingConfirm : System.Web.UI.Page
    {

        public string username;
        public string usertype;
        public string userID;
        private string driverID;
        private string minicabID;
        private string bookingID;

        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)Session["username"];
            usertype = (string)Session["usertype"];
            userID = (string)Session["userID"];
            bookingID = (string)Session["bookingID"];

            lblService.Text = (string)Session["servicetype"];
            lblPassengerName.Text = (string)Session["passengername"];
            lblFlight.Text = (string)Session["flightnumber"];
            PickUp.Text = (string)Session["pickup"];
            Destination.Text = (string)Session["destination"];
            Date.Text = (string)Session["datetime"];
            minicab.Text = (string)Session["minicab"];
            lblDistance.Text = (string)Session["distance"];
            lblTotal.Text = (string)Session["totalprice"];

            driverID = (string)Session["driverID"];
            minicabID = (string)Session["minicabID"];

            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {
                string query = "SELECT Brand, Colour FROM Minicab WHERE RegistrationNum = '" + minicabID + "'";
                OleDbCommand commandMinicab = new OleDbCommand(query, connection);

                connection.Open();
                OleDbDataReader reader = commandMinicab.ExecuteReader();

                while (reader.Read())
                {
                    // Get values from the columns and assign them to variables
                    lblMinicab.Text = reader["Brand"].ToString();
                    lblMiniColor.Text = reader["Colour"].ToString();
                    lblMiniNumber.Text = minicabID;
                }

                reader.Close();

                string query2 = "SELECT DriverName FROM Driver WHERE DriverID = " + driverID;
                OleDbCommand commandDriverID = new OleDbCommand(query2, connection);
                object resultDriver = commandDriverID.ExecuteScalar();
                string driverName = resultDriver.ToString();
                lblDriver.Text = driverName;

                connection.Close();
            }
            
        }

        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            // Get the graphics object
            Graphics g = e.Graphics;

            // Get the font to use for printing
            Font font = new Font("Arial", 10);

            // Set the position of the first line of text
            int yPos = 100;

            // Print the details
            g.DrawString("Service Type: " + lblService.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Passenger Name: " + lblPassengerName.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Pick Up: " + PickUp.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Destination: " + Destination.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Date: " + Date.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Minicab: " + minicab.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Distance: " + lblDistance.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Flight number: " + lblFlight.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Driver name: " + lblDriver.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Minicab model: " + lblMinicab.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Minicab colour: " + lblMiniColor.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Number plate: " + lblMiniNumber.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
            g.DrawString("Total price: " + lblTotal.Text, font, Brushes.Black, 100, yPos);
            yPos += 20;
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            PrintDocument pd = new PrintDocument();

            // Set the PrintPage event handler
            pd.PrintPage += new PrintPageEventHandler(printDocument1_PrintPage);

            // Print the document
            pd.Print();
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            Session["userID"] = userID;
            Response.Redirect("BookingHistory.aspx");
        }
    }
}