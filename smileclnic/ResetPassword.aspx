<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="smile2.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auth-container">

        <h2>Reset Password</h2>

        <p>
            Enter your email and new password
        </p>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

        <!-- Email -->
        <asp:TextBox ID="txtEmail" runat="server"
            Placeholder="Email Address" CssClass="inputBox" />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="Email is required"
            Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revEmail" runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="Invalid email format"
            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
            Display="Dynamic" />

        <!-- New Password -->
        <asp:TextBox ID="txtNewPassword" runat="server"
            TextMode="Password"
            Placeholder="New Password" CssClass="inputBox" />
        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server"
            ControlToValidate="txtNewPassword"
            ErrorMessage="New password is required"
            Display="Dynamic" />

        <!-- Confirm New Password -->
        <asp:TextBox ID="txtConfirmPassword" runat="server"
            TextMode="Password"
            Placeholder="Confirm New Password" CssClass="inputBox" />
        <asp:CompareValidator ID="cvPassword" runat="server"
            ControlToCompare="txtNewPassword"
            ControlToValidate="txtConfirmPassword"
            ErrorMessage="Passwords do not match"
            Display="Dynamic" />

        <!-- Button -->
        <asp:Button ID="btnResetPassword" runat="server"
            Text="Reset Password"
            CssClass="auth-btn"
            OnClick="btnResetPassword_Click" />

        <!-- Back to Login -->
        <div>
            <a href="Login.aspx">
                Back to Login
            </a>
        </div>

    </div>

</asp:Content>
