<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="Comp1807_Coursework.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUa8oJZsriD3FtB316C6IMPvqVmK7cFZU"></script>
    <script type="text/javascript">
        function initMap() {
            
            var origin = document.getElementById('<%= txtAdLine1.ClientID %>').value + document.getElementById('<%= txtAdLine2.ClientID %>').value;
            
            var destination = document.getElementById('<%= txtDes1.ClientID %>').value + document.getElementById('<%= txtDes2.ClientID %>').value;

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
    <h1>
        <asp:Label ID="lblServiceType" runat="server" Text="Transport Service"></asp:Label>
    </h1>
    <div class="row">
        <div class="col-md-8">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron" style="margin: 10px;">
                    <div class="col-md-12">
                        <h3>Passenger Name</h3><br />
                        <asp:TextBox ID="txtPassenger" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                <div class="container">
                    <h2>Pick up</h2>
                    <div class="col-md-6">
                        <h4>Address line 1</h4><br />
                        <asp:TextBox ID="txtAdLine1" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                    <div class="col-md-6">
                        <h4>Address line 2</h4><strong>Optional</strong>
                        <asp:TextBox ID="txtAdLine2" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                    </div>
                </div>
                    <div class="container">
                     <h2>Destination</h2>
                        <div class="col-md-6">
                            <h4>Address line1</h4><br />
                            <asp:TextBox ID="txtDes1" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                        </div>
                        <div class="col-md-6">
                            <h4>Address line2</h4><strong>Optional</strong>
                            <asp:TextBox ID="txtDes2" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                        </div>
                    </div>
                
                    <div class="text-center">
                        <asp:CheckBox ID="checkConfirm" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="I am sure with the address" />
&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblCheck" runat="server" ForeColor="Red" Text="Check this to proceed" Visible="False"></asp:Label>
                    </div>
                
                <div class="container">
                    <div class="col-md-12">
                        <h4>Date</h4>
                        <asp:TextBox ID="txtDateTime" type="datetime-local" runat="server" CssClass="form-control mb-4" ></asp:TextBox><br /> 
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
                    <div class="col-md-12">
                        <div class="text-center">
                            <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btn btn-primary" Width="49%" CausesValidation="False" OnClick="btnContinue_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
        <div>
            <asp:Label ID="lblTesting" runat="server" Text=""></asp:Label>
        </div>
        <div id="map" style="width: 400px; height: 400px;"></div>
        </div>
        </div>


</asp:Content>
