using LDC_GEN_WF.DbManager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF.View.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                try
                {
                    if (Session["thisUserID"] != null)
                    {

                    }
                    else
                    {
                        Session.Abandon();
                        //Response.Redirect("~/View/unAuthorize.aspx");
                        Response.Redirect("../../Login.aspx");
                    }
                }
                catch (Exception)
                {
                    Session.Abandon();
                    //Response.Redirect("~/View/unAuthorize.aspx");
                    Response.Redirect("../../Login.aspx");
                }

            }


        }
    }
}