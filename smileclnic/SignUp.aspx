<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Signup.aspx.cs"
    Inherits="SmileClinic.Signup" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-card">
    <h2>Sign Up</h2>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

    <asp:TextBox ID="txtName" runat="server" CssClass="inputBox" Placeholder="Name" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
        ErrorMessage="Name is required" ForeColor="Red" />

    <asp:TextBox ID="txtEmail" runat="server" CssClass="inputBox" Placeholder="Email" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Email is required" ForeColor="Red" />

    <asp:TextBox ID="txtPassword" runat="server" CssClass="inputBox"
        TextMode="Password" Placeholder="Password" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
        ErrorMessage="Password is required" ForeColor="Red" />

    <asp:Button ID="btnSignup" runat="server"
        Text="Sign Up" CssClass="btn btn-primary"
        OnClick="btnSignup_Click" />
</div>

</asp:Content>
