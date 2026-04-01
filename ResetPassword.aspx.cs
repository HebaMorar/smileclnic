using System;
using System.Data.SqlClient;
using System.Configuration;

namespace smileclnic
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // تحقق إضافي في السيرفر
            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

          string connStr = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // تحقق من وجود البريد في قاعدة البيانات
                string checkQuery = "SELECT COUNT(*) FROM [Users] WHERE Email=@Email";
                SqlCommand cmdCheck = new SqlCommand(checkQuery, con);
                cmdCheck.Parameters.AddWithValue("@Email", email);

                int count = (int)cmdCheck.ExecuteScalar();

                if (count == 0)
                {
                    lblMessage.Text = "Email not found!";
                    return;
                }

                // تحديث كلمة المرور بدون تشفير
                string updateQuery = "UPDATE [Users] SET Password=@Password WHERE Email=@Email";
                SqlCommand cmdUpdate = new SqlCommand(updateQuery, con);
                cmdUpdate.Parameters.AddWithValue("@Password", newPassword);
                cmdUpdate.Parameters.AddWithValue("@Email", email);

                cmdUpdate.ExecuteNonQuery();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Password has been reset successfully!";
            }
        }
    }
}
