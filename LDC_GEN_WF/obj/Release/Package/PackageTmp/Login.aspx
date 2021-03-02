<%@ Page Language="C#" AutoEventWireup="true" 
    CodeBehind="Login.aspx.cs" Inherits="LDC_GEN_WF.Login" EnableEventValidation="false" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LDC GnT Communication</title>
     <meta charset="utf-8">

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">


    <style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}
</style>


    
    <script type="text/javascript" src="SAjs/js/jquery-1.11.1.js"></script>
    <link href="css/bootstrap.css" />

    <script type="text/javascript" src="SAjs/js/bootstrap.js"></script>
    <script type="text/javascript" src="SAjs/sweetalert2.all.min.js"></script>


    <script type = "text/javascript">
        $(document).ready(function () {

            $("form").submit(function (e) {
                //showProgress();
            });


            function showProgress() {

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

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="index.html">
				LDC GnT Communication			
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						
						
					</li>
					
					<li class="">						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container">
	
	<div class="content clearfix">
		
		<form action="#" method="post">
         
        
                  

		
			<h1>Login</h1>		
			
			<div class="login-fields">
				
				<p>Please provide your details</p>
				
				<div class="field">
					<label for="username">Username</label>
					<%--<input type="text" id="username" name="username" value="" placeholder="Username" class="login username-field" />--%>
                    <asp:TextBox CssClass="login username-field"  ID="txtUserID" runat="server"></asp:TextBox>
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Password:</label>
					<%--<input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>--%>
                    <asp:TextBox CssClass="login password-field"  ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<%--<span class="login-checkbox">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Keep me signed in</label>
				</span>
				--%>					
				<%--<button class="button btn btn-success btn-large" >Sign In</button>--%>
                <asp:Button CssClass="form_buttonC"  ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click"  />
				
			</div> <!-- .actions -->
            
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->



<div class="login-extra">
	<a href="#"></a>
</div> <!-- /login-extra -->


<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>
    </form>
</body>
</html>
