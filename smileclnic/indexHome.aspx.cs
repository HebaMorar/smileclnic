using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace SmileClinic
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string fullname = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(fullname) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(message))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    string query = @"INSERT INTO ContactUs 
                             (Fullname, Email, Message, CreatedAt)
                             VALUES (@FullName, @Email, @Message, GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        
                            cmd.Parameters.AddWithValue("@FullName", fullname);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Message", message);
                            cmd.ExecuteNonQuery();
                        

                    }
                }

                // رسالة نجاح
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Your Message has been sent successfully!";

                // استدعاء EmailJS بعد نجاح التخزين
                // استدعاء EmailJS بعد نجاح التخزينjhj
                string js = $"sendEmailJS('{fullname.Replace("'", "\\'")}', '{email}');";
                ClientScript.RegisterStartupScript(this.GetType(), "sendEmailJS", js, true);

                // تفريغ الحقول
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}