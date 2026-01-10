<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master"
AutoEventWireup="true" CodeBehind="indexHome.aspx.cs"
Inherits="DentalClinic.Home" %>

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
    <h2 class="section-title">SmileCare Doctors</h2>

    <div class="Dr-card">

            <article>
                <img src="img/Dr.%20Ahmad%20Khaled.png" />
                <h3>Dr.Ahmad Khaled</h3>
                <h4>General Dentist</h4>
                <p>Comprehensive dental care and check-ups</p>
            </article>

            <article>
                <img src="img/Dr.%20Omar%20Al-Hassan.png" />
                <h3>Dr.Omar Al-Hassan</h3>
                <h4>Orthodontist</h4>
                <p>Braces and smile alignment</p>
            </article>

            <article>
                <img src="img/Dr.%20Lina%20Mahmoud.png" />
                <h3>Dr.Lina Mahmoud</h3>
                <h4>Pediatric Dentist</h4>
                <p>Gentle dental care for children</p>
            </article>

        </div>
    </section>

    <section class="contact-section">
    <div class="contact-card">

        <!-- LEFT INFO -->
        <div class="contact-info">
            <h2>Contact Us</h2>

            <p><strong>Email:</strong><br />smilecare@gmail.com</p>
            <p><strong>Phone:</strong><br />+962775485632</p>

            </div>
        </div>

        <!-- RIGHT FORM -->
        <div class="contact-form">
            <div class="row">
                <input type="text" placeholder="Your full name" />
                <input type="email" placeholder="Your email address" />
            </div>

            <textarea placeholder="Write something..."></textarea>

            <button>Send Message</button>
        </div>

    </div>
</section>


</asp:Content>
