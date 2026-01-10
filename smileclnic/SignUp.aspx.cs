using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SmileCare
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            if (txtPassword.Text != txtConfirm.Text)
            {
                lblMessage.Text = "Passwords do not match";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Users (Name, Email, Password)
                         VALUES (@Name, @Email, @Password)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Login.aspx");
        }

    }
}