<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMinicab.aspx.cs" Inherits="Comp1807_Coursework.AddMinicab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><br /></h1>
    <div class="row">
        <div class="col-md-6">
            <div class="container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RegistrationNumber" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="176px" Width="525px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="RegistrationNumber" HeaderText="RegistrationNumber" InsertVisible="False" ReadOnly="True" SortExpression="RegistrationNumber" />
                        <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                        <asp:BoundField DataField="SeatSize" HeaderText="SeatSize" SortExpression="SeatSize" />
                        <asp:CheckBoxField DataField="Availability" HeaderText="Availability" SortExpression="Availability" Visible="False" />
                        <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" Visible="False" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" DeleteCommand="DELETE FROM [Minicab] WHERE [RegistrationNumber] = ?" InsertCommand="INSERT INTO [Minicab] ([RegistrationNumber], [Colour], [Brand], [SeatSize], [Availability], [BookingID]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [Minicab]" UpdateCommand="UPDATE [Minicab] SET [Colour] = ?, [Brand] = ?, [SeatSize] = ?, [Availability] = ?, [BookingID] = ? WHERE [RegistrationNumber] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="RegistrationNumber" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RegistrationNumber" Type="Int32" />
                        <asp:Parameter Name="Colour" Type="String" />
                        <asp:Parameter Name="Brand" Type="String" />
                        <asp:Parameter Name="SeatSize" Type="Int32" />
                        <asp:Parameter Name="Availability" Type="Boolean" />
                        <asp:Parameter Name="BookingID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Colour" Type="String" />
                        <asp:Parameter Name="Brand" Type="String" />
                        <asp:Parameter Name="SeatSize" Type="Int32" />
                        <asp:Parameter Name="Availability" Type="Boolean" />
                        <asp:Parameter Name="BookingID" Type="Int32" />
                        <asp:Parameter Name="RegistrationNumber" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>

         
        <div class="col-md-6">
           <h1><strong>Add new Minicab</strong></h1>
            <div class="jumbotron">
                <div class="container">
                    <div class="col-md-6">
                        <h4>Registration Number</h4>
                        <asp:TextBox ID="txtRegistration" runat="server" CssClass="form-control mb-4" ValidationGroup="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRegistration" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h4>Color</h4>
                        <asp:TextBox ID="txtColor" runat="server" CssClass="form-control mb-4" ValidationGroup="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtColor" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h4>Brand</h4>
                        <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control mb-4" ValidationGroup="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBrand" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6" style="left: 2px; top: 0px">
                        <h4>Seat Size</h4>
                        <asp:TextBox ID="txtSeatSize" runat="server" CssClass="form-control mb-4" ValidationGroup="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSeatSize" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblExists" runat="server" ForeColor="Red" Text="Minicab already exists" Visible="False"></asp:Label>
                        <br />
                    </div>
                    <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" Width="100%" OnClick="btnAdd_Click" UseSubmitBehavior="False" ValidationGroup="2"/>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
