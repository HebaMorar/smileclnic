<%@ Page Title="Book Appointment" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="SmileClinic.Appointment" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<section class="appointment-page">

    <h1>Book an Appointment</h1>

    <!-- رسالة النجاح أو الخطأ -->
    <asp:Label ID="lblMsg" runat="server" CssClass="alert" Visible="false"></asp:Label>

    <div class="appointment-form">
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Phone Number"></asp:TextBox>
        <asp:RequiredFieldValidator ControlToValidate="txtPhone" runat="server"
            ErrorMessage="Phone is required" ForeColor="Red" Display="Dynamic" />

        <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control">
            <asp:ListItem Text="Dr. Ahmad Khaled" Value="Dr. Ahmad Khaled" />
            <asp:ListItem Text="Dr. Omar Al-Hassan" Value="Dr. Omar Al-Hassan" />
            <asp:ListItem Text="Dr. Lina Mahmoud" Value="Dr. Lina Mahmoud" />
        </asp:DropDownList>

        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" TextMode="Time" />

        <asp:Button ID="btnBook" runat="server" Text="Book Appointment" CssClass="btn btn-primary"
            OnClick="btnBook_Click" />
    </div>

    <hr />

    <h2>Your Appointments</h2>
    <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="appointments-grid">
        <Columns>
            <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Time" HeaderText="Time" />
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <span class='<%# Eval("StatusCss") %>'><%# Eval("Status") %></span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</section>

</asp:Content>
