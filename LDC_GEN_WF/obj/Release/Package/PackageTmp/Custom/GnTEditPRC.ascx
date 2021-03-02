<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GnTEditPRC.ascx.cs" Inherits="LDC_GEN_WF.Custom.GnTEditPRC" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


<table>
    <tr>
        <td>
            

             <dx:ASPxGridView runat="server" ID="EditPRCgRID" 
                                            AutoGenerateColumns="False" DataSourceID="EditPendingDataSource" 
                                             KeyFieldName="ID" EnableTheming="True" Theme="Glass" Width="100%">
                                           <Columns>

                                               <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0"> </dx:GridViewCommandColumn>

                                                 <dx:GridViewDataTextColumn Caption="Request ID" FieldName="ID" VisibleIndex="1"  ReadOnly="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>


                                                 <dx:GridViewDataComboBoxColumn FieldName="Demand" ShowInCustomizationForm="True" Caption="Demand" Visible="true" VisibleIndex="3">
                                            <PropertiesComboBox DataSourceID="dsDemand" TextField="Demand" ValueField="ID"></PropertiesComboBox>
                                            <EditFormSettings Visible="True"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>


                                                <dx:GridViewDataTextColumn Caption="Demand Value" FieldName="DemandValue" VisibleIndex="4" Visible="true" ShowInCustomizationForm="true"></dx:GridViewDataTextColumn>

                                               <dx:GridViewDataTextColumn Caption="Reason" FieldName="Reason" VisibleIndex="5" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Status" FieldName="RequestStatus" VisibleIndex="6" ReadOnly="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator" FieldName="Initiator" VisibleIndex="7" ReadOnly="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Approver Comments" FieldName="ApproverComments" VisibleIndex="8" Visible ="false" ReadOnly="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator ID" FieldName="InitiatorID" VisibleIndex="9" Visible="false" ReadOnly="true"></dx:GridViewDataTextColumn>

                                               
                                          <dx:GridViewDataTextColumn Caption="Actual Reading" FieldName="ActualReading" VisibleIndex="10" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Previous Reading" FieldName="PreviousReading" VisibleIndex="11" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>



                                           </Columns>
                                         <%--  <SettingsBehavior AllowSelectSingleRowOnly="True" />
                                           <Settings ShowFilterRow="True" />
                                           <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />--%>

                 
<Settings ShowFilterRow="True" ShowFilterBar="Visible"></Settings>
<SettingsDataSecurity AllowInsert="False" />


                                             <Styles>
                                                            <Table Font-Size="Small">
                                                            </Table>
                                                            <Header BackColor="#C5EFFE" ForeColor="Black">
                                                            </Header>
                                                            <RowHotTrack BackColor="#81CAEF" Font-Names="Arial" Font-Size="Small" ForeColor="Black">
                                                            </RowHotTrack>
                                                            <PreviewRow Font-Size="Small">
                                                            </PreviewRow>
                                                            <AlternatingRow BackColor="#F8F8F8">
                                                            </AlternatingRow>
                                                            <FocusedRow Font-Size="Small">
                                                            </FocusedRow>
                                                        </Styles>
                                                        <StylesFilterControl>
                                                            <Value BackColor="#D9ECFF" Font-Bold="True" ForeColor="Red">
                                                            </Value>
                                                        </StylesFilterControl>

                                       </dx:ASPxGridView>

        </td>
    </tr>
</table>



   <asp:SqlDataSource ID="EditPendingDataSource" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
       OldValuesParameterFormatString="original_{0}" 
                                                                    SelectCommand ="select a.ID,b.Plant,c.ID Demand,a.DemandValue,a.Reason ,d.Status RequestStatus,
	ISNULL(a.ApproverComments,'') ApproverComments,
	(select top 1 Name from Department where ID = 1) Initiator,
	a.InitRequest InitiatorID , a.ActualReading,a.PreviousReading
				from  LDCRequest a inner join Plants b on a.PlantID = b.ID
				inner join Demand c on a.DemandID = c.ID 
				inner join RequestStatus d on a.RequestStatus = d.ID
				where a.Processor=1 and 
				b.ID In (SELECT PlantID FROM PlantResource WHERE UserID in (
						select ID from LDC_GEN_Users where UserName = @UserName)) 
				and d.ID In (2,3) and b.isActive=1 order by a.CDateTime"  
                UpdateCommand="update LDCRequest set 
                DemandValue=@DemandValue,DemandID=@Demand,ActualReading=@ActualReading,PreviousReading=@PreviousReading,Reason=@Reason,WFMsg=(dbo.getRequestStaus(@DeptID,5)) WHERE (ID =  @original_ID);
       
       
       insert into LDCRequestLog(RequestID,PlantID,DemandID,DemandValue,
	RequestStatus,Processor,WFMsg,InitRequest,AuthorizeDept,ActualReading,PreviousReading,Reason,RequestorName)  
				select top 1 RequestID,PlantID,@Demand,DemandValue,5,1,(dbo.getRequestStaus(@DeptID,5)),
					(select top 1 InitRequest from LDCRequest where ID = @original_ID),
					(select top 1 AuthorizeDept from LDCRequest where ID = @original_ID),@ActualReading,@PreviousReading,@Reason,@UserName
					 from LDCRequestLog where RequestID= @original_ID order by ID desc">

                                           <SelectParameters>
                                                                 <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />

                                          </SelectParameters>

        <UpdateParameters>
              <asp:Parameter Name="original_ID" Type="Int64" />
            <asp:Parameter Name="DemandValue" Type="Int32"/>
            <asp:Parameter Name="Demand" />
            <asp:Parameter Name="ActualReading" Type="Int32"/>
            <asp:Parameter Name="PreviousReading"  Type="Int32"/>
            <asp:Parameter Name="Reason" />

            <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" type="Int64" />
            <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />


        </UpdateParameters>

                                        </asp:SqlDataSource>



<asp:SqlDataSource ID="dsDemand" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" SelectCommand ="select ID,Demand from Demand">

</asp:SqlDataSource>
