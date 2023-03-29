<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hoteltransfer.aspx.cs" Inherits="Comp1807_Coursework.Hoteltransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUa8oJZsriD3FtB316C6IMPvqVmK7cFZU"></script>
    <script type="text/javascript">
        function initMap() {

            var dropdown1 = document.getElementById('<%= AirportOption.ClientID %>');
            var selectedOption1 = dropdown1.options[dropdown1.selectedIndex];
            var origin = selectedOption1.text;
            var dropdown2 = document.getElementById('<%= HotelOption.ClientID %>');
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
    </script>
    <h1><strong>Hotel Transfer Service</strong></h1>
    <div class="row">
        <div class="col-md-6">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron">
                <div class="col-md-6">
                    <h4>Pick up</h4>
                    <asp:DropDownList ID="AirportOption" runat="server" CssClass="form-control mb-4">
                        <asp:ListItem Text="London Heathrow Airport (LHR)" Value="1"></asp:ListItem>
                        <asp:ListItem Text="London Gatwick Airport (LGW)" Value="2"></asp:ListItem>
                        <asp:ListItem Text="London Stansted Airport (STN)" Value="3"></asp:ListItem>
                        <asp:ListItem Text="London Luton Airport (LTN)" Value="4"></asp:ListItem>
                        <asp:ListItem Text="London Sounthend Airport (SEN)" Value="5"></asp:ListItem>
                        <asp:ListItem Text="London City Airport (LCY)" Value="6"></asp:ListItem>
                    </asp:DropDownList><br />
                </div>
                <div class="col-md-6">
                    <h4>Hotel</h4>
                    <asp:DropDownList ID="HotelOption" runat="server" CssClass="form-control mb-4">
                        <asp:ListItem Text="Hilton London Heathrow Airport" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Copthorne Hotel London Gatwick (LGW)" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Novotel London Stansted Airport (STN)" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Courtyard by Marriott Luton Airport (LTN)" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Skylark Hotel, Aviation Way" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Good Hotel London (LCY)" Value="6"></asp:ListItem>
                    </asp:DropDownList><br />
                </div>
                <div class="text-center">
                        <asp:CheckBox ID="checkConfirm" runat="server" AutoPostBack="True" Text="I am sure with the address" OnCheckedChanged="checkConfirm_CheckedChanged" />
&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblCheck" runat="server" ForeColor="Red" Text="Check this to proceed" Visible="False"></asp:Label>
                    </div>
                <div class="col-md-6">
                    <h4>Date</h4>
                    <asp:TextBox ID="txtDate" type="date" runat="server" CssClass="form-control mb-4"></asp:TextBox><br /> <%-- need to add a new line of code for the calendar --%>
                </div>
                <div class="col-md-6">
                    <h4>Time</h4>
                    <asp:TextBox ID="txtTime" type="time" runat="server" CssClass="form-control mb-4"></asp:TextBox><br /> <%-- need to add a new line of code for the calendar --%>
                </div>
                <div class="col-md-6">
                    <h4>Total passenger</h4>
                    <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control mb-4" TextMode="Number" max="8" min="1"></asp:TextBox><br />
                </div>
                <div class="col-md-6">
                    <h4>Minicab</h4>
                    <asp:DropDownList ID="MinicabOption" runat="server" CssClass="form-control mb-4">
                        <asp:ListItem Text="4 seater" Value="1"></asp:ListItem>
                        <asp:ListItem Text="6 seater" Value="2"></asp:ListItem>
                        <asp:ListItem Text="8 seater" Value="3"></asp:ListItem>
                    </asp:DropDownList><br />
                </div>
                <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btn btn-primary" Width="100%" OnClick="btnContinue_Click"/>
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
