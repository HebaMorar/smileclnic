using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace SmileClinic
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT Id, Name 
                                 FROM Users 
                                 WHERE Email=@Email AND Password=@Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["UserId"] = Convert.ToInt32(dr["Id"]);
                        Session["UserName"] = dr["Name"].ToString();
                        Session["UserEmail"] = email;

                        Response.Redirect("Profile.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid email or password";
                    }
                }
            }
        }
    }
}
