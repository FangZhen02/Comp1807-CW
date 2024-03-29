﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Airport.aspx.cs" Inherits="Comp1807_Coursework.Airport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUa8oJZsriD3FtB316C6IMPvqVmK7cFZU"></script>
    <script type="text/javascript">
        function initMap() {

            var origin = document.getElementById('<%= txtAdLine1.ClientID %>').value + document.getElementById('<%= txtAdLine2.ClientID %>').value;
            var dropdown2 = document.getElementById('<%= AirportOption.ClientID %>');
            var selectedOption2 = dropdown2.options[dropdown2.selectedIndex];
            var destination = selectedOption2.text;


            var geocoder = new google.maps.Geocoder();

            // Geocode the origin and destination addresses to get their latitude and longitude
            geocoder.geocode({ address: origin }, function (results, status) {
                if (status === 'OK') {
                    var originLatLng = results[0].geometry.location;
                    geocoder.geocode({ address: destination }, function (results, status) {
                        if (status === 'OK') {
                            var destLatLng = results[0].geometry.location;

                            // Create a LatLngBounds object containing the markers
                            var bounds = new google.maps.LatLngBounds();
                            bounds.extend(originLatLng);
                            bounds.extend(destLatLng);

                            // Calculate the average latitude and longitude of the origin and destination
                            var centerLatLng = {
                                lat: (originLatLng.lat() + destLatLng.lat()) / 2,
                                lng: (originLatLng.lng() + destLatLng.lng()) / 2
                            };

                            // Create the map centered at the average latitude and longitude
                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 10,
                                center: centerLatLng
                            });

                            // Add markers for the origin and destination
                            var originMarker = new google.maps.Marker({
                                position: originLatLng,
                                map: map,
                                title: 'Origin'
                            });

                            var destMarker = new google.maps.Marker({
                                position: destLatLng,
                                map: map,
                                title: 'Destination'
                            });

                            map.fitBounds(bounds);
                        }
                        else {
                            alert('Geocode was not successful for the following reason: ' + status);
                        }
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
        function validateDateTime() {
            var inputDate = new Date($('#<%= txtDateTime.ClientID %>').val());
            var currentDate = new Date();

            // Check if the selected date and time is less than the current date and time
            if (inputDate < currentDate) {
                $('#<%= lblError.ClientID %>').text('Please select a date and time that is greater than or equal to the current date and time.');
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }

    </script>

    <h1><strong>
        <asp:Label ID="lblServiceType" runat="server" Text="Airport Service"></asp:Label>
        </strong></h1>
    <div class="row">
        <div class="col-md-6">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron">
                <div class="col-md-12">
                        <h4><strong>Passenger name</strong></h4>
                        <asp:TextBox ID="txtPassenger" runat="server" CssClass="form-control mb-12"></asp:TextBox><br />
                    </div>
                <div>
                    <div class="container">
                     <h4><strong>Pick up</strong></h4>
                    <div class="col-md-6">
                        <h4>Address line 1</h4><br />
                        <asp:TextBox ID="txtAdLine1" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    <div class="col-md-6">
                        <h4>Address line 2</h4><strong>Optional</strong>
                        <asp:TextBox ID="txtAdLine2" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="container">
                    <h4><strong>Destination</strong></h4>
                    <asp:DropDownList ID="AirportOption" runat="server" CssClass="form-control mb-4">
                        <asp:ListItem Text="London Heathrow Airport (LHR)" Value="1"></asp:ListItem>
                        <asp:ListItem Text="London Gatwick Airport (LGW)"></asp:ListItem>
                        <asp:ListItem Text="London Stansted Airport (STN)"></asp:ListItem>
                        <asp:ListItem Text="London Luton Airport (LTN)"></asp:ListItem>
                        <asp:ListItem Text="London Sounthend Airport (SEN)"></asp:ListItem>
                        <asp:ListItem Text="London City Airport (LCY)"></asp:ListItem>
                    </asp:DropDownList><br />
                    </div>
                </div>
                <div class="text-center">
                        <asp:CheckBox ID="checkConfirm" runat="server" AutoPostBack="True" Text="I am sure with the address" OnCheckedChanged="checkConfirm_CheckedChanged" /><br />
                        <asp:Label ID="lblCheck" runat="server" ForeColor="Red" Text="Check this to proceed" Visible="False"></asp:Label>
                    </div>
                <div class="col-md-12">
                <asp:TextBox ID="txtDateTime" runat="server" type="datetime-local" CssClass="form-control mb-4">
                </asp:TextBox>                
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="col-md-6">
                    <h4>Minicab</h4>
                    <asp:DropDownList ID="MinicabOption" runat="server" CssClass="form-control mb-4" OnSelectedIndexChanged="MinicabOption_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="4 seater" Value="1"></asp:ListItem>
                        <asp:ListItem Text="6 seater" Value="2"></asp:ListItem>
                        <asp:ListItem Text="8 seater" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="LuggageLimit" runat="server" ForeColor="Red">You can only bring 4 luggage</asp:Label><br /><br /><br />
                </div>
                
                <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnNext" runat="server" Text="Continue" CssClass="btn btn-primary" Width="100%" OnClick="btnLogin_Click" OnClientClick="return validateDateTime();"/>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:Label ID="lblTesting" runat="server" Text=""></asp:Label>
        </div>
        <div id="map" style="width: 400px; height: 400px;"></div>
    </div>
</asp:Content>
