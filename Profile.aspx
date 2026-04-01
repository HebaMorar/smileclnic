<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SmileClinic.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="profile-page" role="main" aria-labelledby="profile-heading">
        <!-- ===== HEADER ===== -->
        <div class="profile-header">
            <asp:Image ID="imgProfile" runat="server" ImageUrl="~/img/profileimg.jfif" CssClass="profile-img" AlternateText="Profile Image" />
            <h2 id="profile-heading">Welcome, <asp:Label ID="lblUserName" runat="server" /></h2>
            <p>Your personal information</p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-logout" OnClick="btnLogout_Click" />
        </div>

        <!-- ===== USER INFO ===== -->
        <div class="profile-content">
            <div class="profile-card" role="region" aria-labelledby="info-heading">
                <h3 id="info-heading">User Information</h3>
                <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
            </div>
        </div>
    </section>
</asp:Content>