﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Globalization;

namespace Comp1807_Coursework
{
    
    public partial class BookingHistory : System.Web.UI.Page
    {
        private string userID;
        private string usertype;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = (string)Session["userID"];
            usertype = (string)Session["usertype"];

            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

            string query = "SELECT [Booking.BookingDetailsID] as [Booking ID], [Booking.PasName] as [Passenger Name], [DateTime] as [Date/Time], [Service], [PickUp] as [Pick Up], [Destination], [FlightNumber] as [Flight number], [Status], [Booking.RegistrationNum] as [Car number], [Minicab.Colour] as [Colour], [Minicab.Brand] as [Brand], [Driver.DriverName] as [Driver]" +
                           "FROM ((Booking INNER JOIN Minicab ON Booking.RegistrationNum = Minicab.RegistrationNum) " +
                           "INNER JOIN Driver ON Booking.DriverID = Driver.DriverID) " +
                           "WHERE Booking.CustID = @UserID";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {
                OleDbCommand command = new OleDbCommand(query, connection);
                command.Parameters.AddWithValue("@UserID", userID); 
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }

            //Page.Form.DefaultButton = txtDateTime.UniqueID;
            if (!IsPostBack)
            {
                DateTime minDateTime = DateTime.Now.AddHours(24);
                DateTime maxDateTime = DateTime.Now.AddDays(90);

                txtDateTime.Attributes.Add("min", minDateTime.ToString("yyyy-MM-dd HH:mm"));
                txtDateTime.Attributes.Add("max", maxDateTime.ToString("yyyy-MM-dd HH:mm"));
            }

        }



        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

            string query2 = "SELECT * FROM Booking WHERE BookingDetailsID = @BookingID";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {
                OleDbCommand command = new OleDbCommand(query2, connection);
                command.Parameters.AddWithValue("@BookingID", ddlBookingID.SelectedValue);
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                DataTable dataTable2 = new DataTable();
                adapter.Fill(dataTable2);

                if (dataTable2.Rows.Count > 0)
                {
                    DateTime bookingDate = DateTime.Parse(dataTable2.Rows[0]["DateTime"].ToString());
                    string date1 = bookingDate.ToShortDateString();

                    DateTime bookingDateTime = DateTime.Parse(date1);
                    TimeSpan timeDifference = DateTime.Now.Subtract(bookingDateTime);


                    // Check if the booking is more than 24 hours ago
                    if (timeDifference.TotalDays > -1)
                    {
                        // Update the value of the "Status" column to "Refunded"

                        string query3 = "UPDATE Booking SET Status = 'Refund 70%' WHERE BookingDetailsID = @BookingID";

                        using (OleDbConnection connection3 = new OleDbConnection(connString))
                        {
                            OleDbCommand command3 = new OleDbCommand(query3, connection3);
                            command3.Parameters.AddWithValue("@BookingID", ddlBookingID.SelectedValue);

                            connection3.Open();
                            command3.ExecuteNonQuery();
                            connection3.Close();
                        }
                        
                    }
                    else 
                    {
                        // Update the value of the "Status" column to "Cancelled"

                        string query4 = "UPDATE Booking SET Status = 'Refund 100%' WHERE BookingDetailsID = @BookingID";

                        using (OleDbConnection connection2 = new OleDbConnection(connString))
                        {
                            OleDbCommand command2 = new OleDbCommand(query4, connection2);
                            command2.Parameters.AddWithValue("@BookingID", ddlBookingID.SelectedValue);

                            connection2.Open();
                            command2.ExecuteNonQuery();
                            connection2.Close();
                        }
                    }
                    string message = "Cancellation made successfully";
                    string script = "if (window.confirm('" + message + "')) { window.location.href = 'BookingHistory.aspx'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
                }
            }
        }

        protected void ddlBookingID_SelectedIndexChanged(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

            string query2 = "SELECT * FROM Booking WHERE BookingDetailsID = @BookingID";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {
                OleDbCommand command = new OleDbCommand(query2, connection);
                command.Parameters.AddWithValue("@BookingID", ddlBookingID.SelectedValue);
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                DataTable dataTable2 = new DataTable();
                adapter.Fill(dataTable2);

                if (dataTable2.Rows.Count > 0)
                {
                    DateTime bookingDate = DateTime.Parse(dataTable2.Rows[0]["DateTime"].ToString());
                    string date1 = bookingDate.ToShortDateString();

                    DateTime bookingDateTime = DateTime.Parse(date1);
                    TimeSpan timeDifference = DateTime.Now.Subtract(bookingDateTime);


                    // Check if the booking is more than 24 hours ago
                    if (timeDifference.TotalDays > -1)
                    {
                        lbltest.Text = "*** Note that the selected booking has less than 24 hours time. If you wish to cancel, only 70% of the amount will be refunded";
                    }
                    else
                    {
                        lbltest.Text = "*** Note that the selected booking has more than 24 hours time. If you wish to cancel, 100% of the amount will be refunded";
                    }
                }
            }
        }

        protected void btnChangeTime_Click(object sender, EventArgs e)
        {
            string bookingID = DropDownList1.SelectedValue;
            string DateTime = txtDateTime.Text;
            DateTime = DateTime.Replace("T", " ");


            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

            string query3 = "UPDATE Booking SET [DateTime] = @NewTime WHERE BookingDetailsID = @BookingID";

            using (OleDbConnection connection3 = new OleDbConnection(connString))
            {
                OleDbCommand command3 = new OleDbCommand(query3, connection3);
                command3.Parameters.AddWithValue("@NewTime", DateTime);
                command3.Parameters.AddWithValue("@BookingID", DropDownList1.SelectedValue);

                connection3.Open();
                command3.ExecuteNonQuery();
                connection3.Close();
            }

            string message = "Changes made successfully";
            string script = "if (window.confirm('" + message + "')) { window.location.href = 'BookingHistory.aspx'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);


        }
    }
}