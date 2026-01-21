<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmileClinic.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-card">

    <h2>Login</h2>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

    <asp:TextBox ID="txtEmail" runat="server"
        CssClass="inputBox" Placeholder="Email Address" />
    <asp:TextBox ID="txtPassword" runat="server"
        CssClass="inputBox" TextMode="Password" Placeholder="Password" />

    <asp:Button ID="btnLogin" runat="server"
        Text="Login" CssClass="btn btn-primary"
        OnClick="btnLogin_Click" />

    <div style="margin-top:10px;">
        <a href="Signup.aspx">Don't have an account? Signup</a><br />
        <a href="ForgotPassword.aspx">Forgot Password?</a>
    </div>

</div>

</asp:Content>
