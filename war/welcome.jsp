<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="EN">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Vybes</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
body {
	padding-top: 50px;
	padding-bottom: 20px;
}
</style>
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/landing.css">
<link rel="stylesheet" href="css/animate.min.css">
<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<!-- EXTRA FILES -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round'
	rel='stylesheet' type='text/css'>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
</head>
<body>
	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
	%>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<nav id="topnav" class="navbar navbar-default ">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/vybes">Vybes</a>
			</div>

			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal"
						href="#aboutModal"><i class="glyphicon glyphicon-info-sign"></i></a></li>
					<li><a class="page-scroll" data-toggle="modal"
						href="#contactModal"><i class="glyphicon glyphicon-envelope"></i></a></li>
				</ul>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>

	<div class="container">

		<!--MAIN LANDING PAGE CONTENT -->
		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-1">
						<div class="header-content">
							<div class="header-content-inner">
								<h1>Vybes</h1>
								<h2 style="padding-top: 25px;">A night out on your
									wavelength</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<section style="margin-top: 350px;" id="one">
			<div class="container-fluid">
				<div class="row">
					<div id="infoText" class="col-md-4 ">
						<h3>What is</h3>

						<h3 style="font-family: 'Pacifico', cursive; margin-left: 10px;">Vybes?</h3>

						<p style="padding-top: 70px;">Social events are being
							organised at the last minute, often resulting in evenings which
							are not enjoyable. Our web application allows users to avoid a
							bad night out by allowing them to easily browse a list of venues
							in their local area based on their preferred music genre.</p>
						<br> <br>

						<h3>Click the button below to find your Vybe...</h3>
						<br> <br>
						<div class="text-center col-sm-12">
							<a href="<%=userService.createLoginURL("home.jsp")%>"
								class="btn btn-primary col-sm-12" role="button">Log in with
								Google!</a><br>
							<br>
						</div>
						<br>
						<br>

					</div>
					<div class="col-sm-4">
						<img src="img\1.jpg"> <img src="img\2.jpg">
					</div>
					<div class="col-sm-4">
						<img style="width: 250px;" src="img\3.jpg">
					</div>
				</div>
			</div>
		</section>
		<!-- END OF LANDING PAGE CONTENT -->

		<!-- ABOUT MODAL -->
		<div class="modal fade" id="aboutModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<h2 class="text-center">About</h2>
						<p class="text-justify">Vybes was created with the idea of
							finding spontaneous nights out to your favourite musical tastes.</p>
						<br>
						<button class="btn btn-primary btn-lg center-block"
							data-dismiss="modal" aria-hidden="true">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END OF ABOUT MODAL -->

		<!-- CONTACT MODAL -->
		<div id="contactModal" class="modal fade" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body text-center">
						<h2 class="text-center">Contact Us</h2>
						<p>David Allison - dma6@kent.ac.uk</p>
						<p>Thomas Robinson - tr228@kent.ac.uk</p>
						<p>Michael Wenborn - mjaw3@kent.ac.uk</p>
						<br />
						<button class="btn btn-primary btn-lg center-block"
							data-dismiss="modal" aria-hidden="true">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END OF CONTACT MODAL -->

	</div>
	<!-- END OF MAIN CONTENT CONTAINER -->

	<br>

	<!-- FOOTER -->
	<footer class="footer">
		<div class="container text-center">
			<p class="muted">&copy; Vybes 2017</p>
		</div>
	</footer>

	<!-- JQUERYUI -->
	<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
		integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
