<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateLDCEmailTemplate.aspx.cs" Inherits="LDC_GEN_WF.EmailTemplate.UpdateLDCEmailTemplate" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style8 {
            font-size: small;
        }

        .style10 {
            font-family: Tahoma;
            font-weight: bold;
        }

        .style12 {
            color: #40C1E1;
        }
    </style>
    <style type="text/css">
        .style1 {
            font-family: Verdana;
            font-size: small;
        }

        .style14 {
            font-family: Verdana;
        }

        .style15 {
            font-size: x-small;
        }
    p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
a:link
	{color:blue;
	text-decoration:underline;
	text-underline:single;
        }
        .auto-style1 {
            font-size: medium;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" width="100%">
                <tr>
                    <td align="left" valign="top" bgcolor="#FFFFFF" width="100%">
                        <table width="100%">
                            <tr>
                                <td bgcolor="#0897C9" width="100%">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style8" width="100%">
                                    <span>
                                        <span class="style1">Dear,
                                    <br />
                                              <span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;
mso-hansi-theme-font:minor-latin;color:black;mso-themecolor:text1;mso-ansi-language:
EN-US"><span class="auto-style1"></o:p>Please note that <span class="style12">LDC - Request </span> ( @@RequestID )  , has been  @@RequestStatus . The details are as under:</span></p>
                                        </span>
</span> </td></tr>


                              <tr>
                                <td class="style8" width="100%">

                                            <table align="center" width="100%" border="1" 
                                                            align="center"  cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td bgcolor="#0897C9" >Request ID</td>
                                                    <td class="style12">@@RequestID</td>
                                                </tr>

                                                 <tr>
                                                    <td bgcolor="#0897C9">Plant</td>
                                                    <td class="style12">@@Plant</td>
                                                </tr>


                                                 <tr>
                                                    <td bgcolor="#0897C9">Request Nature</td>
                                                    <td class="style12">@@RequestNature</td>
                                                </tr>


                                                 <tr>
                                                    <td bgcolor="#0897C9">Request Quantity</td>
                                                    <td class="style12">@@RequestQuantity</td>
                                                </tr>


                                                   <tr>
                                                    <td bgcolor="#0897C9">Request Date</td>
                                                    <td class="style12">@@RequestDate</td>
                                                </tr>


                                                     <tr>
                                                    <td bgcolor="#0897C9">Reason for Request</td>
                                                    <td class="style12">@@ReasonforRequest</td>
                                                </tr>


                                                <tr>
                                                    <td colspan="2"></td>
                                                </tr>


                                                       <tr>
                                                    <td bgcolor="#0897C9">Request Status</td>
                                                    <td class="style12">@@RequestStatus</td>
                                                </tr>



                                                           <tr>
                                                    <td bgcolor="#0897C9">Approver Comments</td>
                                                    <td class="style12">@@ApproverComments</td>
                                                </tr>



                                                               <tr>
                                                    <td bgcolor="#0897C9">Approve Date</td>
                                                    <td class="style12">@@ApproverDate</td>
                                                </tr>


                                            </table>

                                    </td>

                                  </tr>

                            <tr>
                                <td></td>
                            </tr>


                            <tr>
                                   <td><span class="style1">regards</span></span><span class="style10"><br 
                                                        class="style1" />
                                            <span class="style12">ITG</span><br />
                                            </span></td>
                            </tr>



                                <td>
             <a href="http://ncm-uat-srv:8078/login.aspx" >
                                            <span class="style12">Login</span></a>
         </td>

                         

                        <tr>
                                <td class="style8" width="100%">
                                    <span>
                                        <span class="style1">
                                    <br />
                                              <span style="font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;
mso-hansi-theme-font:minor-latin;color:black;mso-themecolor:text1;mso-ansi-language:
EN-US"><span class="auto-style1"></o:p>this is system generated email.</span></p>
                                        </span>
</span> </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

