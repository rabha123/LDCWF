using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace LDC_GEN_WF.SecurityManager
{


                //Data Source=ncm-uat-srv;Initial Catalog=LDC_GEN_DB;User ID=sa;Password=Kesc@123;Connect Timeout=20000; pooling='true'; Max Pool Size=200
            
            //string ecr = SecurityManager.SecurityManager.encrypt("Data Source=ncm-uat-srv;Initial Catalog=LDC_GEN_DB;User ID=sa;Password=Kesc@123;Connect Timeout=20000; pooling='true'; Max Pool Size=200", SecurityManager.SecurityManager.getPasswordKeyPRD());

            //string dcr = SecurityManager.SecurityManager.decrypt(
            //(SecurityManager.SecurityManager.encrypt("Data Source=ncm-uat-srv;Initial Catalog=LDC_GEN_DB;User ID=sa;Password=Kesc@123;Connect Timeout=20000; pooling='true'; Max Pool Size=200", SecurityManager.SecurityManager.getPasswordKeyPRD())),SecurityManager.SecurityManager.getPasswordKeyPRD());



    //https://stackoverflow.com/questions/22251603/read-custom-encrypted-connection-string-from-web-config
    //https://www.aspforums.net/Threads/196969/Pass-encrypt-querystring-value-to-sqlDataSource-SelectCommand-in-ASPNet/

    //It turned out to be a very simple solution of updating the SqlDataSource.ConnectionString in the SqlDataSource's Init event, as follows:
    //protected void SqlDataSource_Init(object sender, EventArgs e)
    //{
    //    string connectionString = Encryption.Decrypt(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, "XXXXXX");
    //    SqlDataSource.ConnectionString = connectionString;
    //}


        public static class SecurityManager
        {

            //public static bool IsNumeric(string value)
            //{
            //    return value.All(char.IsNumber);
            //}

            public static string encrypt(string pwd, string key)
            {
                byte[] b = Encoding.Unicode.GetBytes(pwd);
                try
                {
                    using (Aes a = Aes.Create())
                    {
                        Rfc2898DeriveBytes rfcSec = new Rfc2898DeriveBytes(key, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                        a.Key = rfcSec.GetBytes(32);
                        a.IV = rfcSec.GetBytes(16);
                        using (MemoryStream ms = new MemoryStream())
                        {
                            using (CryptoStream cs = new CryptoStream(ms, a.CreateEncryptor(), CryptoStreamMode.Write))
                            {
                                cs.Write(b, 0, b.Length);
                                cs.Close();
                            }
                            pwd = Convert.ToBase64String(ms.ToArray());
                        }
                    }
                    return pwd;
                }
                catch (Exception x)
                {

                    throw x;
                }
            }

            public static string decrypt(string encryptPwd, string key)
            {
                byte[] b = Convert.FromBase64String(encryptPwd.Trim());
                try
                {
                    using (Aes a = Aes.Create())
                    {
                        Rfc2898DeriveBytes rfcSec = new Rfc2898DeriveBytes(key, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                        a.Key = rfcSec.GetBytes(32);
                        a.IV = rfcSec.GetBytes(16);

                        using (MemoryStream ms = new MemoryStream())
                        {
                            using (CryptoStream cs = new CryptoStream(ms, a.CreateDecryptor(), CryptoStreamMode.Write))
                            {
                                cs.Write(b, 0, b.Length);
                                cs.Close();
                            }
                            encryptPwd = Encoding.Unicode.GetString(ms.ToArray());
                        }
                    }
                    return encryptPwd;
                }
                catch (Exception x)
                {
                    throw x;
                }
            }



            public static bool IsNumeric(object Expression)
            {
                double retNum;

                bool isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
                return isNum;
            }


            public static bool IsNumeric(this string s)
            {
                foreach (char c in s)
                {
                    if (!char.IsDigit(c) && c != '.')
                    {
                        return false;
                    }
                }

                return true;
            }







            public static string getPasswordKey()
            {
                return "KE2019";

            }

            public static string getPasswordKeyPRD()
            {
                return "KE2019";

            }

        }


    
}