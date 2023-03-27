<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="Comp1807_Coursework.AddDriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><br /></h1>
    <div class="row">
        <div class="col-md-6">
            <div class="container">
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="DriverID" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="185px" Width="425px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="DriverID" HeaderText="DriverID" InsertVisible="False" ReadOnly="True" SortExpression="DriverID" Visible="False" />
                        <asp:BoundField DataField="DriverName" HeaderText="DriverName" SortExpression="DriverName" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                        <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" Visible="False" />
                        <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" DeleteCommand="DELETE FROM [Driver] WHERE [DriverID] = ?" InsertCommand="INSERT INTO [Driver] ([DriverID], [DriverName], [Contact], [Rating], [BookingID]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [Driver]" UpdateCommand="UPDATE [Driver] SET [DriverName] = ?, [Contact] = ?, [Rating] = ?, [BookingID] = ? WHERE [DriverID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="DriverID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DriverID" Type="Int32" />
                        <asp:Parameter Name="DriverName" Type="String" />
                        <asp:Parameter Name="Contact" Type="Int32" />
                        <asp:Parameter Name="Rating" Type="String" />
                        <asp:Parameter Name="BookingID" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DriverName" Type="String" />
                        <asp:Parameter Name="Contact" Type="Int32" />
                        <asp:Parameter Name="Rating" Type="String" />
                        <asp:Parameter Name="BookingID" Type="String" />
                        <asp:Parameter Name="DriverID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>


        <div class="col-md-6">
            <h1><strong>Add new driver</strong></h1>
            <div class="jumbotron">
                <div class="container">
                    <div class="col-md-6">
                        <h4>Driver Name</h4>
                        <asp:TextBox ID="txtDriverName" runat="server" CssClass="form-control mb-4" Width="170px" ValidationGroup="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDriverName" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h4>Contact</h4>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control mb-4" Width="167px" ValidationGroup="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContact" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblExists" runat="server" ForeColor="Red" Text="Contact already exist" Visible="False"></asp:Label>
                        <br />
                    </div>
                    <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" Width="100%" OnClick="btnAdd_Click" ValidationGroup="1"/>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
