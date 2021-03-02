<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LDC.aspx.cs" Inherits="LDC_GEN_WF.View.LDC.LDC" Async="true"%>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Custom/RequestControl.ascx" TagPrefix="uc1" TagName="RequestControl" %>
<%@ Register Src="~/Custom/PendingRequestControl.ascx" TagPrefix="uc1" TagName="PendingRequestControl" %>
<%@ Register Src="~/SessionControl/AutoRedirect.ascx" TagPrefix="uc1" TagName="AutoRedirect" %>















<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <%-- <uc1:AutoRedirect runat="server" ID="AutoRedirect" />--%>

    <dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="0" runat="server" ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>
                    <dx:TabPage Text="Generate Request">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                    <uc1:RequestControl runat="server" id="RequestControl" />
                             </dx:ContentControl>
                    
                                 </ContentCollection>
                        </dx:TabPage>

             

            <%--      <dx:TabPage Text="Pending Requests">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:PendingRequestControl runat="server" id="PendingRequestControl" />
                             </dx:ContentControl>
                                
                                 </ContentCollection>
                        </dx:TabPage>--%>

                </TabPages>
            </dx:aspxpagecontrol>

 
</asp:Content>
