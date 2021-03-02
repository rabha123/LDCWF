using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblSessionInfo.Text = 
                    ("Welcome: " + (Session["thisUserName"]) + " @ " + (Session["thisRoleName"]));

            }
            catch (Exception)
            {
                
            }
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Abandon();


                Session["thisUserID"] = null;
                Session["thisUserName"] =null;
                Session["thisRoleName"] = null;
                Session["thisDeptID"] = null;
                Session["thisDeptName"] = null;
                Session["thisisActiveUser"] = null;
                Session["thisNavigationURL"] = null;

                this.DisablePageCaching();
                this.Send401();

            }
            catch (Exception)
            {
                
            }

        }

        public void DisablePageCaching()
        {
            Response.Expires = 0;
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
            Response.Redirect("~/View/LogOut.aspx");

        }

        public void Send401()
        {
            // Create a 401 response, the browser will show the log-in dialogbox, asking the user to supply new credentials, 
            // if browser is not set to "automaticaly sign in with current credentials"
            Response.Buffer = true;
            Response.StatusCode = 401;
            Response.StatusDescription = "Unauthorized";

            // A authentication header must be supplied. This header can be changed to Negotiate when using keberos authentication
            Response.AddHeader("WWW-Authenticate", "NTLM");

            // Send the 401 response
            Response.End();
        }

        protected void ScriptManager1_Unload(object sender, EventArgs e)
        {
            //RegisterUpdatePanel((UpdatePanel)sender);  
        }


        protected void RegisterUpdatePanel(UpdatePanel panel)
        {
            //var sType = typeof(ScriptManager);
            //var mInfo = sType.GetMethod("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel", BindingFlags.NonPublic | BindingFlags.Instance);
            //if (mInfo != null)
            //    mInfo.Invoke(ScriptManager.GetCurrent(Page), new object[] { panel });
        }

        //protected void ScriptManager1_Unload(object sender, EventArgs e)
        //{
        //    MethodInfo methodInfo = typeof(ScriptManager).GetMethods(BindingFlags.NonPublic | BindingFlags.Instance)
        //.Where(i => i.Name.Equals("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel")).First();
        //    methodInfo.Invoke(ScriptManager.GetCurrent(Page),
        //        new object[] { sender as UpdatePanel });

        //}





    }
}