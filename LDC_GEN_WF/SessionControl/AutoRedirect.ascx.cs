using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF.SessionControl
{
   

    public partial class AutoRedirect : System.Web.UI.UserControl
    {

        public string LoginDate;
        public string ExpressDate;

        protected void Page_Load(object sender, EventArgs e)
        {

            //https://code.msdn.microsoft.com/Auto-redirect-to-login-e1782b2f

                            // Check session is expire or timeout.
                            if (Session["thisUserName"] == null)
                            {
                                //Response.Redirect("Login.aspx?info=0");
                                Response.Redirect("Login.aspx");
                            }

                            // Get user login time or last activity time.
                            DateTime date = DateTime.Now;
                            LoginDate = date.ToString("u", DateTimeFormatInfo.InvariantInfo).Replace("Z", "");
                            int sessionTimeout = Session.Timeout;
                            DateTime dateExpress = date.AddMinutes(sessionTimeout);
                            ExpressDate = dateExpress.ToString("u", DateTimeFormatInfo.InvariantInfo).Replace("Z", "");

        }
    }
}