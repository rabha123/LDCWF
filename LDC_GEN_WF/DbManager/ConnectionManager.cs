using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LDC_GEN_WF.DbManager
{
    public class ConnectionManager
    {
        public string getSecureConnectionString()
        {
                 ///ConnectionManager manager for git
            string secureConString =
                  (ConfigurationManager.ConnectionStrings["UATSecurencerpConnectionString"].ConnectionString.ToString()
                  .Replace("@conServerName", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conServerName"].ToString(), SecurityManager.SecurityManager.getPasswordKey()).Trim())
                  .Replace("@conDataSource", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conDataSource"].ToString(), SecurityManager.SecurityManager.getPasswordKey()).Trim())
                  .Replace("@conName", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conName"].ToString(), SecurityManager.SecurityManager.getPasswordKey()).Trim())
                  .Replace("@conPassword", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conPassword"].ToString(), SecurityManager.SecurityManager.getPasswordKey()).Trim())).Trim().ToString();


            string secureConStringPRD =
                (ConfigurationManager.ConnectionStrings["PRDSecurencerpConnectionString"].ConnectionString.ToString()
                .Replace("@conServerNamePRD", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conServerNamePRD"].ToString(), SecurityManager.SecurityManager.getPasswordKeyPRD()).Trim())
                .Replace("@conDataSourcePRD", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conDataSourcePRD"].ToString(), SecurityManager.SecurityManager.getPasswordKeyPRD()).Trim())
                .Replace("@conNamePRD", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conNamePRD"].ToString(), SecurityManager.SecurityManager.getPasswordKeyPRD()).Trim())
                .Replace("@conPasswordPRD", SecurityManager.SecurityManager.decrypt(ConfigurationManager.AppSettings["conPasswordPRD"].ToString(), SecurityManager.SecurityManager.getPasswordKeyPRD()).Trim())).Trim().ToString();


            return secureConStringPRD;


        }
        public string getInSecureConnectionString()
        {
            string ConString = (ConfigurationManager.ConnectionStrings["ncerpDevConnectionString"].ConnectionString.ToString());

            return ConString;
        }

    }
}