using DevExpress.Web.ASPxGridView;
using LDC_GEN_WF.DbManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF.Custom
{
    public partial class LDCControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LDCGrd_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string PID = e.NewValues["Plant"].ToString();
            string DID = e.NewValues["Demand"].ToString();
            string DIV = e.NewValues["DemandValue"].ToString();
            string Reason = e.NewValues["Reason"].ToString();

            if ((((string.IsNullOrEmpty(PID)==false) && (string.IsNullOrWhiteSpace(PID)==false)) && ((string.IsNullOrEmpty(DID) == false) && (string.IsNullOrWhiteSpace(DID) == false)) &&
                ((string.IsNullOrEmpty(DIV) == false) && (string.IsNullOrWhiteSpace(DIV) == false)) && ((string.IsNullOrEmpty(Reason) == false) && (string.IsNullOrWhiteSpace(Reason) == false))))
            {
                if (((SecurityManager.SecurityManager.IsNumeric(PID)==true) && (SecurityManager.SecurityManager.IsNumeric(DID)) && (SecurityManager.SecurityManager.IsNumeric(DIV))))
                {
                    //int PID, int DID, int DIV, int DeptID, string Reason
                    if (Convert.ToInt32(DIV)>0)
                    {
                        //new DAL().GenerateLDCRequest(Convert.ToInt32(PID.ToString().Trim()), Convert.ToInt32(DID.ToString().Trim()), Convert.ToInt32(DIV.ToString().Trim()), 1, Reason);
                    }
                   
                }

            }
            else
            {
                //must provide mandatory parameters
            }

 



        }







    }
}