<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestLog.ascx.cs" Inherits="LDC_GEN_WF.Custom.RequestLog" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
 <%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


<style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}
     
</style>



<asp:UpdatePanel ID="UpdatePanel1" runat="server" OnUnload="UpdatePanel1_Unload" >
    <ContentTemplate>
<table>



    <tr>
        <td>
            <dx:ASPxButton ID="btnExport" runat="server" Text="Export Report" CssClass="form_buttonC"
                ClientInstanceName="btnExport"  OnClick="btnExport_Click" ></dx:ASPxButton>
        </td>
    </tr>
    

     <tr>
        <td>
        </td>
    </tr>



    <tr>
        <td>
             <dx:ASPxGridView runat="server" ID="RequestLogGrd" 
                                            AutoGenerateColumns="False" DataSourceID="RequestActivityLogsDataSource" 
                                             KeyFieldName="RequestID" EnableTheming="True" Theme="Glass" Width="100%" >

                                           <Columns>

                                               <dx:GridViewDataTextColumn Caption="Request Msg" FieldName="WFMsg" VisibleIndex="1"></dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Request Date" FieldName="RequestDate" VisibleIndex="2" ></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Request Time" FieldName="RequestTime" VisibleIndex="3" ></dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn Caption="Request ID" FieldName="RequestID" VisibleIndex="4" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request From" FieldName="Initiator" VisibleIndex="5" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request To" FieldName="RequestTo" VisibleIndex="6" ></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Request Nature" FieldName="Demand" VisibleIndex="7" ></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Request Quantity" FieldName="DemandValue" VisibleIndex="8" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="9" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Reason for request" FieldName="Reason" VisibleIndex="10" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Status" FieldName="RequestStatus" VisibleIndex="11" Visible="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Requestor Name" FieldName="RequestorName" VisibleIndex="12" Visible="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Approver Name" FieldName="ApproverName" VisibleIndex="13" Visible="true"></dx:GridViewDataTextColumn>

                                               <dx:GridViewDataTextColumn Caption="Approver Comments" FieldName="ApproverComments" VisibleIndex="14"></dx:GridViewDataTextColumn>


                                               <dx:GridViewDataTextColumn Caption="Actual Reading" FieldName="ActualReading" VisibleIndex="15"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Previous Reading" FieldName="PreviousReading" VisibleIndex="16"></dx:GridViewDataTextColumn>




                                               <dx:GridViewDataTextColumn Caption="TAT (Days)" FieldName="TADDays" VisibleIndex="17"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="TAT (hrs)" FieldName="TADHours" VisibleIndex="18"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="TAT (min)" FieldName="TADMinutes" VisibleIndex="19"></dx:GridViewDataTextColumn>
                                           </Columns>

                                            
          
                                        


                                           <Settings ShowFilterBar="Visible" ShowFilterRow="True"  />
                 

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




<dx:ASPxGridViewExporter 
    ID="ASPxGridViewExporter1" runat="server" GridViewID="RequestLogGrd"></dx:ASPxGridViewExporter>

    </ContentTemplate>
      <Triggers>
                    <asp:PostBackTrigger ControlID="btnExport" />
       </Triggers>

    </asp:UpdatePanel>


<%--ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"--%>

                                     <asp:SqlDataSource ID="RequestActivityLogsDataSource" runat="server" 
                                                        
                                                                    SelectCommand ="GetRequestActivityLogsV2" SelectCommandType="StoredProcedure" OnInit="RequestActivityLogsDataSource_Init">
                                        
                                             <SelectParameters>
                                                                 <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" type="Int64" />
                                                                 <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />
                                          </SelectParameters>

                                        </asp:SqlDataSource>



