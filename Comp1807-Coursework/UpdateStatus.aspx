<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateStatus.aspx.cs" Inherits="Comp1807_Coursework.UpdateStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Update Booking Status</strong></h1>
    <div><h2>Booking table</h2></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="BookingDetailsID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="PasName" HeaderText="Passenger Name" SortExpression="PasName" />
            <asp:BoundField DataField="DateTime" HeaderText="Date/Time" SortExpression="DateTime" />
            <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="RegistrationNum" HeaderText="Car Number" SortExpression="RegistrationNum" />
            <asp:BoundField DataField="BookingDetailsID" HeaderText="Booking ID" SortExpression="BookingDetailsID" InsertVisible="False" ReadOnly="True" />
        </Columns>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>" SelectCommand="SELECT [PasName], [DateTime], [Service], [Status], [RegistrationNum], [BookingDetailsID] FROM [Booking] WHERE ([Status] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="pending" Name="Status" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <div><h3>Complete booking status : </h3>
        <p>&nbsp;</p>
        <p>Booking number</p>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="BookingDetailsID" DataValueField="BookingDetailsID">
            </asp:DropDownList>
        </p>
        <p>&nbsp;</p>
        <p>
                    <asp:Button ID="btnUpdateStatus" runat="server" Text="Change" CssClass="btn btn-primary btn-lg" Width="125px" Height="46px" OnClick="btnUpdateStatus_Click"/>
        </p></div>
</asp:Content>
