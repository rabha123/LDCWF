<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminControl.ascx.cs" Inherits="LDC_GEN_WF.Custom.AdminControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Custom/RequestLog.ascx" TagPrefix="uc1" TagName="RequestLog" %>




<style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}
    
    .form_textC { border:1px solid #f7941e;
	border-radius:10px;
	height: 30px;
	width: 230px;}

         .form_combo {
         width: 100%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
     }



    .auto-style1 {
        height: 34px;
    }



</style>


 <dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="5" runat="server"
                     ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>  
                    <dx:TabPage Text="Create User">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                 
                                 <p style="color:red">Please provide mandatory information as required</p>





    <table>
        

     <tr>
        <td><h5 style="color : #f90">User Name*</h5></td>
    </tr>
    <tr>
          <td ><dx:ASPxTextBox ID="txtUserName" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>
    </tr>

      <tr>
        <td><h5 style="color : #f90">Department*</h5></td>
    </tr>

        <tr>
         <%--   <td><dx:ASPxComboBox ID="comboDepartment" runat="server" 
                                DataSourceID="DepartmentDataSource"   TextField="Name" ValueField="ID"></dx:ASPxComboBox></td>--%>

               <td class="auto-style1"><asp:DropDownList ID="comboDepartment" runat="server" DataSourceID="DepartmentDataSource" 
                   AutoPostBack="true" 
                                                                            DataTextField="Name" DataValueField="ID" ></asp:DropDownList></td>



        </tr>



           <tr>
        <td><h5 style="color : #f90">Required Role*</h5></td>
        </tr>


           <tr>
           <%-- <td>--%>
               <%-- <dx:ASPxComboBox ID="comboRole" runat="server" 
                                DataSourceID="RoleDataSource"   TextField="RoleName" ValueField="ID"></dx:ASPxComboBox></td>--%>

               <td><asp:DropDownList ID="DeptInRolecomboRole" runat="server" DataSourceID="DeptInRoleDataSource" AutoPostBack="true" 
                                                                            DataTextField="RoleName" DataValueField="ID" ></asp:DropDownList></td>

        </tr>


        <%if ((Session["thisDeptID"] != null) && (Session["thisDeptID"].ToString().Equals("2", StringComparison.CurrentCultureIgnoreCase))
                                && ((DeptInRolecomboRole.SelectedItem.Text.ToString().Equals("GnT User", StringComparison.CurrentCultureIgnoreCase))
                                || (DeptInRolecomboRole.SelectedItem.Text.ToString().Equals("GnT Report User", StringComparison.CurrentCultureIgnoreCase))))
          { %>
        <tr>
            <td><h5 style="color : #f90">Required Plant*</h5></td>
        </tr>


          <tr>
               <td><asp:DropDownList ID="comboPlantGeneration" runat="server" 
                   DataSourceID="PlantGenerationDataSource"  DataTextField="Plant" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
        </tr>


        <%}%>





        <tr>
            <td></td>
        </tr>


    <tr>
        <td>  <dx:ASPxButton ID="btnCreateUser" runat="server"  CssClass="form_buttonC"  Text="Create User" OnClick="btnCreateUser_Click"  ></dx:ASPxButton></td>
    </tr>

        </table>





  
    

                  <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' Name
    union all
                 SELECT ID,Name FROM Department WHERE ID = @DeptID">
                      <SelectParameters>
                          <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                      </SelectParameters>
    </asp:SqlDataSource>



                     <asp:SqlDataSource ID="DeptInRoleDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
                         select 0 as ID , '' RoleName
UNION ALL 
                         SELECT a.ID,a.RoleName FROM ROLES a
 inner join DeptInRoles b on a.ID = b.RoleID
 WHERE b.DepID = @ID and b.isActive=1 and a.isActive=1 and b.DepID=@DeptID">

                          <SelectParameters>
                                <asp:SessionParameter Name="DeptID" SessionField="thisDeptID"  />
                                 <asp:ControlParameter ControlID="comboDepartment" DefaultValue="0" Name="ID" PropertyName="SelectedValue" />
                    </SelectParameters>

    </asp:SqlDataSource>


<%--                                                      <asp:SqlDataSource ID="DeptInRoleGenerationDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
                         select 0 as ID , '' RoleName
UNION ALL 
                         SELECT a.ID,a.RoleName FROM ROLES a
 inner join DeptInRoles b on a.ID = b.RoleID
 WHERE b.DepID = @ID and b.isActive=1 and a.isActive=1 and b.DepID=@DeptID">

                          <SelectParameters>
                                <asp:SessionParameter Name="DeptID" SessionField="thisDeptID"  />
                                 <asp:ControlParameter ControlID="comboDepartmentGeneration" DefaultValue="0" Name="ID" PropertyName="SelectedValue" />
                    </SelectParameters>

    </asp:SqlDataSource>--%>





                                  <asp:SqlDataSource ID="PlantGenerationDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
        SelectCommand ="select 0 as ID , '' as Plant
UNION ALL 
select ID,Plant from Plants
where DeptID=@DeptID and  isActive In (
	case @ID when 2 then 1 else case @ID WHEN 7 THEN 1 ELSE -1 END end
)">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                                          <asp:ControlParameter ControlID="DeptInRolecomboRole" DefaultValue="-1" Name="ID" PropertyName="SelectedValue" />
                                     </SelectParameters>

    </asp:SqlDataSource>



                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>

             


                                <dx:TabPage Text="Change User Role">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                       <p style="color:red">Please provide mandatory information as required</p>

                                 <table>
                                     <tr>
                                         <td>

                                             
                          <dx:ASPxGridView ID="changeUserRoleUserManagementGrd" runat="server" 
                                                                             AutoGenerateColumns="False" DataSourceID="changeUserRoleUserManagement" KeyFieldName="ID" OnCustomErrorText="changeUserRoleUserManagementGrd_CustomErrorText" >
                                <Columns>

                           <%-- <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True"></dx:GridViewCommandColumn>--%>
                                    <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Change Role">
                                    </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>

                                                         
                                                                   <%-- <dx:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" VisibleIndex="1" Visible="false"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>--%>
                                                                    <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Visible="true" ReadOnly="true">
                                                                      <%--  <EditFormSettings Visible="False" />--%>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="RoleName" VisibleIndex="3" Visible="true" ReadOnly="true"  >
                                                                      <%--  <EditFormSettings Visible="False" />--%>
                                                                    </dx:GridViewDataTextColumn>
                                         


                                    <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4" Visible="true" ReadOnly="true"  Caption="User Status">
                                                                      <%--  <EditFormSettings Visible="False" />--%>
                                                                    </dx:GridViewDataTextColumn>



                                                      <dx:GridViewDataComboBoxColumn
                                                             Caption="Role Name Required" FieldName="RoleID" VisibleIndex="5" ShowInCustomizationForm="True">
                                            <PropertiesComboBox DataSourceID="changeUserRoleDeptInRole" 
                                                TextField="RoleName" ValueField="ID">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>




                                        </Columns>

                                                                             <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <settingsdatasecurity allowdelete="False" AllowInsert="False" AllowEdit="true"/>
                            


                                                                             </dx:ASPxGridView>

                                         </td>
                                     </tr>
                                 </table>



 <asp:SqlDataSource ID="changeUserRoleUserManagement" runat="server"  ConflictDetection="CompareAllValues"
     OldValuesParameterFormatString="original_{0}"
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select a.ID,a.UserName,b.RoleName,b.ID AS RoleID,c.Name DeptName ,
  case d.isActive  when 0 then 'In Active' else 'Active' end Status 
from LDC_GEN_Users a 
inner join Roles b on a.RoleID = b.ID
inner join Department c on a.DeptID = c.ID
inner join MemberShip d on  a.ID = d.UserID
WHERE b.isActive = 1 AND c.ID=@DeptID" UpdateCommand="if exists(select * from Roles where ID=@RoleID)
begin
update LDC_GEN_Users
set RoleID=@RoleID where ID = @original_ID
end
else
begin
THROW 51000, 'Role', 1;
end">

                                                                             
                                                       <SelectParameters>
                                                           <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                                                       </SelectParameters>

                                                       <UpdateParameters>
                                                           <asp:Parameter Name="RoleID" />
                                                           <asp:Parameter Name="original_ID" Type="Int32"/>
                                                       </UpdateParameters>

</asp:SqlDataSource>


                                                   <asp:SqlDataSource ID="changeUserRoleDeptInRole" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
                         select 0 as ID , '' RoleName
UNION ALL 
                         SELECT a.ID,a.RoleName FROM ROLES a
 inner join DeptInRoles b on a.ID = b.RoleID
 WHERE  b.isActive=1 and a.isActive=1 and b.DepID=@DeptID">

                          <SelectParameters>
                                <asp:SessionParameter Name="DeptID" SessionField="thisDeptID"  />
                    </SelectParameters>

    </asp:SqlDataSource>

                                 </dx:ContentControl>
                                 </ContentCollection>
                     </dx:TabPage>

                  <dx:TabPage Text="User Activation">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                    <p style="color:red">Please provide mandatory information as required</p>

                                    <table>
                                        <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="UserManagementGrd" runat="server" AutoGenerateColumns="False" DataSourceID="UserManagmentDataSource" KeyFieldName="UserID" OnHtmlRowPrepared="UserManagementGrd_HtmlRowPrepared" >
                                <Columns>

                                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>

                                                                 <dx:GridViewDataTextColumn Caption="Activate User" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>

                                                                                                 <asp:Button ID="btnActivate" runat="server"   CssClass="form_buttonC"  Text="Active"  AutoPostBack="true" OnClick="btnActivate_Click" />

                                                                                               <%--  <dx:ASPxButton ID="btnActivate" runat="server"  Text="Active" OnClick ="btnActivate_Click" AutoPostBack="true"></dx:ASPxButton> --%>

                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                    </dx:GridViewDataTextColumn>


                                                                    <dx:GridViewDataTextColumn Caption="Deactivate User" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>
                                                                                                 
                                                                                                 <asp:Button ID="btnDeactivate" runat="server"   CssClass="form_buttonC"  Text="InActive" AutoPostBack="true" OnClick="btnDeactivate_Click"/>
                                                                                                 <%--<dx:ASPxButton ID="btnDeactivate" runat="server"  Text="InActive" OnClick ="btnDeactivate_Click" ></dx:ASPxButton> --%>


                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" VisibleIndex="1" Visible="false"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="RoleName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="DeptName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Status" Caption="User Status" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             </dx:ASPxGridView>
                                            </td>
                                        </tr>



                                        
   


                                    </table>

                                                   <asp:SqlDataSource ID="UserManagmentDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select a.ID UserID,a.UserName,b.RoleName,c.Name DeptName ,
                                                         case d.isActive  when 0 then 'In Active' else 'Active' end Status 
from LDC_GEN_Users a 
inner join Roles b on a.RoleID = b.ID
inner join Department c on a.DeptID = c.ID
inner join MemberShip d on  a.ID = d.UserID
WHERE b.isActive = 1 AND c.ID=@DeptID">
                                                       <SelectParameters>
                                                           <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                                                       </SelectParameters>
    </asp:SqlDataSource>

                             </dx:ContentControl>
                                          
                                 </ContentCollection>
                        </dx:TabPage>




                              <dx:TabPage Text="Plants Request">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">

                                 
        <%if ((Session["thisDeptID"] != null) && (Session["thisDeptID"].ToString().Equals("2", StringComparison.CurrentCultureIgnoreCase)) 
                                && (Session["thisRoleName"].ToString().Equals("GnT Admin",StringComparison.CurrentCultureIgnoreCase))){ %>

                                              <p style="color:red">Please provide mandatory information as required</p>
                                    <table>
                                        <tr>
                                            <td>
                                                     <dx:ASPxGridView ID="PlantGrd" runat="server" AutoGenerateColumns="False" 
            DataSourceID="NewPlantDataSource" KeyFieldName="ID" EnableTheming="True" Theme="Glass" Width="100%" OnCustomErrorText="PlantGrd_CustomErrorText" OnHtmlRowPrepared="PlantGrd_HtmlRowPrepared" >
            <Columns>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="true" ></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

    
           <%--       <dx:GridViewDataComboBoxColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2"
                                            ShowInCustomizationForm="True" >
                                            <PropertiesComboBox DataSourceID="plantDataSource" 
                                                TextField="Plant" ValueField="ID">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>


                    <dx:GridViewDataComboBoxColumn Caption="Demand" FieldName="Demand" VisibleIndex="3"
                                            ShowInCustomizationForm="True" >
                                            <PropertiesComboBox DataSourceID="DemandDataSource" 
                                                TextField="Demand" ValueField="ID">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>--%>

                <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2" Width="500" >
                    <PropertiesTextEdit>
                        
<MaskSettings PromptChar=" " />  
<ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
<RegularExpression ErrorText="Invalid Parameter Input" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" />                        
<RequiredField IsRequired="True" />                 
</ValidationSettings>
                    
</PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>




                <dx:GridViewDataTextColumn Caption="Active / Inactive" FieldName="isActive" ReadOnly="True"  VisibleIndex="3" Width="500" Visible="false">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>


                 <%--          <dx:GridViewDataComboBoxColumn Caption="Change Status" FieldName="isActive" VisibleIndex="4" Width="500"
                                            ShowInCustomizationForm="True" >
                                                <PropertiesComboBox>
                                                        <Items> 
                                                            <dx:ListEditItem  Selected="true" Text="Select" Value="-1"/>
                                                            <dx:ListEditItem   Text="Active" Value="1"/>
                                                            <dx:ListEditItem   Text="InActive" Value="0"/>
                                                        </Items>
                                                </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>--%>





            </Columns>
            <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <settingsdatasecurity allowdelete="true" />
        </dx:ASPxGridView>





                                            </td>
                                        </tr>

                                        <tr><td></td></tr>
                                         <tr><td></td></tr>

                                    </table>


                                 <asp:SqlDataSource ID="NewPlantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"  OldValuesParameterFormatString="original_{0}"
        SelectCommand ="select ID,Plant,isActive from Plants  where DeptID = @DeptID" 
InsertCommand="if  exists(select * from Plants where Plant=@Plant)
begin		
THROW 51000, 'Plant', 1;
end
else
begin
    
if exists(select * from Department where 2=@DeptID)
begin
insert into Plants (Plant,isActive) values (@Plant,1)
end
ELSE
BEGIN
THROW 51000, 'Department', 1;
END

end" ConflictDetection="CompareAllValues" DeleteCommand="update Plants set isActive=0 where ID =  @original_ID">
                                     <DeleteParameters>
                                         <asp:Parameter Name="original_ID" />
                                     </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Plant" />
               <%-- <asp:Parameter Name="DeptID" />--%>
                <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
            </InsertParameters>


                                     <SelectParameters>
                                         <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                                     </SelectParameters>

    </asp:SqlDataSource>


                                

                                 <table>
                                     <tr><td><p style="color:red">Change user's plant resource</p></td></tr>

                                     <tr>
                                         <td>
                                                  <dx:ASPxGridView ID="UserPlantManagementDataGrd" runat="server" 
                                                        AutoGenerateColumns="False" DataSourceID="UserPlantResourceDataSource" KeyFieldName="ID"  >
                                <Columns>

                                    <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Change"></dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1"><EditFormSettings Visible="False" /></dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Visible="true" ReadOnly="True" Caption="User Name">
                                                                      <%--  <EditFormSettings Visible="False" />--%>
                                      </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn FieldName="RoleName" VisibleIndex="3" Visible="true" ReadOnly="True"  Caption="Role Name">
                                                                      <%--  <EditFormSettings Visible="False" />--%>
                                       </dx:GridViewDataTextColumn>
                                         
                                    <dx:GridViewDataTextColumn FieldName="DeptName" VisibleIndex="4" Visible="true" ReadOnly="True"  Caption="Dept Name">
                                                                      <%--  <EditFormSettings Visible="False" />--%>
                                                                    </dx:GridViewDataTextColumn>



                                                      <dx:GridViewDataComboBoxColumn
                                                             Caption="Plant Required" FieldName="PlantID" VisibleIndex="5" ShowInCustomizationForm="True">
                                            <PropertiesComboBox DataSourceID="PlantDataSource" 
                                                TextField="Plant" ValueField="ID">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        </Columns>

             <SettingsEditing Mode="EditForm"></SettingsEditing>
            <settingsdatasecurity allowdelete="False" AllowInsert="False" AllowEdit="true"/>           
</dx:ASPxGridView>
                                         </td>
                                     </tr>
                                 </table>

                                  <asp:SqlDataSource ID="UserPlantResourceDataSource"  runat="server" 
                                      ConflictDetection="CompareAllValues"
     OldValuesParameterFormatString="original_{0}"

                                     ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                                     SelectCommand ="select e.ID,a.UserName,b.RoleName,c.Name DeptName,
isnull(f.Plant,'NA') as Plant,isnull(f.ID,-1) as PlantID
from LDC_GEN_Users a 
inner join Roles b on a.RoleID = b.ID and b.ID In (2,7)
inner join Department c on a.DeptID = c.ID and c.ID=2
inner join MemberShip d on  a.ID = d.UserID 
left join PlantResource e on a.ID = e.UserID
left join Plants f on e.PlantID=f.ID  and f.isActive=1
where 
b.isActive=1 and d.isActive=1 " UpdateCommand="update PlantResource
set PlantID=@PlantID where ID=@original_ID">
                                      <UpdateParameters>
                                          <asp:Parameter Name="PlantID" />
                                          <asp:Parameter Name="original_ID" Type="Int32"/>
                                      </UpdateParameters>
                                 </asp:SqlDataSource>


                                 <asp:SqlDataSource ID ="PlantDataSource" runat ="server"
                                     ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"  
                                     SelectCommand ="select -1 ID,'' Plant
union all
select ID,Plant from Plants where DeptID=2 and isActive=1" ></asp:SqlDataSource>

                               
                              <% } else { %>

                                   <p style="color:red">Please contact with Generation Dept, for plant configuration</p>

                                 <%} %>



                       


                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>




                     <dx:TabPage Text="Email Configuration">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">



 <%if ((Session["thisDeptID"] != null) && (Session["thisDeptID"].ToString().Equals("2", StringComparison.CurrentCultureIgnoreCase)) 
                                && (Session["thisRoleName"].ToString().Equals("GnT Admin",StringComparison.CurrentCultureIgnoreCase))){ %>

                                 <p style="color:red">GnT Email Configuration</p>
                                 <p style="color:red">Please provide mandatory information as required</p>

                                 <table>
                                     

                                      <tr>

          
                                          <td>
                                                     <dx:ASPxGridView ID="EmailConfigurationGrd" runat="server" AutoGenerateColumns="False" 
            DataSourceID="EmailRecipientDataSource" KeyFieldName="ID" EnableTheming="True" Theme="Glass" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True"></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

   


                  <dx:GridViewDataComboBoxColumn Caption="Plant Name" FieldName="PID" VisibleIndex="2"
                                            ShowInCustomizationForm="True" >
                                            <PropertiesComboBox DataSourceID="plantDataSourceEmailConfiguration" 

                                                TextField="Plant" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="true" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            
                                        </dx:GridViewDataComboBoxColumn>




                <dx:GridViewDataTextColumn Caption="Recipient(TO)" FieldName="RTO" VisibleIndex="3">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
                            <RegularExpression ErrorText="Invalid Email Input" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />                        
                            <RequiredField IsRequired="True" />                 
                            </ValidationSettings>
                        </PropertiesTextEdit>

                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn Caption="CC" FieldName="RCC" VisibleIndex="4">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
                            <RegularExpression ErrorText="Invalid Email Input" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />                        
                            <RequiredField IsRequired="True" />                 
                            </ValidationSettings>
                        </PropertiesTextEdit>

                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>


               <%--  <dx:GridViewDataTextColumn Caption="Time" FieldName="Time" VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>--%>


            </Columns>
            <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <settingsdatasecurity allowdelete="False" />
        </dx:ASPxGridView>

                                          </td>


         




                                      </tr>


                                    <%-- <tr>
                                      
                                                <td><asp:DropDownList ID="comboPlantEmail" runat="server" DataSourceID="plantDataSourceEmailConfiguration" AutoPostBack="true"
                                                                            TextField="Plant" ValueField="ID" ></asp:DropDownList></td>
                                        
                                     </tr>--%>
                                


                                     <tr>
                                         <td></td>
                                     </tr>

                                     <tr>
                                         <td></td>
                                     </tr>

                                     
                                 </table>

<%} else { %>

                                 <p style="color:red">LDC Email Configuration</p>
                                 <p style="color:red">Please provide mandatory information as required</p>

                                    <table>
                                        <tr>
                                            <td>
                                                 <dx:ASPxGridView ID="EmailConfigurationGrdLDC" runat="server" AutoGenerateColumns="False" 
            DataSourceID="EmailRecipientDataSourceLDC" KeyFieldName="ID" EnableTheming="True" Theme="Glass" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True"></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

   
                <dx:GridViewDataTextColumn Caption="Recipient(TO)" FieldName="RTO" VisibleIndex="3">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
                            <RegularExpression ErrorText="Invalid Email Input" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />                        
                            <RequiredField IsRequired="True" />                 
                            </ValidationSettings>
                        </PropertiesTextEdit>

                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn Caption="CC" FieldName="RCC" VisibleIndex="4">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
                            <RegularExpression ErrorText="Invalid Email Input" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />                        
                            <RequiredField IsRequired="True" />                 
                            </ValidationSettings>
                        </PropertiesTextEdit>

                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>


               <%--  <dx:GridViewDataTextColumn Caption="Time" FieldName="Time" VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>--%>


            </Columns>
            <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <settingsdatasecurity allowdelete="False" />
        </dx:ASPxGridView>
                                            </td>
                                        </tr>

                                        <tr>
                                         <td></td>
                                     </tr>

                                    </table>

<%} %>


 <asp:SqlDataSource ID="EmailRecipientDataSource" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" ConflictDetection="CompareAllValues" 
          OldValuesParameterFormatString="original_{0}"
        SelectCommand ="SELECT [ID], [PID], [RTO], [RCC] FROM [LDCEmailRecipents]  where DeptID =@DeptID"
          InsertCommand ="insert into LDCEmailRecipents (PID,RTO,RCC,DeptID) values (@PID,@RTO,@RCC,@DeptID)" 
     UpdateCommand="update LDCEmailRecipents 
set  RTO = @RTO , RCC = @RCC , PID = @PID, DeptID = @DeptID  where ID = @original_ID ">
          <InsertParameters>
              <asp:Parameter Name="PID" />
          <%--    <asp:SessionParameter Name="PID" SessionField="thisusername" Type="String" />--%>
             <%--  <asp:ControlParameter ControlID="comboDepartment" DefaultValue="0" Name="PID" PropertyName="SelectedValue" />--%>
              <asp:Parameter Name="RTO" Type="String"/>
              <asp:Parameter Name="RCC" Type="String"/>
               <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
          </InsertParameters>
          <SelectParameters>
              <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="RTO" />
              <asp:Parameter Name="RCC" />
                <asp:Parameter Name="PID" />
              <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
              <asp:Parameter Name="original_ID" />
          </UpdateParameters>
    </asp:SqlDataSource>


<asp:SqlDataSource ID="plantDataSourceEmailConfiguration" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select ID,Plant from Plants where isActive=1">
    </asp:SqlDataSource>




                                  <asp:SqlDataSource ID="EmailRecipientDataSourceLDC" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" ConflictDetection="CompareAllValues" 
          OldValuesParameterFormatString="original_{0}"
        SelectCommand ="SELECT [ID], [PID], [RTO], [RCC] FROM [LDCEmailRecipents]  where DeptID =@DeptID"
          InsertCommand ="insert into LDCEmailRecipents (PID,RTO,RCC,DeptID) values (-1,@RTO,@RCC,@DeptID)" UpdateCommand="update LDCEmailRecipents 
set  RTO = @RTO , RCC = @RCC , DeptID = @DeptID  where ID = @original_ID ">
          <InsertParameters>
          <%--    <asp:SessionParameter Name="PID" SessionField="thisusername" Type="String" />--%>
             <%--  <asp:ControlParameter ControlID="comboDepartment" DefaultValue="0" Name="PID" PropertyName="SelectedValue" />--%>
              <asp:Parameter Name="RTO" Type="String"/>
              <asp:Parameter Name="RCC" Type="String"/>
               <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
          </InsertParameters>

          <SelectParameters>
              <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
          </SelectParameters>

          <UpdateParameters>
              <asp:Parameter Name="RTO" />
              <asp:Parameter Name="RCC" />
              <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
              <asp:Parameter Name="original_ID" />
          </UpdateParameters>
    </asp:SqlDataSource>


            

                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>




                  <dx:TabPage Text="Report">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:RequestLog runat="server" ID="RequestLog" />
                             </dx:ContentControl>

                        </ContentCollection>
                      </dx:TabPage>


                </TabPages>
            </dx:aspxpagecontrol>
