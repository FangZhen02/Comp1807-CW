﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Comp1807_Coursework.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron" style="background-image: url('<%= ResolveUrl("~/Resource/homepage.gif") %>'); background-size: cover; background-position: center; width: 100%; height: 100%;">
            <h1 style ="font-family: 'Copperplate Gothic'; text-align:center; font-weight: bold">PrivateHire</h1>
            <h2 class ="lead" style ="font-family: 'Copperplate Gothic'; text-align:center; color: white " >Your ride, your way <br /> let us take you where you need to go in comfort and style.</h2>
        </div>

    <div class ="row">
              <div class="col-md-6">
              <h2>Learn more about us</h2>
              <p>
              <a runat="server" class="btn btn-default" href="~/About">Click Here &raquo;</a> 
              </p>
              </div>

              <div class="col-md-6">
                  <h2>Book your trip</h2>
                  <p>
                      <a runat="server" class="btn btn-default" href="~/Booking">Click Here &raquo;</a>
                  </p>
              </div>              
              
          
    </div>
</asp:Content>
