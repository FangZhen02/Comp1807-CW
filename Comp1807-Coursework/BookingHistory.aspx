<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="Comp1807_Coursework.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Booking History</strong></h1>
    <div class="jumbotron">
        <div class="container">

            <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" CssClass="table table-bordered table-striped">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>

            <br />

            <br />

        </div>
        <div class="container">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" Text="Cancel booking"></asp:Label>
            <br />
            <br />
            Booking Number<br />
            <asp:DropDownList ID="ddlBookingID" runat="server" DataSourceID="SqlDataSource1" DataTextField="BookingDetailsID" DataValueField="BookingDetailsID" AutoPostBack="True" OnSelectedIndexChanged="ddlBookingID_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel booking" CssClass="btn btn-primary" Width="120px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbltest" runat="server" ForeColor="Red"></asp:Label>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [BookingDetailsID] FROM [Booking] WHERE (([CustID] = ?) AND ([Status] = ?))">
                <SelectParameters>
                    <asp:SessionParameter Name="CustID" SessionField="userID" Type="Int32" />
                    <asp:Parameter DefaultValue="pending" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" Text="Modify time"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            Booking number<br />
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="BookingDetailsID" DataValueField="BookingDetailsID">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDateTime" runat="server" type="datetime-local" CssClass="form-control mb-4"></asp:TextBox>
            <br />
&nbsp;<asp:Button ID="btnChangeTime" runat="server"  OnClick="btnChangeTime_Click" Text="Change date/time" CssClass="btn btn-primary" Width="140px" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>" SelectCommand="SELECT [BookingDetailsID] FROM [Booking] WHERE (([CustID] = ?) AND ([Status] = ?))">
                <SelectParameters>
                    <asp:SessionParameter Name="CustID" SessionField="userid" Type="Int32" />
                    <asp:Parameter DefaultValue="pending" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
