<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCControl.ascx.cs" Inherits="LDC_GEN_WF.Custom.LDCControl" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 295px;
        }

        .auto-style3 {
            width: 133px;
        }

        .auto-style4 {
            font-size: 20px;
            color: #0897C9;
        }
        .auto-style5 {
            font-size: 20px;
        }
        .auto-style6 {
            color: #000000;
        }
    </style>


    <div id="target-0" class="widget">
        <span class="auto-style4"><strong>LDC Request</strong>
        </span>
        
        <p>Initiate Request</p>

        <dx:ASPxGridView ID="LDCGrd" runat="server" AutoGenerateColumns="False" 
            DataSourceID="LDCRequest" KeyFieldName="ID" EnableTheming="True" Theme="Glass" Width="100%" OnRowInserting="LDCGrd_RowInserting">
            <Columns>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True"></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

           <%--     <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Name">              
                            <RegularExpression ErrorText="Invalid Parameter Input" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" />                        
                            <RequiredField IsRequired="True" />                 
                            </ValidationSettings>
                        </PropertiesTextEdit>

                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>--%>


                  <dx:GridViewDataComboBoxColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2"
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
                                        </dx:GridViewDataComboBoxColumn>





<%--                <dx:GridViewDataTextColumn Caption="Demand" FieldName="Demand" VisibleIndex="3">
                    <PropertiesTextEdit>
                        
<MaskSettings PromptChar=" " />  
<ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
<RegularExpression ErrorText="Invalid Parameter Input" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" />                        
<RequiredField IsRequired="True" />                 
</ValidationSettings>
                    
</PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>--%>





                <dx:GridViewDataTextColumn Caption="Demand Value" FieldName="DemandValue" VisibleIndex="4">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
                            <RegularExpression ErrorText="Invalid Parameter Input" 
                                ValidationExpression="^\d+$" />                        
                            <RequiredField IsRequired="True" />                 
                            </ValidationSettings>
                        </PropertiesTextEdit>

                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn Caption="Reason" FieldName="Reason" VisibleIndex="4">
                     <PropertiesTextEdit>
                        <MaskSettings PromptChar=" " />  
                            <ValidationSettings ErrorDisplayMode="Text" ErrorText="Invalid Parameter Input">              
                            <RegularExpression ErrorText="Invalid Parameter Input" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" />                        
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
      <p>Please provide mandatory information as required</p>
    </div>




        <asp:SqlDataSource ID="LDCRequest" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select a.ID RequestID,b.Plant,c.Demand,a.DemandValue,a.Reason 
from  LDCRequest a 
inner join Plants b on a.PlantID = b.ID
inner join Demand c on a.DemandID = c.ID" InsertCommand="insert into LDCRequest (PlantID,DemandID,DemandValue,Reason,InitRequest,isLDCAuthorize,isGNTAuthorize) values (@PID,@DID,@DIV,@Reason,1,0,1)">
            <InsertParameters>
                <asp:Parameter Name="PID" />
                <asp:Parameter Name="DID" />
                <asp:Parameter Name="DIV" />
                <asp:Parameter Name="Reason" />
            </InsertParameters>
    </asp:SqlDataSource>



        <asp:SqlDataSource ID="plantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select ID,Plant from Plants">
    </asp:SqlDataSource>


     <asp:SqlDataSource ID="DemandDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select ID,Demand from Demand">
    </asp:SqlDataSource>



  <%--  <asp:SqlDataSource ID="sdsEmployeeData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ncerp_devConnectionString %>" DeleteCommand="DELETE FROM [hcm_EmployeeInformation] WHERE [ID] = @original_ID AND (([CDateTime] = @original_CDateTime) OR ([CDateTime] IS NULL AND @original_CDateTime IS NULL)) AND (([EmpNo] = @original_EmpNo) OR ([EmpNo] IS NULL AND @original_EmpNo IS NULL)) AND (([EmpName] = @original_EmpName) OR ([EmpName] IS NULL AND @original_EmpName IS NULL)) AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([EmailID] = @original_EmailID) OR ([EmailID] IS NULL AND @original_EmailID IS NULL)) AND (([OfficeLocation] = @original_OfficeLocation) OR ([OfficeLocation] IS NULL AND @original_OfficeLocation IS NULL)) AND (([NTN] = @original_NTN) OR ([NTN] IS NULL AND @original_NTN IS NULL)) AND (([Grade] = @original_Grade) OR ([Grade] IS NULL AND @original_Grade IS NULL)) AND (([CostCenter] = @original_CostCenter) OR ([CostCenter] IS NULL AND @original_CostCenter IS NULL)) AND (([DateOfJoining] = @original_DateOfJoining) OR ([DateOfJoining] IS NULL AND @original_DateOfJoining IS NULL)) AND (([EOBI] = @original_EOBI) OR ([EOBI] IS NULL AND @original_EOBI IS NULL))" InsertCommand="INSERT INTO [hcm_EmployeeInformation] ([CDateTime], [EmpNo], [EmpName], [Designation], [Department], [EmailID], [OfficeLocation], [NTN], [Grade], [CostCenter], [DateOfJoining], [EOBI],[OfficialInfoCity],[CLUSTER]) VALUES (@CDateTime, @EmpNo, @EmpName, @Designation, @Department, @EmailID, @OfficeLocation, @NTN, @Grade, @CostCenter, @DateOfJoining, @EOBI,@CLUSTER)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [hcm_EmployeeInformation] WHERE (ID = @ID)" UpdateCommand="UPDATE [hcm_EmployeeInformation] 
SET [OfficeLocation] = @OfficeLocation,
DepartmentGroup = @DepartmentGroup,
Department=@Department,
Region = @Region,
CLUSTER=@CLUSTER,
SubDepartment = @SubDepartment,
Designation=@Designation,
DesignationLevel = @DesignationLevel,
 OfficeLocationModified= '1'
WHERE [ID] = @original_ID">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int64" />
                <asp:Parameter Name="original_CDateTime" Type="DateTime" />
                <asp:Parameter Name="original_EmpNo" Type="String" />
                <asp:Parameter Name="original_EmpName" Type="String" />
                <asp:Parameter Name="original_Designation" Type="String" />
                <asp:Parameter Name="original_Department" Type="String" />
                <asp:Parameter Name="original_EmailID" Type="String" />
                <asp:Parameter Name="original_OfficeLocation" Type="String" />
                <asp:Parameter Name="original_NTN" Type="String" />
                <asp:Parameter Name="original_Grade" Type="String" />
                <asp:Parameter Name="original_CostCenter" Type="String" />
                <asp:Parameter DbType="Date" Name="original_DateOfJoining" />
                <asp:Parameter Name="original_EOBI" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CDateTime" Type="DateTime" />
                <asp:Parameter Name="EmpNo" Type="String" />
                <asp:Parameter Name="EmpName" Type="String" />
                <asp:Parameter Name="Designation" Type="String" />
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="EmailID" Type="String" />
                <asp:Parameter Name="OfficeLocation" Type="String" />
                <asp:Parameter Name="NTN" Type="String" />
                <asp:Parameter Name="Grade" Type="String" />
                <asp:Parameter Name="CostCenter" Type="String" />
                <asp:Parameter DbType="Date" Name="DateOfJoining" />
                <asp:Parameter Name="EOBI" Type="String" />
                <asp:Parameter Name="CLUSTER" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="ID" SessionField="EID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="OfficeLocation" Type="String" />
                <asp:Parameter Name="DepartmentGroup" />
                <asp:Parameter Name="Department" />
                <asp:Parameter Name="Region" />
                <asp:Parameter Name="Cluster" />
                <asp:Parameter Name="SubDepartment" />
                <asp:Parameter Name="Designation" />
                <asp:Parameter Name="DesignationLevel" />
                <asp:Parameter Name="original_ID" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>--%>


