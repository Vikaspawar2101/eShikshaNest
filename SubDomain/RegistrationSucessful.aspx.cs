using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace eShikshaNest.SubDomain
{
    public partial class RegistrationSucessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StudentID"] != null)
                {
                    int studentId;
                    if (int.TryParse(Session["StudentID"].ToString(), out studentId))
                    {
                        string conStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

                        using (SqlConnection con = new SqlConnection(conStr))
                        {
                            string query = "SELECT * FROM StudentRegistration WHERE StudentID = @ID";
                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.AddWithValue("@ID", studentId);
                                con.Open();

                                SqlDataReader dr = cmd.ExecuteReader();
                                if (dr.Read())
                                {
                                    lblRollNumber.Text = dr["uniquenumber"].ToString();
                                    lblName.Text = $"{dr["FirstName"]} {dr["MiddleName"]} {dr["LastName"]}";
                                    lblEmail.Text = dr["Email"].ToString();
                                    lblMobile.Text = dr["MobileNumber"].ToString();
                                    labelPassword.Text = dr["Password"].ToString(); // consider encrypting/hashing in future
                                }
                                else
                                {
                                    ShowNoData();
                                }
                                dr.Close();
                            }
                        }
                    }
                    else
                    {
                        ShowNoData();
                    }
                }
                else
                {
                    ShowNoData();
                }
            }
        }

        private void ShowNoData()
        {
            lblRollNumber.Text = "No Data Found";
            lblName.Text = "No Data Found";
            lblEmail.Text = "No Data Found";
            lblMobile.Text = "No Data Found";
            labelPassword.Text = "No Data Found";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../SubDomain/StudentLoginPage.aspx");
        }
    }
}
