<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingRequestControl.ascx.cs" Inherits="LDC_GEN_WF.Custom.PendingRequestControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
 <%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>



<style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}
</style>

    <script type="text/javascript">
        //This function will close the pop window
        function ClosePopWindow() {
            var paentWin = window.parent;
            window.parent.PopWindow.Hide();
        }

    </script>
                               
<table>

        <tr>
        <td>
        </td>
    </tr>

    <tr>
        <td>
          <%--  <span class="auto-style4"><strong>Pending Requests</strong></span>--%>
            <h3 style="color : #f90">Pending Requests</h3>
        </td>
    </tr>

    <tr>
        <td>
             <dx:ASPxGridView runat="server" ID="PendingRequestsGrd" 
                                            AutoGenerateColumns="False" DataSourceID="PendingDataSource" 
                                             KeyFieldName="RequestID" EnableTheming="True" Theme="Glass" Width="100%" OnHtmlRowPrepared="PendingRequestsGrd_HtmlRowPrepared">
                                           <Columns>
                                                <%-- <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                 </dx:GridViewCommandColumn>--%>
                                                 <dx:GridViewCommandColumn ShowInCustomizationForm="True"  ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>

                                               
                                                 <dx:GridViewDataTextColumn Caption="Request ID" FieldName="RequestID" VisibleIndex="1" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2" Visible="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Demand" FieldName="Demand" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Demand Value" FieldName="DemandValue" VisibleIndex="4" Visible="false"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Reason" FieldName="Reason" VisibleIndex="5" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Status" FieldName="RequestStatus" VisibleIndex="6" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator" FieldName="Initiator" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Approver Comments" FieldName="ApproverComments" VisibleIndex="8" Visible ="false"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator ID" FieldName="InitiatorID" VisibleIndex="7" Visible="false"></dx:GridViewDataTextColumn>



                                                <dx:GridViewDataTextColumn Caption="Request Status" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                                             <DataItemTemplate>
                                                                                                              <dx:ASPxButton ID="btnRequestDetails" CssClass="form_buttonC"
                                                                                                                  runat="server" Text=" Acknowledge " OnClick="btnRequestDetails_Click"></dx:ASPxButton>
                                                                                                           <%-- <dx:ASPxHyperLink ID="btnRequestDetails" runat="server" Text="Details"></dx:ASPxHyperLink>--%>
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                 </dx:GridViewDataTextColumn>

                                           </Columns>
                                           <SettingsBehavior AllowSelectSingleRowOnly="True" />
                                           <Settings ShowFilterRow="True" />
                                           <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />


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


    <tr>
        <td>
        </td>
    </tr>



 
</table>


                                

                                      


<%--approval panel--%>
<dx:ASPxPopupControl ID="modalApprovalPopup" Modal="true"   runat="server" 
                                                CloseAction="CloseButton" LoadContentViaCallback="OnFirstShow"
                          PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
                             Height="100px" HeaderText="Request Status" ClientInstanceName="ClientPopupControl" Width="500px" >

    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table>
                    <tr>
                        <td>
                               <dx:ASPxGridView runat="server" ID="PendingRequestsApprovalGrd" 
                                            AutoGenerateColumns="False" DataSourceID="PendingSelectedDataSource" 
                                             KeyFieldName="RequestID" EnableTheming="True" Theme="Glass" Width="100%">
                                           <Columns>
                                                 <dx:GridViewDataTextColumn Caption="Request ID" FieldName="RequestID" VisibleIndex="1" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Demand" FieldName="Demand" VisibleIndex="3" ></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Demand Value" FieldName="DemandValue" VisibleIndex="4" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Reason" FieldName="Reason" VisibleIndex="5" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Status" FieldName="RequestStatus" VisibleIndex="6" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator" FieldName="Initiator" VisibleIndex="7"></dx:GridViewDataTextColumn>

                                                  <dx:GridViewDataTextColumn Caption="Request Initiator ID" FieldName="InitiatorID" VisibleIndex="8" Visible="false"></dx:GridViewDataTextColumn>

                                           </Columns>

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


                                     <asp:SqlDataSource ID="PendingSelectedDataSource" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                                                                    SelectCommand ="GetSelectedPendingLDCRequest" SelectCommandType="StoredProcedure">
                                           <SelectParameters>
                                                                 <asp:SessionParameter Name="Initiator" SessionField="thisDeptID" type="Int64" />
                                                                <asp:SessionParameter Name="RequestID" SessionField="thisRequestID" type="Int64" />
                                          </SelectParameters>
                                        </asp:SqlDataSource>

                        </td>


                    </tr>
                              
                    
                    
                    <tr>
                        <td><h4 style="color : #f90">Request Status</h4></td>
                    </tr>  
                    
                    
                     <tr>
                       <td><dx:ASPxComboBox ID="comboRequestStatus" runat="server"   
                           DataSourceID="RequestStatusDataSource"  TextField="Status" ValueField="ID" AutoPostBack="true"></dx:ASPxComboBox></td>
                    </tr>  


                     <tr>
                        <td><h4 style="color : #f90">Actual Reading</h4></td>
                    </tr>


                    <tr><td><dx:ASPxTextBox ID="txtActualReading" runat="server"  CssClass ="form_textC"
                                        onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></dx:ASPxTextBox> </td></tr>


                     <tr>
                        <td><h4 style="color : #f90">Previous Reading</h4></td>
                    </tr>

                        
                    <tr><td><dx:ASPxTextBox ID="txtPreviousReading" runat="server"  CssClass ="form_textC"
                                    onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></dx:ASPxTextBox> </td></tr>


                    <tr>
                        <td><h4 style="color : #f90">Comments</h4></td>
                    </tr>

                    <tr>
                        <td><asp:TextBox ID="txtApproverComments"  runat="server" TextMode="MultiLine" Width="531px"></asp:TextBox></td>
                    </tr>


                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnApproverAction" runat="server" Text="Acknowledge" CssClass="form_buttonC" OnClick="btnApproverAction_Click"></dx:ASPxButton>
                        </td>
                    </tr>
                    

                </table>

                 <asp:SqlDataSource ID="RequestStatusDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select ID,Status from RequestStatus
where ID In (1)">
    </asp:SqlDataSource>

          </dx:PopupControlContentControl>
    </ContentCollection>

</dx:ASPxPopupControl>



                                      <asp:SqlDataSource ID="PendingDataSource" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                                                                    SelectCommand ="GetPendingLDCRequestV2" SelectCommandType="StoredProcedure">
                                       <%--   <SelectParameters>
                                              <asp:Parameter DefaultValue="1" Name="Initiator" Type="Int64" />
                                          </SelectParameters>--%>

                                           <SelectParameters>
                                                                 <asp:SessionParameter Name="Initiator" SessionField="thisDeptID" type="Int64" />
                                                                 <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />
                                          </SelectParameters>

                                        </asp:SqlDataSource>



 



