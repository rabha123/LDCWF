using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LDC_GEN_WF.DbManager;
using LDC_GEN_WF.Custom;

namespace LDC_GEN_WF.View.Generation
{
    public partial class GnT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["thisUserID"] != null)
            {
                try{
                    //this.reBindGnTontrols();
                }
                catch (Exception) {
                }

                if (!Page.IsPostBack)
                {
                    try
                    {
                        if (Session["thisUserID"] != null)
                        {
                            //new ControlPanel().controlUIVisibility(RequestControl, "Generate Request", false);
                            //(PendingRequestControl.FindControl("RequestLogGrd") as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
                            this.reBindGnTontrols();

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

        private void reBindGnTontrols()
        {
            new ControlPanel().reBindGnTGridControls(GntControl, "Approve Requests", "ApproveRequestControl");
            new ControlPanel().reBindGnTGridControls(GntControl, "Activity Log", "RequestLog");
        }



    }
}