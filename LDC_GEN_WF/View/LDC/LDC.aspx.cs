using LDC_GEN_WF.DbManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF.View.LDC
{
    public partial class LDC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["thisUserID"] != null)
            {

                try
                {
                    this.reBindLDCControls();

                }
                catch (Exception)
                {

                }

                if (!Page.IsPostBack)
                {

                    try
                    {
                        if (Session["thisUserID"] != null)
                        {
                            //new ControlPanel().controlUIVisibility(RequestControl, "Generate Request", true);

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
            else
            {
                Session.Abandon();
                //Response.Redirect("~/View/unAuthorize.aspx");
                Response.Redirect("../../Login.aspx");

            }

        }


        private void reBindLDCControls()
        {
            new ControlPanel().reBindLDCGridControls(RequestControl, "Pending Requests", "PendingRequestControl");
            new ControlPanel().reBindLDCGridControls(RequestControl, "Approve Requests", "ApproveRequestControl");
            new ControlPanel().reBindLDCGridControls(RequestControl, "Activity Log", "RequestLog");
        }


    }
}