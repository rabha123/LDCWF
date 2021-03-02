using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LDC_GEN_WF.DbManager
{
    public class ControlPanel
    {


        public void initializePendingRequestGrdControl(Custom.PendingRequestControl PendingRequestControl, string controlName)
        {

            try
            {

                if ((PendingRequestControl.FindControl(controlName)) is DevExpress.Web.ASPxGridView.ASPxGridView)
                {
                    (PendingRequestControl.FindControl(controlName) as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
                }



            }
            catch (Exception)
            {

            }

        }

        public void initializeRequestLogControl(Custom.RequestLog RequestLog, string controlName)
        {

            try
            {

                if ((RequestLog.FindControl(controlName)) is DevExpress.Web.ASPxGridView.ASPxGridView)
                {
                    (RequestLog.FindControl(controlName) as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
                }

            }
            catch (Exception)
            {
                
         
            }


        }


        public void controlUIVisibility(Custom.RequestControl RequestControl, string controlName, bool visibility)
        {

            try
            {


                if ((RequestControl.FindControl("ASPxPageControl1")) is DevExpress.Web.ASPxTabControl.ASPxPageControl)
                {
                    if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).HasVisibleTabs())
                    {
                        for (int i = 0; i < (RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages.Count; i++)
                        {
                            if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Text
                                    .Equals(controlName, StringComparison.CurrentCultureIgnoreCase))
                            {
                                (RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Visible = visibility;
                                break;

                            }

                        }


                    }
                }

            }
            catch (Exception)
            {

            }




           

        }



        public void reBindGnTGridControls(Custom.GntControl GntControl,string tabName,string controlName)
        {


            //(GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[1].FindControl("ApproveRequestControl").FindControl("ApproveRequestsGrd").DataBind();
            //(GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[2].FindControl("RequestLog").FindControl("RequestLogGrd").DataBind();


            try
            {


                if (GntControl.FindControl("ASPxPageControl1") is DevExpress.Web.ASPxTabControl.ASPxPageControl)
                {
                    if ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).HasVisibleTabs())
                    {
                        for (int i = 0; i < (GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages.Count; i++)
                        {
                            if ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Text.Equals(tabName, StringComparison.CurrentCultureIgnoreCase))
                            {
                                if ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName) != null)
                                {
                                    if ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls.Count > 0)
                                    {


                                        if ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls.Count > 0)
                                        {
                                            for (int k = 0; k < (GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls.Count; k++)
                                            {
                                                if ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls[k] is DevExpress.Web.ASPxGridView.ASPxGridView)
                                                {
                                                    ((GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls[k] as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
                                                }
                                            }
                                        }

                                        break;
                                    }
                                }
                            }
                        }
                    }
                }

            }
            catch (Exception)
            {
                

            }





        }



        public void reBindLDCGridControls(Custom.RequestControl LDCControl, string tabName, string controlName)
        {


            //(GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[1].FindControl("ApproveRequestControl").FindControl("ApproveRequestsGrd").DataBind();
            //(GntControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[2].FindControl("RequestLog").FindControl("RequestLogGrd").DataBind();
            try
            {

                if (LDCControl.FindControl("ASPxPageControl1") is DevExpress.Web.ASPxTabControl.ASPxPageControl)
                {
                    if ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).HasVisibleTabs())
                    {
                        for (int i = 0; i < (LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages.Count; i++)
                        {
                            if ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Text.Equals(tabName, StringComparison.CurrentCultureIgnoreCase))
                            {
                                if ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName) != null)
                                {
                                    if ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls.Count > 0)
                                    {


                                        if ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls.Count > 0)
                                        {
                                            for (int k = 0; k < (LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls.Count; k++)
                                            {
                                                if ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls[k] is DevExpress.Web.ASPxGridView.ASPxGridView)
                                                {
                                                    ((LDCControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].FindControl(controlName).Controls[k] as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
                                                }
                                            }
                                        }

                                        break;
                                    }
                                }
                            }
                        }
                    }
                }

            }
            catch (Exception)
            {


            }





        }







        public void initializeInputControls(Custom.RequestControl RequestControl, string controlName)
        {

            try
            {


                if ((RequestControl.FindControl("ASPxPageControl1")) is DevExpress.Web.ASPxTabControl.ASPxPageControl)
                {
                    if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).HasVisibleTabs())
                    {
                        for (int i = 0; i < (RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages.Count; i++)
                        {
                            if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Text.Equals(controlName, StringComparison.CurrentCultureIgnoreCase))
                            {

                                if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls.Count > 0)
                                {
                                    for (int k = 0; k < (RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls.Count; k++)
                                    {
                                        if (((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls[k]) is DevExpress.Web.ASPxEditors.ASPxTextBox)
                                        {
                                            (((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls[k]) as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = string.Empty;

                                        }
                                        else if (((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls[k]) is System.Web.UI.WebControls.TextBox)
                                        {
                                            (((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls[k]) as System.Web.UI.WebControls.TextBox).Text = string.Empty;
                                        }
                                        else if (((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls[k]) is DevExpress.Web.ASPxEditors.ASPxComboBox)
                                        {
                                            (((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Controls[k]) as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;
                                        }


                                    }
                                }


                            }

                        }


                    }
                }

            }
            catch (Exception)
            {
                
             
            }

            



        }






        public void initializeModalPopUpControl(Custom.PendingRequestControl PendingRequestControl)
        {

            try
            {

                if ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls.Count > 0)
                {
                    for (int i = 0; i < (PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls.Count; i++)
                    {
                        if ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls[i] is DevExpress.Web.ASPxEditors.ASPxTextBox)
                        {
                            ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls[i] as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = string.Empty;
                        }
                        else if ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls[i] is System.Web.UI.WebControls.TextBox)
                        {
                            ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls[i] as System.Web.UI.WebControls.TextBox).Text = string.Empty;
                        }
                        else if ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls[i] is DevExpress.Web.ASPxEditors.ASPxComboBox)
                        {
                            ((PendingRequestControl.FindControl("modalApprovalPopup") as DevExpress.Web.ASPxPopupControl.ASPxPopupControl).Controls[i] as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;
                        }

                    }
                }

            }
            catch (Exception)
            {
                
         
            }
   
        }


        //private void initControls()
        //{
        //    if ((PendingRequestControl.FindControl("PendingRequestsGrd")) is DevExpress.Web.ASPxGridView.ASPxGridView)
        //    {
        //        (PendingRequestControl.FindControl("PendingRequestsGrd") as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
        //    }

        //    if ((RequestLog.FindControl("RequestLogGrd")) is DevExpress.Web.ASPxGridView.ASPxGridView)
        //    {
        //        (RequestLog.FindControl("RequestLogGrd") as DevExpress.Web.ASPxGridView.ASPxGridView).DataBind();
        //    }

        //}




    }
}