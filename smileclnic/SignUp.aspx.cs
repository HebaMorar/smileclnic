using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SmileClinic

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
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // 🔹 1. فحص الإيميل
                string checkEmailQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkEmailQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                int emailCount = (int)checkCmd.ExecuteScalar();

                if (emailCount > 0)
                {
                    lblMessage.Text = "This email is already registered";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // 🔹 2. إدخال المستخدم
                string insertQuery = @"INSERT INTO Users (Name, Email, Password)
                                       VALUES (@Name, @Email, @Password)";

                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text); // لاحقًا نعمل Hash

                insertCmd.ExecuteNonQuery();
            }

            // نجاح
            Response.Redirect("Login.aspx");
        }
    }
}
