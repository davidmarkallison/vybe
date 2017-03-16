<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@ page import="com.google.appengine.api.datastore.Key"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.Query.Filter"%>
<%@ page
	import="com.google.appengine.api.datastore.Query.FilterPredicate"%>
<%@ page
	import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="EN">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Vybes - Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<!-- JAVASCRIPTS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>

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

<!-- FONTS -->
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

		if (user != null) {
			pageContext.setAttribute("user", user);
		}
	%>

	<!--[if lt IE 8]>
    	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
	<nav id="topnav" class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.jsp">Vybes</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal" href="#aboutModal"><i
							class="glyphicon glyphicon-info-sign"></i></a></li>
					<li><a class="page-scroll" data-toggle="modal" href="#contactModal"><i
							class="glyphicon glyphicon-envelope"></i></a></li>
					<%
						if (user != null) {
					%>
					<li><a href="preferences.jsp"><i
							class="glyphicon glyphicon-cog"></i></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>

	<br>
	<br>
	<br>

	<div class="container">
		<%
			if (user != null) {
		%>


		<div class="panel panel-success">
			<div class="panel-heading">You Are Logged In To Vybes</div>
			<div class="panel-body text-success">You are logged into Vybes
				using your Google Account. Your Google Account and its security is
				completely handled by Google's world-class, highly-experienced
				engineers. If you have any problem's with the account and how it
				works on Vybes, please contact Google. They will look after you. If
				you wish to log out of Vybes, click the button below.</div>
		</div>
		<!-- TODO center this button -->
		<div class="text-center center-block">
			<a href="<%=userService.createLogoutURL(request.getRequestURI())%>"
				class="btn btn-danger" role="button">Logout</a>
		</div>

		<br>
		<hr>
		<br>

		<%
			// Initialising Datastore
				DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

				// Set the filter to match the user's ID with the Google ID stored as an attribute in the datastore
				Filter userFilter = new FilterPredicate("GoogleID", FilterOperator.EQUAL, user.getUserId());

				// Initialising query on kind 'userPreference'
				Query queryFetchPreferences = new Query("UserPreference").setFilter(userFilter);

				// Results being fetched as list
				PreparedQuery pq = datastore.prepare(queryFetchPreferences);
				List<Entity> results = pq.asList(FetchOptions.Builder.withDefaults());

				// If the list is empty, the user has not set any preferences
				if (results.isEmpty()) {
		%>

		<h3>You have not set any preferences.</h3>

		<%
			} else {
		%>

		<h3>You currently have an interest in:</h3>

		<%
			for (Entity result : pq.asIterable()) {
						String genre = (String) result.getProperty("GenreInterests");

						String[] split = genre.split(",");
						for (String g : split) {
						}
					}
				}
		%>

		<!-- LINKS TO PREFERRED GENRES -->
		<div class="gallery">

			<%
				for (Entity result : pq.asIterable()) {
						String genre = (String) result.getProperty("GenreInterests");

						String[] split = genre.split(",");
						for (String g : split) {
							g = g.trim();
			%>

			<div class="col-sm-3">
				<form action="/genre" method="get">
					<figure>
						<input type="hidden" name="genre" class="form-check-input"
							value="<%=g%>">
						<button value="submit">
							<img src="img/<%=g%>.jpg" style="width: 100%" alt="Genre: <%=g%>">
						</button>
					</figure>
				</form>
			</div>

			<%
					}
				}
			%>
		</div>

		<%
			} else {
		%>

		<!-- IF NOT LOGGED IN -->
		<div class="panel panel-danger">
			<div class="panel-heading">You Are Not Logged In To Vybes</div>
			<div class="panel-body text-danger">If you wish to use Vybes to
				plan a night out, all you need to do is log in with a valid Google
				Account. All of your data is handled by Google and NOT sold on to
				third parties by Vybes. Your data is stored securely using Google's
				Cloud Services.</div>
		</div>

		<div class="text-center center-block">
			<a href="<%=userService.createLoginURL(request.getRequestURI())%>"
				class="btn btn-primary" role="button">Log in with Google</a>
		</div>

		<%
			}
		%>
		<!-- ABOUT MODAL -->
		<div  class="modal fade text-info" id="aboutModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<h2 class="text-center">About</h2>
						<p class="text-justify">Vybes was created with the idea of
							finding spontaneous nights out to your favourite musical tastes.</p>
						<br />
						<button class="btn btn-primary btn-lg center-block"
							data-dismiss="modal" aria-hidden="true">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END OF ABOUT MODAL -->

		<!-- CONTACT MODAL -->
		<div id="contactModal" class="modal fade text-info" tabindex="-1" role="dialog"
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
	<!-- END OF CONTAINER -->

	<br>
	<br>
	<br>

	<!-- FOOTER -->
	<footer class="footer">
		<div class="container text-center">
			<p class="muted">&copy; Vybes 2017</p>
		</div>
	</footer>
</body>
</html>



