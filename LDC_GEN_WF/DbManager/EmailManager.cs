using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace LDC_GEN_WF.DbManager
{
    public class EmailManager
    {







        public StringBuilder generateHTMLEmailTemplateUpdate(DataTable requestTable)
        {
            StringBuilder MailMess = new StringBuilder();
            //DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID));
            string xEmail = string.Empty;

          
                xEmail = this.getTemplateView(2).Rows[0][0].ToString();

                xEmail = xEmail.Replace("@@RequestID", ((from myRow in requestTable.AsEnumerable()
                                                         where
                                                             (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                             String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                         select myRow.Field<Int32>("RequestID")).ElementAt(0).ToString()));

                xEmail = xEmail.Replace("@@RequestStatus", ((from myRow in requestTable.AsEnumerable()
                                                             where
                                                                 (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                                 String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                                select myRow.Field<string>("RequestStatus")).ElementAt(0).ToString()));


                xEmail = xEmail.Replace("@@Plant", ((from myRow in requestTable.AsEnumerable()
                                                     where
                                                         (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                         String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                     select myRow.Field<string>("Plant")).ElementAt(0).ToString()));



                xEmail = xEmail.Replace("@@RequestNature",  ((from myRow in requestTable.AsEnumerable()
                                                     where
                                                         (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                         String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                              select myRow.Field<string>("Demand")).ElementAt(0).ToString()));






                xEmail = xEmail.Replace("@@RequestQuantity", ((from myRow in requestTable.AsEnumerable()
                                                               where
                                                                   (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                                   String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                               select myRow.Field<Int64>("DemandValue")).ElementAt(0).ToString()));



                xEmail = xEmail.Replace("@@ReasonforRequest", ((from myRow in requestTable.AsEnumerable()
                                                                where
                                                                    (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                                    String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                                select myRow.Field<string>("Reason")).ElementAt(0).ToString()));






                xEmail = xEmail.Replace("@@RequestDate", ((from myRow in requestTable.AsEnumerable()
                                                           where
                                                               (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                               String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                           select myRow.Field<string>("RequestDate")).ElementAt(0).ToString()));



                xEmail = xEmail.Replace("@@ApproverComments", ((from myRow in requestTable.AsEnumerable()
                                                           where
                                                               (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                               String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                                select myRow.Field<string>("ApproverComments")).ElementAt(0).ToString()));


                //LastActionDate
                xEmail = xEmail.Replace("@@ApproverDate", ((from myRow in requestTable.AsEnumerable()
                                                                where
                                                                    (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                                    String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                                select myRow.Field<string>("LastActionDate")).ElementAt(0).ToString()));
          



            
            MailMess.Append(xEmail);
            return MailMess;

        }




        public StringBuilder generateHTMLEmailTemplateEditRequest(DataTable requestTable)
        {
            StringBuilder MailMess = new StringBuilder();
            //DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID));
            string xEmail = string.Empty;


            xEmail = this.getTemplateView(3).Rows[0][0].ToString();

            xEmail = xEmail.Replace("@@RequestID", ((from myRow in requestTable.AsEnumerable()
                                                     where
                                                         (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                         String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                     select myRow.Field<Int32>("RequestID")).ElementAt(0).ToString()));

            xEmail = xEmail.Replace("@@RequestStatus", ((from myRow in requestTable.AsEnumerable()
                                                         where
                                                             (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                             String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                         select myRow.Field<string>("RequestStatus")).ElementAt(0).ToString()));


            xEmail = xEmail.Replace("@@Plant", ((from myRow in requestTable.AsEnumerable()
                                                 where
                                                     (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                     String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                 select myRow.Field<string>("Plant")).ElementAt(0).ToString()));



            xEmail = xEmail.Replace("@@RequestNature", ((from myRow in requestTable.AsEnumerable()
                                                         where
                                                             (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                             String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                         select myRow.Field<string>("Demand")).ElementAt(0).ToString()));






            xEmail = xEmail.Replace("@@RequestQuantity", ((from myRow in requestTable.AsEnumerable()
                                                           where
                                                               (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                               String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                           select myRow.Field<Int64>("DemandValue")).ElementAt(0).ToString()));



            xEmail = xEmail.Replace("@@ReasonforRequest", ((from myRow in requestTable.AsEnumerable()
                                                            where
                                                                (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                                String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                            select myRow.Field<string>("Reason")).ElementAt(0).ToString()));






            xEmail = xEmail.Replace("@@RequestDate", ((from myRow in requestTable.AsEnumerable()
                                                       where
                                                           (String.IsNullOrEmpty(myRow.Field<Int32>("RequestID").ToString()) == false &&
                                                           String.IsNullOrWhiteSpace(myRow.Field<Int32>("RequestID").ToString()) == false)
                                                       select myRow.Field<string>("RequestDate")).ElementAt(0).ToString()));









            MailMess.Append(xEmail);
            return MailMess;

        }




        public StringBuilder generateHTMLEmailTemplateInsertion(DataTable requestTable, int PID, int DID, int DIV, string ReasonForRequest, string plantName, string demandName)
        {
            StringBuilder MailMess = new StringBuilder();
            //DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID));
             string xEmail = string.Empty;

                 xEmail = this.getTemplateView(1).Rows[0][0].ToString();
                xEmail = xEmail.Replace("@@RequestID", ((from myRow in requestTable.AsEnumerable()
                                                            where
                                                                (String.IsNullOrEmpty(myRow.Field<Int64>("RequestID").ToString()) == false &&
                                                                String.IsNullOrWhiteSpace(myRow.Field<Int64>("RequestID").ToString()) == false)
                                                            select myRow.Field<Int64>("RequestID")).ElementAt(0).ToString()));

                xEmail = xEmail.Replace("@@RequestIDCell", ((from myRow in requestTable.AsEnumerable()
                                                            where
                                                                (String.IsNullOrEmpty(myRow.Field<Int64>("RequestID").ToString()) == false &&
                                                                String.IsNullOrWhiteSpace(myRow.Field<Int64>("RequestID").ToString()) == false)
                                                            select myRow.Field<Int64>("RequestID")).ElementAt(0).ToString()));


                xEmail = xEmail.Replace("@@Plant", plantName.ToString().ToUpper());
                xEmail = xEmail.Replace("@@RequestNature", demandName.ToString().ToUpper());
                xEmail = xEmail.Replace("@@RequestQuantity", DIV.ToString().ToUpper());
                xEmail = xEmail.Replace("@@RequestDate", ((from myRow in requestTable.AsEnumerable()
                                                             where
                                                                 (String.IsNullOrEmpty(myRow.Field<string>("RequestDate").ToString()) == false &&
                                                                 String.IsNullOrWhiteSpace(myRow.Field<string>("RequestDate").ToString()) == false)
                                                             select myRow.Field<string>("RequestDate")).ElementAt(0).ToString()));


                xEmail = xEmail.Replace("@@ReasonforRequest", ReasonForRequest.ToString().ToUpper());



            
            MailMess.Append(xEmail);
            return MailMess;

        }




       



        public void  sendRequestMail(StringBuilder MailMess, int PID, int DeptID)
        {

            //http://justgeeks.blogspot.com/2011/06/reliable-sending-of-email-fornetc-using.html

//            EXEC msdb.dbo.sp_send_dbmail @profile_name='LDCGEN', @body_format = 'HTML',
//@recipients='rabha.shoaib@ke.com.pk',
//@copy_recipients = 'rabha.shoaib@ke.com.pk',
//--@recipients='sheeban.ahmed@ke.com.pk',
//@subject= 'hello',
//@body='hello'




            string errorCode = string.Empty;

            DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID), Convert.ToInt32(DeptID));
            if (er.Rows.Count>0)
            {

                try
                {
                    MailMessage mail = new MailMessage();
                    mail.IsBodyHtml = true;
                    mail.From = new MailAddress("ess.helpdesk@ke.com.pk", "NCMManager");
                    //mail.From = new MailAddress("rabha.shoaib@ke.com.pk", "NCMManager");

                    //setting to recipeients
                    this.settingMailRecipientsName("RTO", mail, er);
                    this.settingMailRecipientsName("RCC", mail, er);

                    if ((mail.To.Count()>0) && (mail.CC.Count()>0))
                    {

                        errorCode = "1";

                        mail.Subject = "LDC - Request";
                        mail.Body = MailMess.ToString();
                        AlternateView htmlView = AlternateView.CreateAlternateViewFromString(MailMess.ToString(), null, "text/html");
                        mail.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(MailMess.ToString(), null, "text/html"));
                        SmtpClient smtp = new SmtpClient("172.16.100.147", 25);
                        //SmtpClient smtp = new SmtpClient("email.ke.com.pk", 25);

                        System.Net.NetworkCredential nc = new System.Net.NetworkCredential("ess.helpdesk@ke.com.pk", "Karachi@19840");


                        smtp.EnableSsl = false;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = nc;
                       smtp.Timeout = 5000;
                         smtp.SendAsync(mail,null);

                        
                    }
                    else
                    {
                        errorCode = "0";
                    }

                }
                catch (Exception ex)
                {
                    errorCode = "2";
                }

               
            }

            //return errorCode;
        }



        public void sendLDCGEN_CommunicationMail(StringBuilder MailMess, int PID, int DeptID)
        {
            DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID), Convert.ToInt32(DeptID));
            if (er.Rows.Count > 0)
            {
                  string TR = (string.Join(";", (from myRow in er.AsEnumerable()
                                                   where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                        ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                        (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                                                   select myRow.Field<string>("Names")).ToArray()));


                    string TCC = (string.Join(";", (from myRow in er.AsEnumerable()
                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                         (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                                                    select myRow.Field<string>("Names")).ToArray()));


                SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
                con.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand("sendLDC_GEN_DBMail", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@bodyMsg", MailMess.ToString());
                    cmd.Parameters.AddWithValue("@TO",TR );
                    cmd.Parameters.AddWithValue("@CC", TCC);
                    cmd.ExecuteNonQuery();

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


        }




        public void sendLDCGEN_CommunicationMailV2(StringBuilder MailMess, int PID, int DeptID,string RequestID)
        {
            //AFTER UAT SESSION IN ORDER TO INCLUDE REQUEST NUMBER IN DB MAIL..
            DataTable er = new DAL().getEmailRecipients(Convert.ToInt32(PID), Convert.ToInt32(DeptID));
            if (er.Rows.Count > 0)
            {
                string TR = (string.Join(";", (from myRow in er.AsEnumerable()
                                               where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                    ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                    (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                                               select myRow.Field<string>("Names")).ToArray()));


                string TCC = (string.Join(";", (from myRow in er.AsEnumerable()
                                                where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                     ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                     (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                                                select myRow.Field<string>("Names")).ToArray()));


                SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
                con.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand("sendLDC_GEN_DBMail_V2", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@bodyMsg", MailMess.ToString());
                    cmd.Parameters.AddWithValue("@TO", TR);
                    cmd.Parameters.AddWithValue("@CC", TCC);
                    cmd.Parameters.AddWithValue("@RequestID", RequestID);

                    cmd.ExecuteNonQuery();

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


        }




        public List<string> chkMailRecipientsName(string Key, DataTable er)
        {
            List<string> pnames = new List<string>();
             List<string> names = new List<string>();

            try
            {
                

               

                if (((from myRow in er.AsEnumerable()
                      where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                           ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                           (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                      select myRow.Field<string>("Names")).Count() > 0)

                    && ((from myRow in er.AsEnumerable()
                         where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                              ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                              (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                         select myRow.Field<string>("Names")).Count() > 0))
                {

                    string TR = (string.Join(",", (from myRow in er.AsEnumerable()
                                                   where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                        ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                        (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                                                   select myRow.Field<string>("Names")).ToArray()));


                    string TCC = (string.Join(",", (from myRow in er.AsEnumerable()
                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                         (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                                                    select myRow.Field<string>("Names")).ToArray()));



                    switch (Key)
                    {
                        case "RTO":
                            foreach (var name in (string.Join(",", (from myRow in er.AsEnumerable()
                                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                                         (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                                                                    select myRow.Field<string>("Names")).ToArray())).Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries))
                            {
                                names.Add(name.ToString());
                            }

                            if (names.Count() > 0)
                            {
                                names.Distinct().ToList().ForEach(n => pnames.Add(n.ToString()));
                            }
                            break;




                        case "RCC":
                            foreach (var name in (string.Join(",", (from myRow in er.AsEnumerable()
                                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                                         (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                                                                    select myRow.Field<string>("Names")).ToArray())).Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries))
                            {
                                names.Add(name.ToString());
                            }
                            if (names.Count() > 0)
                            {
                                names.Distinct().ToList().ForEach(n => pnames.Add(n.ToString()));
                            }
                            break;


                        default:
                            break;

                    }



                }

            }
            catch (Exception)
            {


            }





            return pnames;


        }



        private void settingMailRecipientsName(string Key, MailMessage mail,DataTable er)
        {
            try
            {

                List<string> names = new List<string>();

                if (((from myRow in er.AsEnumerable()
                      where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                           ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                           (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                      select myRow.Field<string>("Names")).Count() > 0)

                    && ((from myRow in er.AsEnumerable()
                         where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                              ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                              (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                         select myRow.Field<string>("Names")).Count() > 0))
                {

                    string TR = (string.Join(",", (from myRow in er.AsEnumerable()
                                                   where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                        ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                        (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                                                   select myRow.Field<string>("Names")).ToArray()));


                    string TCC = (string.Join(",", (from myRow in er.AsEnumerable()
                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                         (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                                                    select myRow.Field<string>("Names")).ToArray()));



                    switch (Key)
                    {
                        case "RTO":
                            foreach (var name in (string.Join(",", (from myRow in er.AsEnumerable()
                                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                                         (myRow.Field<string>("RTO").ToString().Equals("TO", StringComparison.CurrentCultureIgnoreCase)))
                                                                    select myRow.Field<string>("Names")).ToArray())).Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries))
                            {
                                names.Add(name.ToString());
                            }

                            if (names.Count() > 0)
                            {
                                names.Distinct().ToList().ForEach(n => mail.To.Add(n.ToString()));
                            }
                            break;




                        case "RCC":
                            foreach (var name in (string.Join(",", (from myRow in er.AsEnumerable()
                                                                    where (((String.IsNullOrEmpty(myRow.Field<string>("Names").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("Names").ToString()) == false)) &&
                                                                         ((String.IsNullOrEmpty(myRow.Field<string>("RTO").ToString()) == false && String.IsNullOrWhiteSpace(myRow.Field<string>("RTO").ToString()) == false)) &&
                                                                         (myRow.Field<string>("RTO").ToString().Equals("CC", StringComparison.CurrentCultureIgnoreCase)))
                                                                    select myRow.Field<string>("Names")).ToArray())).Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries))
                            {
                                names.Add(name.ToString());
                            }
                            if (names.Count() > 0)
                            {
                                names.Distinct().ToList().ForEach(n => mail.CC.Add(n.ToString()));
                            }
                            break;


                        default:
                            break;

                    }



                }

            }
            catch (Exception)
            {
                
               
            }


           





        }


        //private async Task sendEmail(string EmailTo, string MailMess, string MailSubject)
        //{
        //    //create the mail message
        //    //Dim mail As New MailMessage()

        //    MailMessage mail = new MailMessage();
        //    mail.IsBodyHtml = true;


        //    //' Fix images
        //    //'MailMess = Strings.Replace(MailMess, "Images/mainlogo/ncmanager1b.png", "http://ncmanagertest.kesc.com.pk/Images/mainlogo/ncmanager1b.png")




        //    mail.Body = MailMess;
        //    //set the addresses
        //    mail.From = new MailAddress("ess.helpdesk@ke.com.pk", "People Connect");

        //    mail.To.Add(EmailTo);

        //    //set the content
        //    mail.Subject = MailSubject;

        //    AlternateView htmlView = AlternateView.CreateAlternateViewFromString(MailMess, null, "text/html");

        //    //create the LinkedResource (embedded image)

        //    //int i = 0;
        //    //for (i = 0; i <= attachements.Count - 1; i++)
        //    //{
        //    //    string lr = attachements(i);
        //    //    LinkedResource logo = new LinkedResource(lr);
        //    //    logo.ContentId = "epic" + i.ToString.Trim;
        //    //    htmlView.LinkedResources.Add(logo);
        //    //}



        //    //add the views
        //    //mail.AlternateViews.Add(plainView)
        //    mail.AlternateViews.Add(htmlView);


        //    //send the message
        //    System.Net.Mail.SmtpClient s = new System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings["EmailIP"].ToString(), 25);
        //    //System.Net.NetworkCredential nc = new System.Net.NetworkCredential("myname", "mypass");
        //    System.Net.NetworkCredential nc = new System.Net.NetworkCredential("ess.helpdesk@ke.com.pk", "Karachi@19840");
        //    s.EnableSsl = Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["EnableSSL"]);
        //    s.UseDefaultCredentials = false;
        //    s.Credentials = nc;
        //    await s.SendMailAsync(mail);
        //    await Task.Delay(1000);
        //}



        public DataTable getTemplateView(int TVID)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("getTemplateView", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TID", Convert.ToInt32(TVID));
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



    }
}