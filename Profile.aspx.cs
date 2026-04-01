using System;
using System.Web.UI;

namespace SmileClinic
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            lblUserName.Text = Session["UserName"]?.ToString();
            lblName.Text = Session["UserName"]?.ToString();
            lblEmail.Text = Session["UserEmail"]?.ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
