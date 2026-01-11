<%@ Page Title="Profile" Language="C#"
    MasterPageFile="~/Site.master"
    AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="SmileCare.Profile" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2>My Profile</h2>

    <p>Welcome,
        <asp:Label ID="lblUserName" runat="server" />
    </p>

    <asp:Button ID="btnLogout" runat="server"
        Text="Logout" OnClick="btnLogout_Click" />
</asp:Content>
