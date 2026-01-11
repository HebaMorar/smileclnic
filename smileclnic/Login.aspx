<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmileCare.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-page">
    <div class="auth-card">

        <h2>Login</h2>

        <div class="auth-toggle">
            <a href="Login.aspx" class="active">Login</a>
            <a href="Signup.aspx">Signup</a>
        </div>

        <asp:TextBox ID="txtEmail" runat="server"
            CssClass="auth-input" Placeholder="Email Address" />

        <asp:TextBox ID="txtPassword" runat="server"
            CssClass="auth-input" TextMode="Password" Placeholder="Password" />

        <asp:Button ID="btnLogin" runat="server"
            Text="Login" CssClass="auth-btn" />

        <div class="auth-footer">
            <a href="ResetPassword.aspx" style="font-size:13px; color:#42a5f5; text-decoration:none;">Forgot Password?</a>
        </div>

        <div class="auth-footer">
            Don’t have an account?
            <a href="Signup.aspx">Signup</a>
        </div>

    </div>
</div>

</asp:Content>