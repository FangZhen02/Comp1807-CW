<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="Comp1807_Coursework.FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1><strong>Our Support Center</strong></h1><br />
        <p>&nbsp;Below are some of the frequently asked questions that might help you.</p>

    </div>
    <hr style="border: none; border-top: 2px solid black;" />
    <div class ="jumbotron" style="font-size: medium">
        <h2 class ="lead" style ="font-family: 'Copperplate Gothic'; text-align:center; font-size: small;" >PrivateHire Cars is one of the largest private hire&nbsp;taxi companies in London.</h2>

        <h2 class ="lead" style ="font-family: 'Copperplate Gothic'; text-align:center; font-size: small;" >Our goal is to provide a fast, friendly, and reliable service to out customer. </h2>
        <h2 class ="lead" style ="font-family: 'Copperplate Gothic'; text-align:center; font-size: small;" >Services we provide include Local Journey, Rental, Airport, Meet-Greet &amp; Hotel Transfer.</h2>
        <p class ="lead" style ="font-family: 'Copperplate Gothic Bold'; text-align:left; font-size: 29px;" >
&nbsp;<asp:Image ID="Image1" runat="server" Height="109px" ImageUrl="~/Resource/faq.png" Width="119px" />
        </p>
        <p style="color: #FF0000">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How do I create a PrivateHire Cars account ?</p>

        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            1. You can sign up an account via our official website.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px;font-size: medium;">
            2. Go to the&nbsp;<asp:HyperLink ID="HyperLinkSignUp" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
&nbsp;tab on the top of website.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            3. Insert with all required information.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            4. Click on Sign Up button and you&#39;re now successfully created a PrivateHire account.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            5.
            <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
&nbsp;with your email address and password to book our services.</p>
        <p style="color: #FF0000">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What should I do if I forget my password ?</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            1. You may visit to our
            <asp:HyperLink ID="HyperLinkLogin1" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forget Password</asp:HyperLink>
&nbsp;page to reset your password.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px;font-size: medium;">
            2. Enter your email address and click on confirm button.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            3.&nbsp; You will receive a temporary password through email.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            4.
            Enter the temporary password, new password and confirm password.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            5. Click on reset password button and you can now
            <asp:HyperLink ID="HyperLinkLogin2" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
&nbsp;with your new password.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            6. Kindly contact to our customer service at <a href="mailto:privatehiresup@gmail.com">privatehiresup@gmail.com</a> or 513526706 for futher inquiries.</p>
        <p style="color: #FF0000">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What type of ride services do I choose ?</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            1. We do provide few services include Local, Rental, Airport, Meet-Greet &amp; Hotel Transfer.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px;font-size: medium;">
            2. Local: Trip in local with short distance.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            3. Rental: Rent a minicab.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            4. Airport: We provide pickup or drop off customer at airport.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            5. Meet-Greet: Pickup car from the airport when customer arrive and return it back to customer when customer land.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            6. Hotel Transfer: Get from airport or arrival point to hotel.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            7. Kindly contact to our customer service at <a href="mailto:privatehiresup@gmail.com">privatehiresup@gmail.com</a> or 513526706 for futher inquiries.</p>
        <p style="color: #FF0000">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How is the fare calculated ?</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            1. There are two types of fare calculation for our services.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px;font-size: medium;">2. Base fare for Local, Airport, Meet-Greet &amp; Hotel Transfer are £0.80 per km.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            3. Rental for a minicab is £200 per day.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            4. Kindly contact to our customer service at <a href="mailto:privatehiresup@gmail.com">privatehiresup@gmail.com</a> or 513526706 for futher inquiries.</p>
        <p style="color: #FF0000">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Types of payment method we accept.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px; font-size: medium;">
            1. We do accept Paypal &amp; Credit Card.</p>
        <p style="color: #000000; text-align: center; width: 1178px; height: 29px;font-size: medium;">2. Kindly contact to our customer service at <a href="mailto:privatehiresup@gmail.com">privatehiresup@gmail.com</a> or 513526706 for futher inquiries.</p>
        <p class ="lead" style ="font-family: 'Copperplate Gothic'; text-align:left; font-size: medium;" >
            &nbsp;</p>
    </div>
</asp:Content>
