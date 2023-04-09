<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rental.aspx.cs" Inherits="Comp1807_Coursework.Rental" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUa8oJZsriD3FtB316C6IMPvqVmK7cFZU"></script>
    <script type="text/javascript">
        function initMap() {

            var origin = document.getElementById('<%= txtPickup.ClientID %>').value;

            var geocoder = new google.maps.Geocoder();

            // Geocode the origin address to get its latitude and longitude
            geocoder.geocode({ address: origin }, function (results, status) {
                if (status === 'OK') {
                    var originLatLng = results[0].geometry.location;

                    // Create the map centered at the origin latitude and longitude
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 10,
                        center: originLatLng
                    });

                    // Add a marker for the origin
                    var originMarker = new google.maps.Marker({
                        position: originLatLng,
                        map: map,
                        title: 'Origin'
                    });

                }
                else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

    </script>
    <h1>
        <asp:Label ID="lblServiceType" runat="server" Text="Rental Service"></asp:Label>
    </h1>
    <div class="row">
        <div class="col-md-6">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron">
                <div class="col-md-6">
                    <h4>Passenger name</h4>
                    <asp:TextBox ID="txtPassenger" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                </div>
                <div class="col-md-6">
                    <h4>Pick up</h4>
                    <asp:TextBox ID="txtPickup" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                </div>
                <div class="text-center">
                        <asp:CheckBox ID="checkConfirm" runat="server" AutoPostBack="True" Text="I am sure with the address" OnCheckedChanged="checkConfirm_CheckedChanged" />
&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblCheck" runat="server" ForeColor="Red" Text="Check this to proceed" Visible="False"></asp:Label>
                    </div>
                <div class="col-md-12">
                    <h4>Date</h4>
                        <asp:TextBox ID="txtDateTime" runat="server" type="datetime-local" CssClass="form-control mb-4" ></asp:TextBox>  
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
