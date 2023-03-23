<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="Comp1807_Coursework.AddDriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><br /></h1>
    <div class="row">
        <div class="col-md-6">
            <div class="container">
                
                <asp:Table ID="Table1" runat="server" Height="293px" Width="308px">
                    <asp:TableRow runat="server" BackColor="#99CCFF" BorderStyle="Solid">
                        <asp:TableCell runat="server" BorderStyle="Solid">Driver ID</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">Driver Name</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">Contact</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" BackColor="#CC99FF" BorderStyle="Solid">
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" BackColor="#66CCFF" BorderStyle="Solid">
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>


        <div class="col-md-6">
            <h1><strong>Add new driver</strong></h1>
            <div class="jumbotron">
                <div class="container">
                    <div class="col-md-6">
                        <h4>Driver Name</h4>
                        <asp:TextBox ID="txtDriverName" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    <div class="col-md-6">
                        <h4>Contact</h4>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" Width="100%"/>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
