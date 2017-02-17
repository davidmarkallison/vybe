<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="EN"> <!--<![endif]-->
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
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/login.css">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <!-- LOGIN FILES -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
</head>
<body>
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
          		<a class="navbar-brand" href="#">Vybes</a>
        	</div>
        	<div id="navbar" class="navbar-collapse collapse">
        		<ul class="nav navbar-nav navbar-right">
        			<li><a href="#">About Us</a></li>
        			<li><a href="#">Contact Us</a></li>
        		</ul>
        	</div><!--/.navbar-collapse -->
      	</div>
    </nav>

	<!-- REGISTRATION FORM -->
	<div class="text-center" style="padding:50px 0">
  		<div class="logo">Register</div>
 		<!-- Main Form -->
		<div class="login-form-1">
   			<form id="register-form" class="text-left" method="get">
    	 		<div class="login-form-main-message"></div>
     			<div class="main-login-form">
       				<div class="login-group">
       					<div class="form-group">
           					<label for="reg_username" class="sr-only">Email address</label>
           					<input type="text" class="form-control" id="reg_username" name="reg_username" placeholder="username">
       					</div>
       					<div class="form-group">
           					<label for="reg_password" class="sr-only">Password</label>
           					<input type="password" class="form-control" id="reg_password" name="reg_password" placeholder="password">
       					</div>
       					<div class="form-group">
           					<label for="reg_password_confirm" class="sr-only">Password Confirm</label>
           					<input type="password" class="form-control" id="reg_password_confirm" name="reg_password_confirm" placeholder="confirm password">
       					</div>
       					<div class="form-group">
							<label for="reg_email" class="sr-only">Email</label>
           					<input type="text" class="form-control" id="reg_email" name="reg_email" placeholder="email">
       					</div>
       					<div class="form-group">
           					<label for="reg_firstname" class="sr-only">First Name</label>
           					<input type="text" class="form-control" id="reg_firstname" name="reg_firstname" placeholder="first name">
       					</div>
       					<div class="form-group">
           					<label for="reg_secondname" class="sr-only">Second Name</label>
           					<input type="text" class="form-control" id="reg_secondname" name="reg_secondname" placeholder="second name">
       					</div>
       					<div class="form-group login-group-checkbox">
           					<input type="radio" class="" name="reg_gender" id="male" placeholder="username">
           					<label for="male">male</label>
           					<input type="radio" class="" name="reg_gender" id="female" placeholder="username">
           					<label for="female">female</label>
							<input type="radio" class="" name="reg_gender" id="female" placeholder="username">
           					<label for="other">other</label>
       					</div>
       					<div class="form-group login-group-checkbox">
           					<input type="checkbox" class="" id="reg_agree" name="reg_agree">
       						<label for="reg_agree">i agree with the terms and conditions <a href="#">terms</a></label>
       					</div>
       				</div>
       				<button type="submit" action="/vybes" class="login-button"><i class="fa fa-chevron-right"></i></button>
     			</div>
     			<div class="etc-login-form">
       				<p>already have an account? <a href="/home.jsp">login here</a></p>
     			</div>
   			</form>
 		</div>
 		<!-- end:Main Form -->
	</div>
		
	<div class="navbar navbar-fixed-bottom">
		<hr>
		<footer>
			<div class="container text-center">
	    		<p>&copy; Vybes 2017</p>
	    	</div>
		</footer>
	</div>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/login.js"></script>
	
	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;e=o.createElement(i);r=o.getElementsByTagName(i)[0];
		e.src='//www.google-analytics.com/analytics.js';
		r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
		ga('create','UA-XXXXX-X','auto');ga('send','pageview');
	</script>
</body>
</html>