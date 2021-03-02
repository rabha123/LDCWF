<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestControl.ascx.cs" Inherits="LDC_GEN_WF.Custom.RequestControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<%@ Register Src="~/Custom/RequestLog.ascx" TagPrefix="uc1" TagName="RequestLog" %>
<%@ Register Src="~/Custom/ApproveRequestControl.ascx" TagPrefix="uc1" TagName="ApproveRequestControl" %>



<%--<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="../css/font-awesome.css" rel="stylesheet">

<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/pages/signin.css" rel="stylesheet" type="text/css">--%>




<%--    <link href="../cssv2/bootstrap.css" rel="stylesheet" />--%>


<style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}

     .form_textC { border:1px solid #f7941e;
	border-radius:10px;
	height: 30px;
	width: 230px;transition: width 0.4s ease-in-out;}

     /*input[type=text]:focus {
  width: 100%;
}*/

     .form_combo {
         width: 100%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
     }
</style>

  <script type="text/javascript" src="../SAjs/js/jquery-1.11.1.js"></script>
    <link href="../css/bootstrap.css" />

    <script type="text/javascript" src="../SAjs/js/bootstrap.js"></script>
    <script type="text/javascript" src="../SAjs/sweetalert2.all.min.js"></script>



<%--  <script type="text/javascript" src="SAjs/js/jquery-1.11.1.js"></script>
    <link href="css/bootstrap.css" />

    <script type="text/javascript" src="SAjs/js/bootstrap.js"></script>
    <script type="text/javascript" src="SAjs/sweetalert2.all.min.js"></script>--%>

<%-- <script type = "text/javascript">





     function showProgress() {

              function erroralert(msg) {

                  Swal({
                      type: 'error',
                      title: '',
                      text: msg
                      //footer: '<a href>Why do I have this issue?</a>'
                  });

              }


              function erroralertWarning(msg) {

                  Swal({
                      type: 'warning',
                      title: '',
                      text: msg
                      //footer: '<a href>Why do I have this issue?</a>'
                  });

              }


              function sucessalert(msg) {

                                      Swal(
                               '',
                               msg,
                               'success'
                             )

              }



         swal({
             title: 'Please wait',
             imageUrl: "Images/slack_load.gif",
             timer: 20000,
             allowOutsideClick: false,
             showConfirmButton: false,
             iconColor: '#ffffff',
             onOpen: function () {
                 //swal.showLoading()
                 swal.hideLoading();
             }
         }).then(function (result) {
             if (result.dismiss === swal.DismissReason.timer) {
             }
         });


     }



  

 </script>--%>

<%--<script type="text/javascript">
     $(document).ready(function ()
     {
         alert("hello");
     });
</script>--%>

<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="1" runat="server"
                     ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>
                    <dx:TabPage Text="Generate Request">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                  
                                 <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" Theme="Moderno" Modal="true" ClientInstanceName="lp" runat="server" Text="">
                                     <Image Url="~/Images/slack_load.gif">
                                     </Image>
                                 </dx:ASPxLoadingPanel>
        <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
            <ClientSideEvents ControlsInitialized="function(s,e){lp.Hide();}" />
        </dx:ASPxGlobalEvents>
           <script type="text/javascript">
               lp.Show();
               window.onbeforeunload = dobeforeunload;
               function dobeforeunload() {
                   lp.Show();
               }
    </script>

   <table>
    <tr>
        <td><h4 style="color : #f90">Plant Name</h4></td>
    </tr>
    <tr>
        <td><dx:ASPxComboBox ID="comboPalnts" runat="server"  
            DataSourceID="plantDataSource"    TextField="Plant" ValueField="ID" ></dx:ASPxComboBox></td>
    </tr>
    


    <tr>
        <td><h4 style="color : #f90">Demand</h4></td>
    </tr>
    <tr>
        <td><dx:ASPxComboBox ID="comboDemand" runat="server" 
            DataSourceID="DemandDataSource"   TextField="Demand" ValueField="ID"></dx:ASPxComboBox></td>
    </tr>


      <tr>
        <td><h4 style="color : #f90">Demand Value</h4></td>
    </tr>
    <tr>
          <td ><dx:ASPxTextBox ID="txtDemandValue" runat="server"  CssClass ="form_textC"
                onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></dx:ASPxTextBox> </td>
    </tr>

  
     <tr>
        <td><h4 style="color : #f90">Reason</h4></td>
    </tr>
    <tr>
        <td><asp:TextBox ID="txtReason"  runat="server" 
                TextMode="MultiLine" Width="484px"></asp:TextBox></td>
    </tr>


    <tr>
        <td>  <dx:ASPxButton ID="btnGenerateLDCRequest" runat="server"  CssClass="form_buttonC"
            Text="Generate Request" 
            OnClick="btnGenerateLDCRequest_Click" ></dx:ASPxButton></td>
    </tr>
  
</table>

      <asp:SqlDataSource ID="plantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
          select 0 ID,'' Plant
    union all 
          select ID,Plant from Plants where isActive=1">
    </asp:SqlDataSource>


     <asp:SqlDataSource ID="DemandDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
         select 0 ID,'' Demand
    union all 
         select ID,Demand from Demand">
    </asp:SqlDataSource>


                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>

             

                  <dx:TabPage Text="Pending Requests">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                             <%--    <uc1:PendingRequestControl runat="server" ID="PendingRequestControl" />--%>

                                 <dx:ASPxGridView runat="server" ID="PendingRequestsGrd" 
                                            AutoGenerateColumns="False" DataSourceID="PendingDataSource" 
                                             KeyFieldName="RequestID" EnableTheming="True" Theme="Glass" Width="100%"  >
                                           <Columns>

                                               <dx:GridViewCommandColumn ShowInCustomizationForm="True"  ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>

                                             <%--  OnHtmlRowPrepared="PendingRequestsGrd_HtmlRowPrepared"--%>
                                                 <dx:GridViewDataTextColumn Caption="Request ID" FieldName="RequestID" VisibleIndex="1" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Plant Name" FieldName="Plant" VisibleIndex="2" Visible="true"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Demand" FieldName="Demand" VisibleIndex="3" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Demand Value" FieldName="DemandValue" VisibleIndex="4" Visible="false"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Reason" FieldName="Reason" VisibleIndex="5" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Status" FieldName="RequestStatus" VisibleIndex="6" ></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator" FieldName="Initiator" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Approver Comments" FieldName="ApproverComments" VisibleIndex="8" Visible ="false"></dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Request Initiator ID" FieldName="InitiatorID" VisibleIndex="7" Visible="false"></dx:GridViewDataTextColumn>


                                                   <dx:GridViewDataTextColumn Caption="Change Request" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                                             <DataItemTemplate>
                                                                                                              <dx:ASPxButton ID="btnRequestDetails" CssClass="form_buttonC"  runat="server"
                                                                                                                   Text=" Edit Request " OnClick="btnRequestDetails_Click" ></dx:ASPxButton>
                                                                                                           
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                 </dx:GridViewDataTextColumn>

                                           </Columns>
                                            <SettingsBehavior AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" />
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


                                     <asp:SqlDataSource ID="PendingDataSource" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                                                                    SelectCommand ="GetPendingLDCRequestV2" SelectCommandType="StoredProcedure">

                                           <SelectParameters>
                                                                 <asp:SessionParameter Name="Initiator" SessionField="thisDeptID" type="Int64" DefaultValue="" />
                                                                 <asp:SessionParameter DefaultValue="" Name="UserName" SessionField="thisUserName" Type="String" />
                                          </SelectParameters>
                                        </asp:SqlDataSource>

                              



 <%--EDITING panel--%>
<dx:ASPxPopupControl ID="modalEditingPanel" Modal="true"   runat="server" 
                                                CloseAction="CloseButton" LoadContentViaCallback="OnFirstShow"
                          PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
                             Height="100px" HeaderText="Change Demand Request" ClientInstanceName="ClientPopupControl" Width="500px" >

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
                        <td><h4 style="color : #f90">Change Demand</h4></td>
                    </tr>


                    <tr><td><dx:ASPxTextBox ID="txtChangeDemandValue" runat="server"  CssClass ="form_textC"
                                        onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></dx:ASPxTextBox> </td></tr>


                         <tr>
                        <td><h4 style="color : #f90">Reason</h4></td>
                    </tr>

                    <tr>
                        <td><asp:TextBox ID="txtReasonEdit"  runat="server" TextMode="MultiLine" Width="531px"></asp:TextBox></td>
                    </tr>



               <%--      <tr>
                        <td><h4 style="color : #f90">Previous Reading</h4></td>
                    </tr>

                        
                    <tr><td><dx:ASPxTextBox ID="txtPreviousReading" runat="server"  CssClass ="form_textC"
                                    onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></dx:ASPxTextBox> </td></tr>--%>


            


                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnApproverAction" runat="server" Text="Edit" CssClass="form_buttonC" OnClick="btnApproverAction_Click" ></dx:ASPxButton>
                        </td>
                    </tr>
                    

                </table>



          </dx:PopupControlContentControl>
    </ContentCollection>

</dx:ASPxPopupControl>

                             </dx:ContentControl>
                                
                                 </ContentCollection>
                        </dx:TabPage>


                       <dx:TabPage Text="Approve Requests">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:ApproveRequestControl runat="server" id="ApproveRequestControl" />
                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>




                     <dx:TabPage Text="Activity Log">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:RequestLog runat="server" id="RequestLog" />
                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>


                </TabPages>
            </dx:aspxpagecontrol>
