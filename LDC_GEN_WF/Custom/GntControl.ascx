<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GntControl.ascx.cs" Inherits="LDC_GEN_WF.Custom.GntControl" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Custom/PendingRequestControl.ascx" TagPrefix="uc1" TagName="PendingRequestControl" %>
<%@ Register Src="~/Custom/RequestLog.ascx" TagPrefix="uc1" TagName="RequestLog" %>
<%@ Register Src="~/Custom/ApproveRequestControl.ascx" TagPrefix="uc1" TagName="ApproveRequestControl" %>
<%@ Register Src="~/Custom/GnTEditPRC.ascx" TagPrefix="uc1" TagName="GnTEditPRC" %>




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

    <dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="0" runat="server"
                     ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>
                    
                  <dx:TabPage Text="Pending Requests">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:PendingRequestControl runat="server" ID="PendingRequestControl" />
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



             <%--            <dx:TabPage Text="Edit Request">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:GnTEditPRC runat="server" id="GnTEditPRC" />
                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>--%>



                     <dx:TabPage Text="Activity Log">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:RequestLog runat="server" id="RequestLog" />
                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>




                 


                </TabPages>
            </dx:aspxpagecontrol>
