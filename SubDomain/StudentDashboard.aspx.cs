using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eShikshaNest.SubDomain
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    //lblStudentName.Text = Session["StudentName"].ToString();
                    //lblStudentID.Text = Session["StudentID"].ToString();
                    //lblStandard.Text = Session["Standard"].ToString();
                    //lblDivision.Text = Session["Division"].ToString();
                    //lblAcademicYear.Text = Session["AcademicYear"].ToString();


                    //    // Simulate login session
                       string studentName = "Rahul Pawar";
                       string studentID = "STD123";
                     string standard = "5";
                     string division = "B";
                     string year = "2025-2026";

                 lblStudentName.Text = studentName;
                    lblStudentID.Text = studentID;
                   lblStandard.Text = standard;
                 lblDivision.Text = division;
                    lblAcademicYear.Text = year;
                    // Make Form Filling link visible
                    lnkFormFilling.Visible = true;

                    
                     BindAcademicProgress();
                      BindHomework();
                       BindNotices();
                       BindDownloads();
                }
                else
                {
                    // Redirect to login if session is null
                    Response.Redirect("../SubDomain/StudentLoginPage.aspx");
                }
            }
        }

        private void BindAcademicProgress()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Subject");
            dt.Columns.Add("Marks");
            dt.Columns.Add("Grade");

            dt.Rows.Add("Math", "88", "A");
            dt.Rows.Add("English", "75", "B+");
            dt.Rows.Add("Science", "92", "A+");

            gvMarks.DataSource = dt;
            gvMarks.DataBind();
        }

        private void BindHomework()
        {
            var homeworkList = new List<object>
        {
            new { Subject = "Math", Description = "Complete page 45", DueDate = DateTime.Today.AddDays(2) },
            new { Subject = "English", Description = "Write essay on Rainy Season", DueDate = DateTime.Today.AddDays(3) }
        };

            rptHomework.DataSource = homeworkList;
            rptHomework.DataBind();
        }

        private void BindNotices()
        {
            bltNotices.Items.Add("School will be closed on 15th August.");
            bltNotices.Items.Add("Parent-Teacher meeting on 20th July.");
        }

        private void BindDownloads()
        {
            var downloadList = new List<object>
        {
            new { Title = "Math Worksheet", FilePath = "files/worksheet-math.pdf" },
            new { Title = "English Grammar Notes", FilePath = "files/grammar-notes.pdf" }
        };

            rptDownloads.DataSource = downloadList;
            rptDownloads.DataBind();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../SubDomain/StudentLoginPage.aspx");
        }
    }
}