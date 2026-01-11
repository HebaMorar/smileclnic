<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="indexHome.aspx.cs" Inherits="SmileClinic.Home" %>

<asp:Content ID="MainContentArea"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <br />
    <!-- test -->

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
                <img src="img/Dr.%20Ahmad%20Khaled.png" alt="Dr. Ahmad Khaled" />
                <h3>Dr.Ahmad Khaled</h3>
                <h4>General Dentist</h4>
                <p>Comprehensive dental care and check-ups</p>
            </article>

            <article>
                <img src="img/Dr.%20Omar%20Al-Hassan.png" alt="Dr. Omar Al-Hassan" />
                <h3>Dr.Omar Al-Hassan</h3>
                <h4>Orthodontist</h4>
                <p>Braces and smile alignment</p>
            </article>

            <article>
                <img src="img/Dr.%20Lina%20Mahmoud.png" alt="Dr. Lina Mahmoud" />
                <h3>Dr.Lina Mahmoud</h3>
                <h4>Pediatric Dentist</h4>
                <p>Gentle dental care for children</p>
            </article>

        </div>
    </section>

    <!-- ===== CONTACT SECTION ===== -->
    <section id="contact-section" class="contact-section">
        <div class="contact-card">

            <!-- LEFT INFO -->
            <div class="contact-info">
                <h2>Contact Us</h2>
                <p><strong>Email:</strong><br />smilecare@gmail.com</p>
                <p><strong>Phone:</strong><br />+962775485632</p>
            </div>

            <!-- RIGHT FORM -->
            <div class="contact-form">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

                <asp:TextBox ID="txtFullName" runat="server" CssClass="inputBox" Placeholder="Your full name" />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                    ControlToValidate="txtFullName"
                    ErrorMessage="Full Name is required"
                    Display="Dynamic" />

                <asp:TextBox ID="txtEmail" runat="server" CssClass="inputBox" Placeholder="Your email address" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Email is required"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Invalid email format"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    Display="Dynamic" />

                <asp:TextBox ID="txtMessage" runat="server" CssClass="inputBox" TextMode="MultiLine" Rows="5" Placeholder="Write something..." />
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server"
                    ControlToValidate="txtMessage"
                    ErrorMessage="Message is required"
                    Display="Dynamic" />

                <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="btn btn-primary"
                    OnClick="btnSendMessage_Click" />
            </div>

        </div>
    </section>
   <script src="https://cdn.emailjs.com/dist/email.min.js"></script>
<script>
    (function () {
        emailjs.init("ktMEG_hf3syIRafL"); // PUBLIC KEY
    })();

    function sendEmailJS(fullname, email) {
        emailjs.send("service_pgsuyvk", "template_x1lr7mg", {
            from_name: fullname,
            reply_to: email
        }).then(
            function () {
                console.log("Auto reply sent");
                alert("Message sent! Check your email.");
            },
            function (error) {
                console.log("EmailJS Error:", error);
                alert("Failed to send email.");
            }
        );
    }

        
    
</script>


</asp:Content>
