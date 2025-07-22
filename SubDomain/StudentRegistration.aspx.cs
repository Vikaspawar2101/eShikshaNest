using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eShikshaNest.SubDomain
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
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

        private bool ValidateCaptcha(string userInput)
        {

            string storedCode = (string)Session["CaptchaCode"];
            return string.Equals(userInput, storedCode, StringComparison.OrdinalIgnoreCase);
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string captchaCode = txtCaptcha.Text;

          

            if (ValidateCaptcha(captchaCode))
            {

                string conStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    try
                    {
                        con.Open();

                        // 2. Check if Email already exists
                        string checkEmailQuery = "SELECT COUNT(*) FROM StudentRegistration WHERE Email = @Email";
                        SqlCommand emailCmd = new SqlCommand(checkEmailQuery, con);
                        emailCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        int emailCount = (int)emailCmd.ExecuteScalar();

                        if (emailCount > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "emailExists", "alert('Email already registered.');", true);
                            return;
                        }

                        // 3. Check if Mobile already exists
                        string checkMobileQuery = "SELECT COUNT(*) FROM StudentRegistration WHERE MobileNumber = @Mobile";
                        SqlCommand mobileCmd = new SqlCommand(checkMobileQuery, con);
                        mobileCmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        int mobileCount = (int)mobileCmd.ExecuteScalar();

                        if (mobileCount > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "mobileExists", "alert('Mobile number already registered.');", true);
                            return;
                        }

                        // 4. Insert user data and get StudentID
                        string insertQuery = @"INSERT INTO StudentRegistration 
                        ( FirstName, MiddleName, LastName, Email, MobileNumber, CaptchaEntered)
                        OUTPUT INSERTED.StudentID
                        VALUES
                        (@FirstName, @MiddleName, @LastName, @Email, @MobileNumber, @CaptchaEntered)";

                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                     
                        insertCmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                        insertCmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text.Trim());
                        insertCmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                        insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        insertCmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text.Trim());
                        insertCmd.Parameters.AddWithValue("@CaptchaEntered", txtCaptcha.Text.Trim());

                        int studentId = (int)insertCmd.ExecuteScalar();
                        string password = GenerateRandomPassword();

                        // 5. Generate and update Roll Number (e.g., VNS20250001)
                        string uniquenumber = "eShiksha2025" + studentId.ToString("D4");

                        string updateQuery = "UPDATE StudentRegistration SET UniqueNumber = @UniqueNumber, Password = @Password WHERE StudentID = @StudentID";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@UniqueNumber", uniquenumber);
                        updateCmd.Parameters.AddWithValue("@Password", password); // You may encrypt this later
                        updateCmd.Parameters.AddWithValue("@StudentID", studentId);
                        updateCmd.ExecuteNonQuery();

                        // Send email to student
                        SendCredentialsEmail(txtEmail.Text.Trim(), uniquenumber, password);

                        con.Close();

                        // 6. Redirect to Success Page
                        Session["StudentID"] = studentId;
                        Response.Redirect("../SubDomain/RegistrationSucessful.aspx");

                    }

                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "error", $"alert('An error occurred: {ex.Message}');", true);
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

        
        private void SendCredentialsEmail(string toEmail, string uniquenumber, string password)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(toEmail);
                mail.From = new MailAddress("eshikshanest01@outlook.com", "eShiksha Nest Academy");
                mail.Subject = "Registration Successful - Credentials Inside";
                mail.Body = $"Dear Student,\n\nYour registration is successful.\n\nRoll Number: {uniquenumber}\nPassword: {password}\n\nPlease keep this information safe.\n\nRegards,\neShiksha Nest";
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                // Optionally log error
                ScriptManager.RegisterStartupScript(this, GetType(), "emailError", $"alert('Email sending failed: {ex.Message}');", true);
            }
        }
        private string GenerateRandomPassword(int length = 8)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$";
            Random rnd = new Random();
            return new string(Enumerable.Repeat(valid, length)
                .Select(s => s[rnd.Next(s.Length)]).ToArray());
        }


    }
}