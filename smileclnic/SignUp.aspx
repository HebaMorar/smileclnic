<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="SmileCare.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-page">
    <div class="auth-card">

        <h2>Sign Up</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:TextBox ID="txtName" runat="server"
            CssClass="auth-input" Placeholder="Name" />
        <asp:RequiredFieldValidator runat="server"
            ControlToValidate="txtName"
            ErrorMessage="Name is required" ForeColor="Red" />

        <asp:TextBox ID="txtEmail" runat="server"
            CssClass="auth-input" Placeholder="Email Address" />
        <asp:RequiredFieldValidator runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="Email is required" ForeColor="Red" />

        <asp:TextBox ID="txtPassword" runat="server"
            CssClass="auth-input" TextMode="Password" Placeholder="Password" />
        <asp:RequiredFieldValidator runat="server"
            ControlToValidate="txtPassword"
            ErrorMessage="Password is required" ForeColor="Red" />

        <asp:TextBox ID="txtConfirm" runat="server"
            CssClass="auth-input" TextMode="Password" Placeholder="Confirm Password" />
        <asp:CompareValidator runat="server"
            ControlToCompare="txtPassword"
            ControlToValidate="txtConfirm"
            ErrorMessage="Passwords do not match"
            ForeColor="Red" />

        <asp:Button ID="btnSignup" runat="server"
            Text="Signup" CssClass="auth-btn" />

        <div class="auth-footer">
            Already have an account?
            <a href="Login.aspx">Login</a>
        </div>

    </div>
</div>

</asp:Content>
