using LDC_GEN_WF.DbManager;
using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace LDC_GEN_WF.Custom
{
    public partial class AdminControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }




        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            //LDC USER CREATION..
            if (((string.IsNullOrEmpty(txtUserName.Text.ToString())==false ) && (string.IsNullOrWhiteSpace(txtUserName.Text.ToString()))==false))
           {
                //^[a-zA-Z0-9]+$
                if ((Regex.IsMatch(txtUserName.Text.ToString(), @"^[a-zA-Z.]+$", RegexOptions.IgnoreCase)) || (Regex.IsMatch(txtUserName.Text.ToString(), @"^[a-zA-Z\\s]+$", RegexOptions.IgnoreCase)))
                {
                    if (((comboDepartment.SelectedIndex > 0) && (DeptInRolecomboRole.SelectedIndex > 0)))
                    {
                        try
                        {

                            DataTable dtm = new DataTable();
                            switch (Convert.ToInt32(comboDepartment.SelectedItem.Value.ToString()))
                            {
                                                            
                                //LDC USER
                                case 1:
                                dtm = new UserManagement().createLDCUser((txtUserName.Text.ToString()), Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString()),
                                    Convert.ToInt32(comboDepartment.SelectedItem.Value.ToString()), Session["thisUserName"].ToString());
                                if (dtm.Rows.Count > 0)
                                {
                                    if (dtm.Select("ErrorCode=1").Count() > 0)
                                    {
                                        string msg = dtm.Select("ErrorCode=1").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                        UserManagementGrd.DataBind();
                                    }
                                    else if (dtm.Select("ErrorCode=0").Count() > 0)
                                    {
                                        string msg = dtm.Select("ErrorCode=0").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                        UserManagementGrd.DataBind();
                                    }
                                }
                                else
                                {
                                    //user not created
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('User not created')", true);
                                    UserManagementGrd.DataBind();
                                }

                                    break;

                                //GnT User 
                                case 2:

                                    //(GnT Admin | GnT Admin Report User) having visibility of all plants..
                                    if ((((Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString()))==5) ||  ((Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString())) == 9)))
                                    {
                                        
                                        //dtm = new UserManagement().createLDCUser((txtUserName.Text.ToString()), Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString()),
                                        //                Convert.ToInt32(comboDepartment.SelectedItem.Value.ToString()), Session["thisUserName"].ToString());

                                        dtm = new UserManagement().createGnTUser((txtUserName.Text.ToString()), Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString()),
                                                                        Convert.ToInt32(comboDepartment.SelectedItem.Value.ToString()),-1, Session["thisUserName"].ToString());

                                        if (dtm.Rows.Count > 0)
                                        {
                                            if (dtm.Select("ErrorCode=1").Count() > 0)
                                            {
                                                string msg = dtm.Select("ErrorCode=1").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                                UserManagementGrd.DataBind();
                                            }
                                            else if (dtm.Select("ErrorCode=0").Count() > 0)
                                            {
                                                string msg = dtm.Select("ErrorCode=0").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                                UserManagementGrd.DataBind();
                                            }
                                        }
                                        else
                                        {
                                            //user not created
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('User not created')", true);
                                            UserManagementGrd.DataBind();
                                        }

                                        
                                    }
                                    else if ((((Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString())) == 2) || ((Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString())) == 7)))
                                    {
                                        //(GnT User | GnT Report) User having visibility of selected plant resource..
                                        if ((comboPlantGeneration.SelectedIndex > 0))
                                        {
                                            if ((comboPlantGeneration.SelectedIndex > 0))
                                            {
                                                    if (Convert.ToInt32(comboPlantGeneration.SelectedItem.Value.ToString())>0)
                                                    {

                                                        //(GnT Admin | GnT Admin Report User) having visibility of specific plants..
                                                        dtm = new UserManagement().createGnTUser((txtUserName.Text.ToString()), Convert.ToInt32(DeptInRolecomboRole.SelectedItem.Value.ToString()),
                                                                        Convert.ToInt32(comboDepartment.SelectedItem.Value.ToString()), Convert.ToInt32(comboPlantGeneration.SelectedItem.Value.ToString()), Session["thisUserName"].ToString());
                                                        if (dtm.Rows.Count > 0)
                                                        {
                                                            if (dtm.Select("ErrorCode=1").Count() > 0)
                                                            {
                                                                string msg = dtm.Select("ErrorCode=1").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                                                UserManagementGrd.DataBind();
                                                            }
                                                            else if (dtm.Select("ErrorCode=0").Count() > 0)
                                                            {
                                                                string msg = dtm.Select("ErrorCode=0").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                                                UserManagementGrd.DataBind();
                                                            }
                                                        }
                                                        else
                                                        {
                                                            //user not created
                                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('User not created')", true);
                                                            UserManagementGrd.DataBind();
                                                        }

                                                    }
                                                    else
                                                    {
                                                        //provide mandatory parameters as required
                                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
                                                    }

                                            }
                                        }
                                        else
                                        {
                                            //provide mandatory parameters as required
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
                                        }



                                    }
                                    break;





                                default:
                                    break;
                            }



                     

                        }
                        catch (Exception)
                        {

                        }
                    }
                    else
                    {
                        //provide mandatory parameters as required
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
                    }

                    
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must be valid User Name')", true);
                }


 
            }
            else
            {
                //provide mandatory parameters as required
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
            }

            try
            {

                changeUserRoleUserManagementGrd.DataBind();
                UserPlantManagementDataGrd.DataBind();

            }
            catch (Exception)
            {
                
            
            }

        


        }





        protected void btnActivate_Click(object sender, EventArgs e)
        {
            List<object> sRow = new DAL().getSelectedValues(UserManagementGrd);
            if (sRow.Count()>0)
            {
                 if ((sRow.ElementAt(0) is Array))
                 {
                     string reqUserID = (sRow.ElementAt(0) as Array).GetValue(2).ToString();
                     if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(2).ToString())))
                     {
                        int r = new UserManagement().ActivateDeactivateUser(Convert.ToInt32(reqUserID.ToString()), 1);
                        if (r>0)
                        {
                              ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Activated')", true);
                                UserManagementGrd.DataBind();
                                changeUserRoleUserManagementGrd.DataBind();

                        }

                     }

                 }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
            }

        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            List<object> sRow = new DAL().getSelectedValues(UserManagementGrd);
            if (sRow.Count() > 0)
            {
                if ((sRow.ElementAt(0) is Array))
                {
                    string reqUserID = (sRow.ElementAt(0) as Array).GetValue(2).ToString();
                    if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(2).ToString())))
                    {
                        int r = new UserManagement().ActivateDeactivateUser(Convert.ToInt32(reqUserID.ToString()), 0);
                        if (r > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('In Activated')", true);
                            UserManagementGrd.DataBind();
                            changeUserRoleUserManagementGrd.DataBind();


                        }

                    }

                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
            }


        }


        protected void PlantGrd_CustomErrorText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomErrorTextEventArgs e)
        {
            //Department
                    try
                    {
                        string i = e.Exception.Message;
                        if ((i.Count() > 0) && (e.Exception.Message.Equals("Plant", StringComparison.CurrentCultureIgnoreCase)))
                        {
                            e.ErrorText = "Duplicate Plant Name, Please Enter Again.";
                        }
                        else if ((i.Count() > 0) && (e.Exception.Message.Equals("Department", StringComparison.CurrentCultureIgnoreCase)))
                        {
                            e.ErrorText = "Department , Authorization Restricted";
                        }

                    }
                    catch (Exception)
                    {

                    }

        }

        protected void changeUserRoleUserManagementGrd_CustomErrorText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomErrorTextEventArgs e)
        {
            try
            {
                string i = e.Exception.Message;
                if (i.Count() > 0)
                {
                    e.ErrorText = "Requested Role not found, Please Enter Again.";
                }
            }
            catch (Exception)
            {

            }
        }

        protected void UserManagementGrd_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {
                return;
            }
            else
            {
                if (e.GetValue("Status").ToString().Equals("In Active", StringComparison.CurrentCultureIgnoreCase))
                {
                    try
                    {
                        e.Row.BackColor = System.Drawing.Color.LightPink;
                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {
               
                }

            }
        }

        protected void PlantGrd_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {
                return;
            }
            else
            {
                if (e.GetValue("isActive").ToString().Equals("0", StringComparison.CurrentCultureIgnoreCase))
                {
                    try
                    {
                        e.Row.BackColor = System.Drawing.Color.LightPink;
                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {

                }

            }

        }

 

   

    




    }
}