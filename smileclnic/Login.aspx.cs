using System;
using System.Web.UI;

namespace SmileCare
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // مثال تجريبي (لاحقًا Database)
            if (email == "test@gmail.com" && password == "1234")
            {
                Session["UserEmail"] = email;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email or password";
            }
        }
    }
}
