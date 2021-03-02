<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApproveRequestControl.ascx.cs" Inherits="LDC_GEN_WF.Custom.ApproveRequestControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<table>
       <tr>
        <td>
            <%--<span class="auto-style4"><strong>Approve Requests</strong></span>--%>
            <h3 style="color : #f90">Approve Requests</h3>
        </td>
    </tr>


    <tr>
        <td>
             <dx:ASPxGridView runat="server" ID="ApproveRequestsGrd" 
                                            AutoGenerateColumns="False" DataSourceID="ApproveDataSource" 
                                             KeyFieldName="RequestID" EnableTheming="True" Theme="Glass" Width="100%" >
                                           <Columns>
                                             <%--  OnHtmlRowPrepared="ApproveRequestsGrd_HtmlRowPrepared" --%>

                                                <%-- <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                 </dx:GridViewCommandColumn>--%>
                                         <%--        <dx:GridViewCommandColumn ShowInCustomizationForm="True"  ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>--%>

                                               
                                                 <dx:GridViewDataTextColumn Caption="Request ID" FieldName="RequestID" VisibleIndex="1" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2" Visible="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Demand" FieldName="Demand" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Demand Value" FieldName="DemandValue" VisibleIndex="4" Visible="false"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Reason" FieldName="Reason" VisibleIndex="5" Visible="false"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Status" FieldName="RequestStatus" VisibleIndex="6" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator" FieldName="Initiator" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Approver Comments" FieldName="ApproverComments" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator ID" FieldName="InitiatorID" VisibleIndex="7" Visible="false"></dx:GridViewDataTextColumn>

                                           </Columns>
                                           <SettingsBehavior AllowSelectSingleRowOnly="True" />
                                           <Settings ShowFilterRow="True" />
                                      


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


<%--  <asp:SqlDataSource ID="ApproveDataSource" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                                                                    SelectCommand ="GetApproveLDCRequests" SelectCommandType="StoredProcedure">

                                        </asp:SqlDataSource>--%>



 <asp:SqlDataSource ID="ApproveDataSource" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                                                                    SelectCommand ="GetApproveLDCRequestsV2" SelectCommandType="StoredProcedure">

     <SelectParameters>
                                         <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                                         <asp:SessionParameter Name="UserName" SessionField="thisUserName" />
                                     </SelectParameters>


                                        </asp:SqlDataSource>


