<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="EN"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Vybes - Contact</title>
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
    <script>
    $(document).ready(function(){
    	$().button('toggle');
    	$('[data-toggle="tooltip"]').tooltip();
    		
    }
    </script>
    
</head>
<body>

	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
	
		if (user != null) {
			pageContext.setAttribute("user", user);
		}
	%>
	
	<!--[if lt IE 8]>
    	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
	<nav class="navbar navbar-fixed-top" role="navigation">
    	<div class="container">
      		<div class="navbar-header">
         		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
         		</button>
         		<a class="navbar-brand" href="home.jsp">Vybes</a>
       		</div>
       		<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="about.jsp">About Us</a></li>
					<li><a href="contact.jsp">Contact Us</a></li>
					<% if (user != null) { %>
						<li><a href="preferences.jsp"><i class="glyphicon glyphicon-cog"></i></a></li>
					<% } %>
				</ul>
       		</div><!--/.navbar-collapse -->
      	</div>
	</nav>
<br>
<br>
<br>
	<!-- INFORMATION ABOUT VYBES DEVELOPERS -->
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">Contact Us</div>
		  	<div class="panel-body text-info">
				Contact details coming soon!
			</div>
		</div>
		<!-- TODO center this button -->
		<div class="text-center center-block">
			<a href="home.jsp" class="btn btn-primary center" role="button">Return Home</a>
		</div>
	</div>

	<!-- Footer -->
	<div class="navbar navbar-fixed-bottom">
		<hr>
		<footer>
			<div class="container text-center">
		    	<p>&copy; Vybes 2017</p>
		    </div>
		</footer>
	</div>
	
	<!-- Google Analytics -->
   	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/vendor/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/login.js"></script>
       
    <!-- Change UA-XXXXX-X to be your site's ID. -->
    <script>
        (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
        function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
        e=o.createElement(i);r=o.getElementsByTagName(i)[0];
        e.src='//www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
        ga('create','UA-XXXXX-X','auto');ga('send','pageview');
    </script>	        

</body>
</html>	