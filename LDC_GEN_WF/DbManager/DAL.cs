using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LDC_GEN_WF.DbManager
{
    public class DAL
    {
        //@isLDCAuthorize as bigint,@isGNTAuthorize as bigint
        public DataTable GenerateLDCRequest(int PID, int DID, int DIV, int DeptID, string Reason, int isLDCAuthorize, int isGNTAuthorize, int AuthorizeDept,string RequestorName)
        {
            int result = 0;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                //@PID as bigint,@DID as bigint,@DIV as bigint,@DeptID as bigint,@Reason as varchar(max)
                SqlCommand cmd = new SqlCommand("GenerateLDCRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd.Parameters.AddWithValue("@DID", Convert.ToInt32(DID));
                cmd.Parameters.AddWithValue("@DIV", Convert.ToInt32(DIV));
                cmd.Parameters.AddWithValue("@DeptID", Convert.ToInt32(DeptID));
                cmd.Parameters.AddWithValue("@Reason", Reason);
                cmd.Parameters.AddWithValue("@isLDCAuthorize", isLDCAuthorize);
                cmd.Parameters.AddWithValue("@isGNTAuthorize", isGNTAuthorize);
                cmd.Parameters.AddWithValue("@AuthorizeDept", AuthorizeDept);
                cmd.Parameters.AddWithValue("@RequestorName", RequestorName);
                //result = cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);



            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return dt;
        }



        public DataTable GenerateGnTRequest(int PID, int DID, int DIV, int DeptID, string Reason, int isLDCAuthorize, int isGNTAuthorize, int AuthorizeDept, string RequestorName)
        {
            int result = 0;
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                //@PID as bigint,@DID as bigint,@DIV as bigint,@DeptID as bigint,@Reason as varchar(max)
                SqlCommand cmd = new SqlCommand("GenerateLDCRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd.Parameters.AddWithValue("@DID", Convert.ToInt32(DID));
                cmd.Parameters.AddWithValue("@DIV", Convert.ToInt32(DIV));
                cmd.Parameters.AddWithValue("@DeptID", Convert.ToInt32(DeptID));
                cmd.Parameters.AddWithValue("@Reason", Reason);
                cmd.Parameters.AddWithValue("@isLDCAuthorize", isLDCAuthorize);
                cmd.Parameters.AddWithValue("@isGNTAuthorize", isGNTAuthorize);
                cmd.Parameters.AddWithValue("@AuthorizeDept", AuthorizeDept);
                cmd.Parameters.AddWithValue("@RequestorName", RequestorName);
                //result = cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return dt;
        }



        public int UpdateRequest(int RequestID, int DeptID, string ApproverComments, int ApproverStatus,string ApproverName)
        {
            int result = 0;

            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                //@RequestID as bigint,@DeptID as bigint,@ApproverComments as varchar(max),@ApproverStatus as bigint
                SqlCommand cmd = new SqlCommand("updateRequestStatus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestID", Convert.ToInt32(RequestID));
                cmd.Parameters.AddWithValue("@DeptID", Convert.ToInt32(DeptID));
                cmd.Parameters.AddWithValue("@ApproverComments", ApproverComments);
                cmd.Parameters.AddWithValue("@ApproverStatus", Convert.ToInt32(ApproverStatus));
                cmd.Parameters.AddWithValue("@ApproverName", ApproverName);

                result = cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return result;
        }




        public int UpdateRequestV2(int RequestID, int DeptID, string ApproverComments, int ApproverStatus, string ApproverName, int ActualReading, int PreviousReading, int isApprove)
        {

            //for new requirement for LDC-GEN COM
            int result = 0;

            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                //@RequestID as bigint,@DeptID as bigint,@ApproverComments as varchar(max),@ApproverStatus as bigint
                SqlCommand cmd = new SqlCommand("updateRequestStatusV2", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestID", Convert.ToInt32(RequestID));
                cmd.Parameters.AddWithValue("@DeptID", Convert.ToInt32(DeptID));
                cmd.Parameters.AddWithValue("@ApproverComments", ApproverComments);
                cmd.Parameters.AddWithValue("@ApproverStatus", Convert.ToInt32(ApproverStatus));
                cmd.Parameters.AddWithValue("@ApproverName", ApproverName);
                cmd.Parameters.AddWithValue("@ActualReading", ActualReading);
                cmd.Parameters.AddWithValue("@PreviousReading", PreviousReading);
                cmd.Parameters.AddWithValue("@isApprove", isApprove);

                result = cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return result;
        }



        public DataTable getCompleteRequestStatusAfterUpdateRequest(int RequestID)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();

            try
            {
                //@RequestID as bigint,@DeptID as bigint,@ApproverComments as varchar(max),@ApproverStatus as bigint
                SqlCommand cmd = new SqlCommand("getCompleteRequestStatus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@newRequestID", Convert.ToInt32(RequestID));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return dt;

        }








        public bool chkApprovalDept(int thisInitiatorID, int thisDeptID, int thisReqID)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            bool b = false;
            if (Convert.ToInt32(thisDeptID) != Convert.ToInt32(thisInitiatorID))
            {

                try
                {
                    //@RequestID as bigint,@DeptID as bigint,@ApproverComments as varchar(max),@ApproverStatus as bigint
                    SqlCommand cmd = new SqlCommand("ChkAuthorizationApproval", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@InitiatorID", Convert.ToInt32(thisInitiatorID));
                    cmd.Parameters.AddWithValue("@DepID", Convert.ToInt32(thisDeptID));
                    cmd.Parameters.AddWithValue("@RequestID", thisReqID);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        b = true;
                    }
                    else
                    {
                        b = false;
                    }

                }
                catch (Exception)
                {

                    con.Close();
                }
                finally
                {
                    con.Close();
                }

            }
            else
            {
                b = false;
            }

            return b;

        }








        public List<object> getSelectedValues(DevExpress.Web.ASPxGridView.ASPxGridView gv)
        {
            List<object> row = new List<object>();
            List<string> fieldNames = new List<string>();
            foreach (var column in gv.Columns)
            {
                if ((column as GridViewColumn) is GridViewDataColumn)
                {
                    fieldNames.Add((column as GridViewDataColumn).FieldName);
                }
            }

            row = gv.GetSelectedFieldValues(fieldNames.ToArray());
            return row;

        }






        public DataTable getEmailRecipients(int PID,int DeptID)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("getEmailRecipients", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                cmd.Parameters.AddWithValue("@DeptID", Convert.ToInt32(DeptID));
                //result = cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return dt;

        }







        //public void controlUIVisibility(Custom.RequestControl RequestControl,string controlText, bool visibility)
        //{
          
        //    if ((RequestControl.FindControl("ASPxPageControl1")) is DevExpress.Web.ASPxTabControl.ASPxPageControl)
        //    {
        //        if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).HasVisibleTabs())
        //        {
        //            for (int i = 0; i < (RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages.Count; i++)
        //            {
        //                if ((RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Text
        //                        .Equals(controlText, StringComparison.CurrentCultureIgnoreCase))
        //                {
        //                    (RequestControl.FindControl("ASPxPageControl1") as DevExpress.Web.ASPxTabControl.ASPxPageControl).TabPages[i].Visible = visibility;
        //                    break;

        //                }

        //            }


        //        }
        //    }

        //}










    }

    
}