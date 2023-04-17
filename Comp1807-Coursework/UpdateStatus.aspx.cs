using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Comp1807_Coursework
{
    public partial class UpdateStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/App_Data/COMP1807_CW.accdb");
            string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={dbPath};Persist Security Info=False;";

            using (OleDbConnection connection = new OleDbConnection(connString))
            {

                connection.Open();
                string query1 = "SELECT DriverID FROM Booking WHERE BookingDetailsID = " + DropDownList1.SelectedValue; ;
                OleDbCommand commandDriverID = new OleDbCommand(query1, connection);
                object resultDriver = commandDriverID.ExecuteScalar();
                string driverID = resultDriver.ToString();

                string query2 = "UPDATE Driver SET Availability = True WHERE DriverID = " + driverID;
                OleDbCommand commandUpdateDriver = new OleDbCommand(query2, connection);
                commandUpdateDriver.ExecuteNonQuery();

                string query3 = "SELECT RegistrationNum FROM Booking WHERE BookingDetailsID = " + DropDownList1.SelectedValue; ;
                OleDbCommand commandRegNum = new OleDbCommand(query3, connection);
                object resultRegNum = commandRegNum.ExecuteScalar();
                string RegNum = resultRegNum.ToString();

                string query4 = "UPDATE Minicab SET Availability = True WHERE RegistrationNum = @RegNum";
                OleDbCommand commandUpdateMinicab = new OleDbCommand(query4, connection);
                commandUpdateMinicab.Parameters.AddWithValue("@RegNum", RegNum);
                commandUpdateMinicab.ExecuteNonQuery();

                string query5 = "UPDATE Booking SET Status = 'Completed' WHERE BookingDetailsID = " + DropDownList1.SelectedValue;
                OleDbCommand commandUpdateStatus = new OleDbCommand(query5, connection);
                commandUpdateStatus.ExecuteNonQuery();

                connection.Close();
            }
            string message = "Status changed successfully";
            string script = "if (window.confirm('" + message + "')) { window.location.href = 'UpdateStatus.aspx'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
        }
    }
}