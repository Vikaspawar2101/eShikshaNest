using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eShikshaNest.SubDomain
{
    public partial class StudentLoginPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateAndDisplayCaptcha();
            }
        }
        //Capchta Generate Methods
        private void GenerateAndDisplayCaptcha()
        {
            string code = GenerateCaptchaCode();
            captchaCodeLabel.Text = code;
            Session["CaptchaCode"] = code;
        }
        //Custom Characters
        private string GenerateCaptchaCode()
        {

            string characters = "ABCDEFGHJKMNOPQRSTUVWXYZ0123456789";
            string code = "";
            Random random = new Random();
            for (int i = 0; i < 6; i++)
            {
                code += characters[random.Next(characters.Length)];
            }

            return code;
        }
        //Valid Captcha
        private bool ValidateCaptcha(string userInput)
        {

            string storedCode = (string)Session["CaptchaCode"];
            return string.Equals(userInput, storedCode, StringComparison.OrdinalIgnoreCase);
        }

        protected void btniologin_Click(object sender, EventArgs e)
        {
            string username = txtUserId.Text;
            string password = txtPassword.Text;
            string captchaCode = txtCaptcha.Text;

            if (ValidateCaptcha(captchaCode))
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT UniqueNumber, FormStatus FROM StudentRegistration WHERE UniqueNumber=@username AND Password=@password", con);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();

                        string userID = reader["UniqueNumber"].ToString();
                        string formStatus = reader["FormStatus"].ToString().Trim().ToUpper(); // Ensure case-insensitive match

                        // Store Session
                        Session["UserID"] = userID;
                        Session["AuthToken"] = Guid.NewGuid().ToString();

                        reader.Close();
                        con.Close();

                        // Redirect based on FormStatus
                        if (formStatus == "CONFIRMED")
                        {
                            Response.Redirect($"StudentDashboard.aspx?token={Session["AuthToken"]}");
                        }
                        else
                        {
                            Response.Redirect($"StudentFormFilling.aspx?token={Session["AuthToken"]}");
                            //Response.Redirect("StudentFormFilling.aspx");
                        }
                    }
                    else
                    {
                        reader.Close();
                        con.Close();
                        Response.Write("<script>alert('Invalid username or password.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid CAPTCHA code. Please try again.');</script>");
                txtCaptcha.Text = string.Empty;
                GenerateAndDisplayCaptcha();
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../HomePage.aspx");
        }

        protected void btnForgetPassword_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}