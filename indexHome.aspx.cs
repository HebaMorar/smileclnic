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

        // ==== CONTACT FORM ====
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string form_name = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(form_name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
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
                        cmd.Parameters.AddWithValue("@FullName", form_name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Message", message);
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Your message has been sent successfully!";
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
