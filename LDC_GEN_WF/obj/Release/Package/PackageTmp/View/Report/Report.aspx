<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="LDC_GEN_WF.View.Report.Report" %>

<%@ Register Src="~/Custom/RequestLog.ascx" TagPrefix="uc1" TagName="RequestLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>
              <h3 style="color : #f90">Log Report</h3>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:RequestLog runat="server" ID="RequestLog" />
            </td>
        </tr>
    </table>


</asp:Content>
