using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SmileCare
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Id, Name FROM Users WHERE Email=@Email AND Password=@Password";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // تخزين الجلسة
                    Session["UserId"] = dr["Id"];
                    Session["UserName"] = dr["Name"];

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    // رسالة خطأ
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "alert",
                        "alert('Invalid email or password');",
                        true
                    );
                }
            }
        }
    }
}
