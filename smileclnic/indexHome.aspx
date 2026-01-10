<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="indexHome.aspx.cs" Inherits="SmileClinic.Home" %>

<asp:Content ID="MainContentArea"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <br />

    <!-- ===== HERO SECTION ===== -->
    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to SmileCare Dental Clinic</h1>
            <p class="hero-text">
                Book your appointment easily and manage your dental care online.
            </p>

            <asp:HyperLink
                ID="hlBookAppointment"
                runat="server"
                NavigateUrl="~/BookAppointment.aspx"
                CssClass="btn btn-primary">
                Book Appointment
            </asp:HyperLink>
        </div>
    </section>

    <!-- ===== Dr SECTION ===== -->
    <section class="Dr">
        <div class="Dr-card">

            <article>
                <img src="img/Dr.%20Ahmad%20Khaled.png" />
                <h3>General Dentist</h3>
                <p>Comprehensive dental care and check-ups</p>
            </article>

            <article>
                <img src="img/Dr.%20Omar%20Al-Hassan.png" />
                <h3>Orthodontist</h3>
                <p>Braces and smile alignment</p>
            </article>

            <article>
                <img src="img/Dr.%20Lina%20Mahmoud.png" />
                <h3>Pediatric Dentist</h3>
                <p>Gentle dental care for children</p>
            </article>

        </div>
    </section>

</asp:Content>
