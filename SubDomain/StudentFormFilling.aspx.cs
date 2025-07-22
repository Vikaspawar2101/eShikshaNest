using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eShikshaNest.SubDomain
{
    public partial class StudentFormFilling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                }
                else
                {
                    // Redirect to login if session is null
                    Response.Redirect("../SubDomain/StudentLoginPage.aspx");
                }
            }
        }
    }
}