using LDC_GEN_WF.DbManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace LDC_GEN_WF.Custom
{
    public partial class RequestControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }








        protected void btnGenerateLDCRequest_Click(object sender, EventArgs e)
        {
            if ((comboPalnts.SelectedIndex >= 0) && (comboDemand.SelectedIndex >= 0))
            {
                string PID = comboPalnts.SelectedItem.Value.ToString();
                string DID = comboDemand.SelectedItem.Value.ToString();
                string DIV = txtDemandValue.Text.ToString();
                string Reason = txtReason.Text.ToString();

                if ((((string.IsNullOrEmpty(PID) == false) && (string.IsNullOrWhiteSpace(PID) == false)) && ((string.IsNullOrEmpty(DID) == false) && (string.IsNullOrWhiteSpace(DID) == false)) &&
                        ((string.IsNullOrEmpty(DIV) == false) && (string.IsNullOrWhiteSpace(DIV) == false)) && ((string.IsNullOrEmpty(Reason) == false) && (string.IsNullOrWhiteSpace(Reason) == false))))
                {
                    if (((SecurityManager.SecurityManager.IsNumeric(PID) == true) && (SecurityManager.SecurityManager.IsNumeric(DID)) && (SecurityManager.SecurityManager.IsNumeric(DIV))))
                    {
                        //int PID, int DID, int DIV, int DeptID, string Reason
                        if (Convert.ToInt32(DIV) > 0)
                        {
                            if ((Session["thisDeptID"] != null) && (Session["thisDeptID"]).ToString().Equals("1", StringComparison.CurrentCultureIgnoreCase))
                            {
                                //LDC REQUEST
                                DataTable dt = new DAL().GenerateLDCRequest(Convert.ToInt32(PID.ToString().Trim()), Convert.ToInt32(DID.ToString().Trim()),
                                                            Convert.ToInt32(DIV.ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()), Reason, 0, 1, 2, Session["thisUserName"].ToString());

                                //check for sucessfull insertion
                                if (dt.Rows.Count > 0)
                                {

                                    StringBuilder MailMess = new EmailManager().generateHTMLEmailTemplateInsertion(dt, Convert.ToInt32(PID), Convert.ToInt32(DID), Convert.ToInt32(DIV), txtReason.Text.ToString(),
                                                             comboPalnts.SelectedItem.Text.ToString(), comboDemand.SelectedItem.Text.ToString());

                                    if (MailMess.Length>0)
                                    {
                                        DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));
                                        if (er.Rows.Count > 0)
                                        {
                                            List<string> RTO = new EmailManager().chkMailRecipientsName("RTO", er);
                                            List<string> RCC = new EmailManager().chkMailRecipientsName("RCC", er);

                                            if ((RTO.Count() > 0) && (RCC.Count() > 0))
                                            {
                                                //ORIGINAL LOGIC BEFORE DB MAIL
                                                //new EmailManager().sendRequestMail(MailMess, Convert.ToInt32(PID), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));


                                                //original logic before implementing CRF-2 changes..comment on 07042020..
                                                //new EmailManager().sendLDCGEN_CommunicationMail(MailMess, Convert.ToInt32(PID), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));


                                                //implement CRF-2 changes 06042020..
                                                string RequestID = ((from myRow in dt.AsEnumerable()
                                                                     where 
                                                                     (String.IsNullOrEmpty(myRow.Field<Int64>("RequestID").ToString()) == false && 
                                                                     String.IsNullOrWhiteSpace(myRow.Field<Int64>("RequestID").ToString()) == false)
                                                                     select myRow.Field<Int64>("RequestID")).ElementAt(0).ToString().Trim());


                                                //DECIDE AFTER UAT SESSION 02 24092019...........implement CRF-2 changes 06042020..
                                                new EmailManager().sendLDCGEN_CommunicationMailV2(MailMess, Convert.ToInt32(PID), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()),RequestID);

                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Done')", true);

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


                                       // new EmailManager().sendRequestMail(MailMess, Convert.ToInt32(PID), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));

                                                //string errorCode = new EmailManager().sendRequestMail(MailMess, Convert.ToInt32(PID), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));
                                                //if (errorCode.Equals("1",StringComparison.CurrentCultureIgnoreCase))
                                                //{
                                                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Done')", true);
                             
                                                //}
                                                //else if (errorCode.Equals("0", StringComparison.CurrentCultureIgnoreCase))
                                                //{
                                                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('unable to find recipients')", true);
                                             
                                                //}
                                                //else if (errorCode.Equals("2", StringComparison.CurrentCultureIgnoreCase))
                                                //{
                                                  
                                                //}

                                    }
                                    


                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('something went wrong : ( ')", true);
                                    //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "erroralertWarning('something  went wrong');", true);
                                }

                                //new ControlPanel().initializePendingRequestGrdControl(PendingRequestControl, "PendingRequestsGrd");
                                //new ControlPanel().initializePendingRequestGrdControl(PendingRequestControl, "ApproveRequestsGrd");




                                //original logics
                                new ControlPanel().initializeRequestLogControl(RequestLog, "RequestLogGrd");
                                new ControlPanel().initializeInputControls(this, "Generate Request");
                                PendingRequestsGrd.DataBind();



                            }
                            else if ((Session["thisDeptID"] != null) && (Session["thisDeptID"]).ToString().Equals("2", StringComparison.CurrentCultureIgnoreCase))
                            {
                                //GNT REQUEST
                                //DataTable dt = new DAL().GenerateGnTRequest(Convert.ToInt32(PID.ToString().Trim()), Convert.ToInt32(DID.ToString().Trim()),
                                //                           Convert.ToInt32(DIV.ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()), Reason, 1, 0, 1, Session["thisUserName"].ToString());


                                //new ControlPanel().initializePendingRequestGrdControl(PendingRequestControl, "PendingRequestsGrd");
                                //new ControlPanel().initializePendingRequestGrdControl(PendingRequestControl, "ApproveRequestsGrd");
                                //new ControlPanel().initializeRequestLogControl(RequestLog, "RequestLogGrd");
                                //new ControlPanel().initializeInputControls(this, "Generate Request");

                            }




                        }

                    }

                }
                else
                {
                    //must provide mandatory parameters
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must provide mandatory details as required')", true);
                }

            }
            else
            {
                //must provide mandatory parameters
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must provide mandatory details as required')", true);
            }

        }

        protected void btnRequestDetails_Click(object sender, EventArgs e)
        {
                //uat requirement to update the request status against 
                List<object> sRow = new DAL().getSelectedValues(PendingRequestsGrd);
                if (sRow.Count()>0)
                {
                    if ((sRow.ElementAt(0) is Array))
                    {
                        string reqID = (sRow.ElementAt(0) as Array).GetValue(0).ToString();
                         if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(0).ToString()))&& (SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(8).ToString())))
                         {
                             //INITIATOR == INITIATOR
                             if (Convert.ToInt32(Session["thisDeptID"].ToString()) == Convert.ToInt32((sRow.ElementAt(0) as Array).GetValue(8).ToString()))
                             {
                                 if (new DAL().chkApprovalDept(Convert.ToInt32((sRow.ElementAt(0) as Array).GetValue(8).ToString()), Convert.ToInt32(Session["thisDeptID"].ToString()), Convert.ToInt32(reqID))==false)
                                 {
                                     Session["thisRequestID"] = reqID;
                                     modalEditingPanel.ShowOnPageLoad = true;

                                     modalEditingPanel.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.WindowCenter;
                                     modalEditingPanel.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.WindowCenter;

                                     PendingRequestsApprovalGrd.DataBind();

                                 }
                             }

                         }
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must select row in order to initiate request')", true);
                }


        }

        protected void btnApproverAction_Click(object sender, EventArgs e)
        {
            //EDIT LDC GENERATED REQUEST THROUGH LDC..
            if (((string.IsNullOrEmpty(txtChangeDemandValue.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtChangeDemandValue.Text.ToString()) == false)))
            {
                if (((SecurityManager.SecurityManager.IsNumeric(txtChangeDemandValue.Text) == true)))
                {
                    if (Session["thisRequestID"] != null)
                    {
                        new DAL().UpdateRequestV2(Convert.ToInt32(Session["thisRequestID"].ToString()),Convert.ToInt32(Session["thisDeptID"]),
                            txtReasonEdit.Text.ToString(), 5 , Session["thisUserName"].ToString(),Convert.ToInt32(txtChangeDemandValue.Text.ToString()), 0,0);

                        DataTable crs = new DAL().getCompleteRequestStatusAfterUpdateRequest(Convert.ToInt32(Session["thisRequestID"].ToString()));
                        if (crs.Rows.Count > 0)
                        {
                            modalEditingPanel.ShowOnPageLoad = false;
                            StringBuilder MailMess = new EmailManager().generateHTMLEmailTemplateEditRequest(crs);
                            if (MailMess.Length > 0)
                            {
                                DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));
                                 if (er.Rows.Count > 0)
                                 {
                                     List<string> RTO = new EmailManager().chkMailRecipientsName("RTO", er);
                                     List<string> RCC = new EmailManager().chkMailRecipientsName("RCC", er);
                                      if ((RTO.Count() > 0) && (RCC.Count() > 0))
                                      {

                                          //comment before implemnt CRF-2 CHANGES .. comment on 07042020
                                          //new EmailManager().sendLDCGEN_CommunicationMail(MailMess, Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()));

                                          //DECIDE AFTER UAT SESSION 02 24092019...implement CRF-2 changes .. implement on 07042020
                                          new EmailManager().sendLDCGEN_CommunicationMailV2(MailMess, 
                                              Convert.ToInt32(crs.Rows[0]["PlantID"].ToString().Trim()), Convert.ToInt32(Session["thisDeptID"].ToString().Trim()),
                                                                                                        Convert.ToInt32(Session["thisRequestID"].ToString()).ToString());

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


                            }


                        }

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Values must be numeric')", true);
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