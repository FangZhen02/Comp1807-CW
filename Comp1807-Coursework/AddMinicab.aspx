<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="Comp1807_Coursework.AddDriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><br /></h1>
    <div class="row">
        <div class="col-md-6">
            <div class="container">
                
                <asp:Table ID="Addminicab" runat="server" Height="293px" Width="447px">
                    <asp:TableRow runat="server" BackColor="#99CCFF" BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle">
                        <asp:TableCell runat="server" BorderStyle="Solid">Reg. No.</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">Color</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">Brand</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">Seat Size</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" BackColor="#CC99FF" BorderStyle="Solid">
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" BackColor="#66CCFF" BorderStyle="Solid">
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                        <asp:TableCell runat="server" BorderStyle="Solid">***</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>

         
        <div class="col-md-6">
           <h1><strong>Add new Minicab</strong></h1>
            <div class="jumbotron">
                <div class="container">
                    <div class="col-md-6">
                        <h4>Color</h4>
                        <asp:TextBox ID="txtColor" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    <div class="col-md-6">
                        <h4>Brand</h4>
                        <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    <div class="col-md-6">
                        <h4>Seat Size</h4>
                        <asp:TextBox ID="txtSeatSize" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
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
