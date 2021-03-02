using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LDC_GEN_WF.Custom
{
    public partial class RequestLog : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           

        }


        //protected void RequestLogGrd_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        //{

        //    if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
        //    {
        //        return;
        //    }
        //    else
        //    {
        //        if (e.GetValue("RequestStatus").ToString().Equals("Reject", StringComparison.CurrentCultureIgnoreCase))
        //        {
        //            try
        //            {
        //                e.Row.BackColor = System.Drawing.Color.LightPink;
        //            }
        //            catch (Exception)
        //            {

        //            }
        //        }
        //        else if (e.GetValue("RequestStatus").ToString().Equals("Accept", StringComparison.CurrentCultureIgnoreCase))
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
 


        protected void RequestActivityLogsDataSource_Init(object sender, EventArgs e)
        {

            //example configure for security controls
            try
            {


                //string connectionString = Encryption.Decrypt(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, "XXXXXX");
                //PeriodsDataSource.ConnectionString = connectionString;


               



                //RequestActivityLogsDataSource.ConnectionString = SecurityManager.SecurityManager.decrypt(
                //        (SecurityManager.SecurityManager.encrypt("Data Source=ncm-uat-srv;Initial Catalog=LDC_GEN_DB;User ID=sa;Password=Kesc@123;Connect Timeout=20000; pooling='true'; Max Pool Size=200", SecurityManager.SecurityManager.getPasswordKeyPRD())), SecurityManager.SecurityManager.getPasswordKeyPRD());


                RequestActivityLogsDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["ncerpDevConnectionString"].ConnectionString.ToString();



            }
            catch (Exception)
            {

            }

        }



        protected void btnExport_Click(object sender, EventArgs e)
        {
            //export log report//
            //ASPxGridViewExporter1.WriteXlsxToResponse();
            // i.WriteXlsxToResponse("LDC-LOG", true);
            this.Export(ASPxGridViewExporter1);
            //this.ExportGridToExcel(RequestLogGrd);
        }




        private void ExportGridToExcel(DevExpress.Web.ASPxGridView.ASPxGridView RequestLogGrd)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "LDC-Report" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            //RequestLogGrd.GridLines = GridLines.Both;
            //RequestLogGrd.HeaderStyle.Font.Bold = true;
            RequestLogGrd.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }


        private void Export(ASPxGridViewExporter i)
        {
            try
            {
                i.WriteXlsxToResponse("LDC-LOG", true);
            }
            catch (Exception)
            {

            }

        }

        protected void UpdatePanel1_Unload(object sender, EventArgs e)
        {
            RegisterUpdatePanel((UpdatePanel)sender); 
        }
        protected void RegisterUpdatePanel(UpdatePanel panel)
        {
            var sType = typeof(ScriptManager);
            var mInfo = sType.GetMethod("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel", BindingFlags.NonPublic | BindingFlags.Instance);
            if (mInfo != null)
                mInfo.Invoke(ScriptManager.GetCurrent(Page), new object[] { panel });
        }

 




    }
}