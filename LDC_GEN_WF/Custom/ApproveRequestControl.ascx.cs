using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF.Custom
{
    public partial class ApproveRequestControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        //protected void ApproveRequestsGrd_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
        //    {
        //        return;
        //    }
        //    else
        //    {
        //        if (e.GetValue("RequestStatus").ToString().Equals("Accept", StringComparison.CurrentCultureIgnoreCase))
        //        {
        //            try
        //            {
        //                e.Row.BackColor = System.Drawing.Color.LightGreen;
        //            }
        //            catch (Exception)
        //            {

        //            }
        //        }

        //    }
        //}

    }
}