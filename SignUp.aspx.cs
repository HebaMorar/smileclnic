using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SmileClinic
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Check if email exists
                SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@Email", con);
                check.Parameters.AddWithValue("@Email", email);

                int count = (int)check.ExecuteScalar();
                if (count > 0)
                {
                    lblMessage.Text = "Email already exists";
                    return;
                }

                // Insert user
                SqlCommand insert = new SqlCommand(
                    @"INSERT INTO Users (Name, Email, Password)
                      VALUES (@Name,@Email,@Password);
                      SELECT SCOPE_IDENTITY();", con);

                insert.Parameters.AddWithValue("@Name", name);
                insert.Parameters.AddWithValue("@Email", email);
                insert.Parameters.AddWithValue("@Password", password);

                int userId = Convert.ToInt32((decimal)insert.ExecuteScalar());

                // Create Session
                Session["UserId"] = userId;
                Session["UserName"] = name;
                Session["UserEmail"] = email;

                Response.Redirect("Profile.aspx");
            }
        }
    }
}
