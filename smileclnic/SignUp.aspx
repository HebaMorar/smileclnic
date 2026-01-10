<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="SmileCare.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-page">
    <div class="auth-card">

        <h2>Signup Form</h2>

        <div class="auth-toggle">
            <a href="Login.aspx">Login</a>
            <a href="Signup.aspx" class="active">Signup</a>
        </div>

        <asp:TextBox ID="txtName" runat="server"
            CssClass="auth-input" Placeholder="Name" />

        <asp:TextBox ID="txtEmail" runat="server"
            CssClass="auth-input" Placeholder="Email Address" />

        <asp:TextBox ID="txtPassword" runat="server"
            CssClass="auth-input" TextMode="Password" Placeholder="Password" />

        <asp:TextBox ID="txtConfirm" runat="server"
            CssClass="auth-input" TextMode="Password" Placeholder="Confirm Password" />

        <asp:Button ID="btnSignup" runat="server"
            Text="Signup" CssClass="auth-btn" />

        <div class="auth-footer">
            Already have an account?
            <a href="Login.aspx">Login</a>
        </div>

    </div>
</div>

</asp:Content>