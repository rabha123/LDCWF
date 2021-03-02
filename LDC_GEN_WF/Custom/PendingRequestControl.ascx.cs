using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LDC_GEN_WF.DbManager;
using System.Text;
using System.Data;


namespace LDC_GEN_WF.Custom
{
    public partial class PendingRequestControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }


        protected void PendingRequestsGrd_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            //if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            //{
            //    return; 
            //}
            //else
            //{
            //   if (e.GetValue("RequestStatus").ToString().Equals("Reject",StringComparison.CurrentCultureIgnoreCase))
            //   {
            //       try
            //       {
            //           e.Row.BackColor = System.Drawing.Color.LightPink;
            //       }
            //       catch (Exception)
            //       {
                      
            //       }
            //   }

            //}
        }

  




        protected void btnRequestDetails_Click(object sender, EventArgs e)
        {
                List<object> sRow =  new DAL().getSelectedValues(PendingRequestsGrd);
                if (sRow.Count()>0)
                {
                    if ((sRow.ElementAt(0) is Array))
                    {
                        string reqID = (sRow.ElementAt(0) as Array).GetValue(0).ToString();
                        if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(0).ToString()))
                            && (SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(8).ToString())))
                        {
                            if (Convert.ToInt32(Session["thisDeptID"].ToString()) != Convert.ToInt32((sRow.ElementAt(0) as Array).GetValue(8).ToString()))
                            {
                                //string IRID = (sRow.ElementAt(0) as Array).GetValue(8).ToString();
                                //new DAL().chkApprovalDept(Convert.ToInt32((sRow.ElementAt(0) as Array).GetValue(8).ToString()),
                                //    Convert.ToInt32(Session["thisDeptID"].ToString()), Convert.ToInt32(reqID));
                                if (new DAL().chkApprovalDept(Convert.ToInt32((sRow.ElementAt(0) as Array).GetValue(8).ToString()), Convert.ToInt32(Session["thisDeptID"].ToString()), Convert.ToInt32(reqID)))
                                {
                                    btnApproverAction.Visible = true;
                                    comboRequestStatus.Visible = true;

                                    Session["thisRequestID"] = reqID;
                                    modalApprovalPopup.ShowOnPageLoad = true;

                                     modalApprovalPopup.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.WindowCenter;
                                     modalApprovalPopup.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.WindowCenter;


                                     PendingRequestsApprovalGrd.DataBind();
                                    
                                }
                                else
                                {
                                    btnApproverAction.Visible = false;
                                    comboRequestStatus.Visible = false;

                                    Session["thisRequestID"] = reqID;
                                    modalApprovalPopup.ShowOnPageLoad = true;

                                     modalApprovalPopup.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.WindowCenter;
                                    modalApprovalPopup.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.WindowCenter;

                                    PendingRequestsApprovalGrd.DataBind();
                                    new ControlPanel().initializeModalPopUpControl(this);
                                }

                            }
                            else
                            {
                                btnApproverAction.Visible = false;
                                comboRequestStatus.Visible=false;

                                Session["thisRequestID"] = reqID;
                                modalApprovalPopup.ShowOnPageLoad = true;

                                modalApprovalPopup.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.WindowCenter;
                                modalApprovalPopup.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.WindowCenter;

                                PendingRequestsApprovalGrd.DataBind();
                                new ControlPanel().initializeModalPopUpControl(this);

                            }

                            
                        }
                      
                    }
                     
                }
                else
                {
                        //must select row in order to initiate
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must select row in order to initiate request')", true);

                }

        }

        protected void btnApproverAction_Click(object sender, EventArgs e)
        {
            //AFTER UAT SESSION-1
             if (((string.IsNullOrEmpty(txtApproverComments.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtApproverComments.Text.ToString()) == false)) &&
                 ((string.IsNullOrEmpty(txtActualReading.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtActualReading.Text.ToString()) == false)) &&
                 ((string.IsNullOrEmpty(txtPreviousReading.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtPreviousReading.Text.ToString()) == false)))
             {

                 if (((SecurityManager.SecurityManager.IsNumeric(txtActualReading.Text ) == true) && (SecurityManager.SecurityManager.IsNumeric(txtPreviousReading.Text.ToString()))))
                 {

                     if (comboRequestStatus.SelectedIndex >= 0)
                     {
                         if (Session["thisRequestID"] != null)
                         {
                             //BEFORE UAT SESSION -1
                             //new DAL().UpdateRequest(Convert.ToInt32(Session["thisRequestID"].ToString()),
                             //            Convert.ToInt32(Session["thisDeptID"]), txtApproverComments.Text.ToString(), Convert.ToInt32(comboRequestStatus.SelectedItem.Value), Session["thisUserName"].ToString());

                             //AFTER UAT SESSION-1
                             new DAL().UpdateRequestV2(Convert.ToInt32(Session["thisRequestID"].ToString()),
                                       Convert.ToInt32(Session["thisDeptID"]), txtApproverComments.Text.ToString(),Convert.ToInt32(comboRequestStatus.SelectedItem.Value), Session["thisUserName"].ToString(), 
                                       Convert.ToInt32(txtActualReading.Text.ToString()), Convert.ToInt32(txtPreviousReading.Text.ToString()),1);

                             DataTable crs = new DAL().getCompleteRequestStatusAfterUpdateRequest(Convert.ToInt32(Session["thisRequestID"].ToString()));
                             if (crs.Rows.Count > 0)
                             {
                                 modalApprovalPopup.ShowOnPageLoad = false;

                                 StringBuilder MailMess = new EmailManager().generateHTMLEmailTemplateUpdate(crs);
                                 if (MailMess.Length > 0)
                                 {
                                     DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));
                                     if (er.Rows.Count > 0)
                                     {
                                         List<string> RTO = new EmailManager().chkMailRecipientsName("RTO", er);
                                         List<string> RCC = new EmailManager().chkMailRecipientsName("RCC", er);

                                         if ((RTO.Count() > 0) && (RCC.Count() > 0))
                                         {
                                             //ORIGINAL LOGIC BEFORE DB MAIL
                                             //new EmailManager().sendRequestMail(MailMess, Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));

                                             //comment before implemeting CRF-2 changes .. comments on 07042020
                                            // new EmailManager().sendLDCGEN_CommunicationMail(MailMess, Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));


                                             //DECIDE AFTER UAT SESSION 02 24092019...implement CRF-2 changes posted on 07042020
                                             new EmailManager().sendLDCGEN_CommunicationMailV2(MailMess, Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()),
                                                 Convert.ToInt32(Session["thisDeptID"].ToString().Trim()), Convert.ToInt32(Session["thisRequestID"].ToString()).ToString());

                                         }
                                         else
                                         {
                                             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('unable to find recipients')", true);
                                         }

                                     }
                                     else
                                     {
                                         ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('unable to find recipients')", true);
                                     }

                                     //new EmailManager().sendRequestMail(MailMess, Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));
                                     //string errorCode = new EmailManager().sendRequestMail(MailMess, Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));
                                     //if (errorCode.Equals("1", StringComparison.CurrentCultureIgnoreCase))
                                     //{


                                     //}
                                     //else
                                     //{
                                     //    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "ClosePopWindow();", true);

                                     //}



                                     //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Done')", true);
                                     //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "sucessalert('Record Updated Sucessfully');", true);
                                     //Page.ClientScript.RegisterStartupScript(GetType(), "script", "ClosePopWindow();", true);
                                     // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "ClosePopWindow();", true);
                                     //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "ClosePopWindow();", true);
                                     //modalApprovalPopup.ShowOnPageLoad = false;


                                 }


                             }

                             PendingRequestsGrd.DataBind();
                             PendingRequestsApprovalGrd.DataBind();
                             Session["thisRequestID"] = null;

                             txtApproverComments.Text = string.Empty;
                             comboRequestStatus.SelectedIndex = -1;

                             // (PendingRequestControl.FindControl("RequestLogGrd") as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();

                         }
                         else
                         {
                             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must select row in order to initiate request')", true);
                         }

                     }
                     else
                     {
                         //must provide mandatory approver status
                         ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must provide mandatory approver status')", true);
                     }

                 }
                 else
                 {
                     ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Reading Values must be numeric')", true);
                 }

             }
            else
             {
                 //must provide mandatory approver comments
                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must provide mandatory details as required')", true);
             }

        }

 







    }
}