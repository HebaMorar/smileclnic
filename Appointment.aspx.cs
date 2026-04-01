using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace SmileClinic
{
    public partial class Appointment : Page
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
                BindAppointmentsGrid();
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            int userId = (int)Session["UserId"];
            string phone = txtPhone.Text.Trim();
            string doctor = ddlDoctor.SelectedValue;
            DateTime date;
            DateTime time;

            if (!DateTime.TryParse(txtDate.Text, out date))
            {
                ShowMessage("Invalid Date", "alert-danger");
                return;
            }

            if (!DateTime.TryParse(txtTime.Text, out time))
            {
                ShowMessage("Invalid Time", "alert-danger");
                return;
            }

            try
            {
                string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = @"INSERT INTO Appointments (UserId, Doctor, Phone, Date, Time, Status)
                                     VALUES (@UserId, @Doctor, @Phone, @Date, @Time, 'Pending')";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@Doctor", doctor);
                        cmd.Parameters.AddWithValue("@Phone", phone);
                        cmd.Parameters.AddWithValue("@Date", date);
                        cmd.Parameters.AddWithValue("@Time", time);

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Appointment booked successfully!", "alert-success");
                BindAppointmentsGrid();
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "alert-danger");
            }
        }

        private void BindAppointmentsGrid()
        {
            int userId = (int)Session["UserId"];
            string cs = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT Id, Doctor, Date, Time, Status,
                                 CASE 
                                   WHEN Status='Pending' THEN 'status-pending'
                                   WHEN Status='Confirmed' THEN 'status-confirmed'
                                   WHEN Status='Cancelled' THEN 'status-cancelled'
                                   ELSE 'status-pending'
                                 END AS StatusCss
                                 FROM Appointments
                                 WHERE UserId=@UserId
                                 ORDER BY Date, Time";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    con.Open();
                    gvAppointments.DataSource = cmd.ExecuteReader();
                    gvAppointments.DataBind();
                }
            }
        }

        private void ShowMessage(string text, string cssClass)
        {
            lblMsg.Text = text;
            lblMsg.CssClass = "alert " + cssClass;
            lblMsg.Visible = true;
        }
    }
}
