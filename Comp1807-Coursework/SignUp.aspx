﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Comp1807_Coursework.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Sign Up</h1>
    <form id="form1" runat="server">
            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name" required><br>

            <label for="last_name">Last Name:</label>
            <input type="text" id="last_name" name="last_name" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            
            <label for="contact_number">Contact Number:</label>
            <input type="number" id="contact_number" name="contact_number" required><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>

            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required min="8"><br>

            <button type="submit">Submit</button><br />
            <laba1>have an account? <a href="https://www.w3schools.com/">Sign In</a></laba1> <!--wait for sign up page-->
            
    </form>
</body>
</html>
