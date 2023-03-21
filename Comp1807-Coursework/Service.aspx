<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="Comp1807_Coursework.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUa8oJZsriD3FtB316C6IMPvqVmK7cFZU"></script>
    <script type="text/javascript">
        function initMap() {
            var origin = document.getElementById('<%= txtPickUp.ClientID %>').value;
            var destination = document.getElementById('<%= txtDestination.ClientID %>').value;

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

                            // Fit the map to the bounds
                            map.fitBounds(bounds);
                        } else {
                            alert('Geocode was not successful for the following reason: ' + status);
                        }
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
    </script>

    <h1><strong>Transport Service</strong></h1>

    <div class="row">
        <div class="col-md-6">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron">
                <div class="col-md-6">
                    <h4>Pick up</h4>
                    <asp:TextBox ID="txtPickUp" runat="server" Height="33px" Width="200px"></asp:TextBox>
                    <br />
                </div>
                <div class="col-md-6">
                    <h4>Destination</h4>
                    <asp:TextBox ID="txtDestination" runat="server" Height="33px" Width="200px"></asp:TextBox>
                    <br />
                </div>
                <div class="col-md-6">
                    <h4>Time</h4>
                    <asp:TextBox ID="txtTime" runat="server" Height="33px" Width="200px"></asp:TextBox>
                    <br />
                </div>
                <div class="col-md-6">
                    <h4>Capacity</h4>
                    <asp:TextBox ID="txtCapacity" runat="server" Height="33px" Width="200px"></asp:TextBox>
                    <br />
                </div>
                <div class="col-md-6">
                    <h4>Additional Remarks</h4>
                    <asp:TextBox ID="txtRemark" runat="server" Height="33px" Width="200px"></asp:TextBox>
                    <br />
                </div>
                <div class="col-md-6">
                    <h4>...</h4>
                    <asp:TextBox ID="txtExtra" runat="server" Height="33px" Width="200px"></asp:TextBox>
                    <br />
                </div>
                <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnLogin" runat="server" Text="Continue" CssClass="btn btn-primary" Width="49%" CausesValidation="False" OnClick="btnLogin_Click"/>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:Label ID="lblTesting" runat="server" Text="Show Output"></asp:Label>
        </div>
        <div id="map" style="width: 400px; height: 400px;"></div>
        </div>


</asp:Content>
