<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="EN"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Vybes</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="apple-touch-icon" href="apple-touch-icon.png">

	<!-- STYLESHEETS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<style>
		body {
	    	padding-top: 50px;
	   		padding-bottom: 20px;
		}
	</style>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login.css">
	<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	
	<!-- LOGIN FILES -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
</head>
<body>

	
	<!-- LOGIN FORM -->
	<div class="text-center" style="padding:50px 0">
		<div class="logo">Login</div>
		<!-- Main Form -->
		<div class="login-form-1">
			<form id="login-form" class="text-left">	
		    	<div class="login-form-main-message"></div>	
		    	<div class="main-login-form">
		      		<div class="login-group">
		        		<div class="form-group">
		          			<label for="lg_username" class="sr-only">Username</label>
		          			<input type="text" class="form-control" id="lg_username" name="lg_username" placeholder="username">
		        		</div>
		        		<div class="form-group">
		          			<label for="lg_password" class="sr-only">Password</label>
		          			<input type="password" class="form-control" id="lg_password" name="lg_password" placeholder="password">
		        		</div>
		        		<div class="form-group login-group-checkbox">
		          			<input type="checkbox" id="lg_remember" name="lg_remember">
		          			<label for="lg_remember">remember</label>
		        		</div>
		      		</div>
		      		<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
		    	</div>
		    	<div class="etc-login-form">
	      			<p>forgot your password? <a href="./forgotpassword.html">click here</a></p>
	      			<p>new user? <a href="./registration.html">create new account</a></p>
	    		</div>
	  		</form>
		</div>
		<!-- end:Main Form -->
	</div>
	<div class="container"> <!-- The G.A.E. Code here is for reference and should be deleted or edited and used when/where appropriate -->
		<%
			UserService userService = UserServiceFactory.getUserService();
			User user=userService.getCurrentUser();
			if(user!=null) {
		%>
		<div class="panel panel-info">
			<div class="panel-heading">Ignore This</div>
			<div class="panel-body">
				<p class="text-info">Hello,<%= user.getNickname()%>! <b><a class="text-danger" href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Sign Out?</a></b></p>
			</div>
		</div>
		<% } else { %>
		<div class="panel panel-warning">
			<div class="panel-heading">Ignore This</div>
			<div class="panel-body">
				<p class="text-warning">Hello! <b><a class="text-danger" href="<%= userService.createLoginURL("/signinapp.jsp") %>">Sign In</a></b></p>
			</div>
		</div>
		<% } %>
	</div>
</body>

</html>