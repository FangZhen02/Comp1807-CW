<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="Comp1807_Coursework.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Booking History</strong></h1>
    <div class="jumbotron">
        <div class="container">

            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>

            <br />

        </div>
        <div class="container">
            Cancel Booking<br />
            <br />
            Booking Number<br />
            <asp:DropDownList ID="ddlBookingID" runat="server" DataSourceID="SqlDataSource1" DataTextField="BookingDetailsID" DataValueField="BookingDetailsID" AutoPostBack="True" OnSelectedIndexChanged="ddlBookingID_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbltest" runat="server" ForeColor="Red"></asp:Label>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [BookingDetailsID] FROM [Booking] WHERE (([CustID] = ?) AND ([Status] = ?))">
                <SelectParameters>
                    <asp:SessionParameter Name="CustID" SessionField="userID" Type="Int32" />
                    <asp:Parameter DefaultValue="pending" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</asp:Content>
