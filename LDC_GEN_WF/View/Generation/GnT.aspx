<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GnT.aspx.cs" Inherits="LDC_GEN_WF.View.Generation.GnT" Async="true"%>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Custom/GntControl.ascx" TagPrefix="uc1" TagName="GntControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="0" runat="server" ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>
                    <dx:TabPage Text="Request Status">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:GntControl runat="server" id="GntControl" />
                             </dx:ContentControl>
                    
                                 </ContentCollection>
                        </dx:TabPage>

             


                </TabPages>
            </dx:aspxpagecontrol>

</asp:Content>
