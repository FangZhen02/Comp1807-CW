<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="Comp1807_Coursework.FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1><strong>Inquiries</strong></h1><br />
        <p>Brief explainatoin about the page</p>

    </div>
    <hr style="border: none; border-top: 2px solid black;" />

    <div class="container">
        <h2>Frequent Asked Questions (FAQs)</h2><br />
        <div class="container">
            <ul style="font-size:large">
                <li><asp:HyperLink runat="server" Text="Link 1" NavigateUrl="~/Page1.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 2" NavigateUrl="~/Page2.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 3" NavigateUrl="~/Page3.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 4" NavigateUrl="~/Page4.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 5" NavigateUrl="~/Page5.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 6" NavigateUrl="~/Page6.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 7" NavigateUrl="~/Page7.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 8" NavigateUrl="~/Page8.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 9" NavigateUrl="~/Page9.aspx" /></li>
                <li><asp:HyperLink runat="server" Text="Link 10" NavigateUrl="~/Page10.aspx" /></li>
            </ul>
        </div>
    </div>

    <hr style="border: none; border-top: 2px solid black;" />

    <div class="row">
        <div class="col-md-4">
            <div class="jumbotron">
                <p>For further enquiries please contact:</p>
                <ul>
                    <li>Email: 
                        <asp:HyperLink ID="EmailLink" runat="server" NavigateUrl="mailto:example@example.com" Text="example@example.com"></asp:HyperLink>
                    </li>
                    <li>Phone: 
                        <asp:Label ID="PhoneLabel" runat="server" Text="123-456-7890"></asp:Label>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
