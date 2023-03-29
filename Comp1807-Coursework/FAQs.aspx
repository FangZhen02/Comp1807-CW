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
            <asp:BulletedList ID="FAQs_list" runat="server" BulletStyle="Numbered" Font-Size="Large">
                <asp:ListItem>1st FAQ</asp:ListItem>
                <asp:ListItem>2st FAQ</asp:ListItem>
                <asp:ListItem>3st FAQ</asp:ListItem>
                <asp:ListItem>4st FAQ</asp:ListItem>
                <asp:ListItem>5st FAQ</asp:ListItem>
                <asp:ListItem>6st FAQ</asp:ListItem>
                <asp:ListItem>7st FAQ</asp:ListItem>
                <asp:ListItem>8st FAQ</asp:ListItem>
                <asp:ListItem>9st FAQ</asp:ListItem>
                <asp:ListItem>10st FAQ</asp:ListItem>
            </asp:BulletedList>
        </div>
    </div>

</asp:Content>
