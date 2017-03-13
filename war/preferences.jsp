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
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Query.Filter" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate" %>
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
	<title>Vybes - Preferences</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="apple-touch-icon" href="apple-touch-icon.png">
	
	<!-- JAVASCRIPTS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		crossorigin="anonymous"></script>
	<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	
	<!-- STYLESHEETS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<style>
	body {
		padding-top: 50px;
		padding-bottom: 20px;
		color: white;
	}
	a {
		color: white
	}
	</style>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/main.css">

	<!-- FONTS -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
</head>
<body>
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
					<li><a href="#aboutModal"><i class="glyphicon glyphicon-info-sign"></i></a></li>
					<li><a href="contact.jsp"><i class="glyphicon glyphicon-envelope"></i></a></li>
				</ul>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
<br>
<br>
<br>

	<%
	// Initialising UserService
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
			
	%>
	<div id="wrap">
		<div id="main" class="container">
			<div class="container">
				<div class="col-sm-3 center-block">
					<h2>Set your user preferences, <%= user.getNickname() %>!</h2>
					<h4>You can set your preferences by clicking the genres you would like
							to see from the <i>checkboxes</i> shown.
						</h4>		
					<p>Select from the following:</p>
						
					<form action="/setPreferences" method="get">
						<div class="form-group">
						
							<%
							
							// Initialising Datastore
					        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
						
							
					        // QUERY ONE FOR GENRE LIST
					        // Initialising query on kind 'Genre'
					        Query queryAllGenres = new Query("Genre").addSort("Name", Query.SortDirection.ASCENDING);
					        // Results being fetched as list
							PreparedQuery pq_one = datastore.prepare(queryAllGenres);
					        List<Entity> results_one = pq_one.asList(FetchOptions.Builder.withDefaults());
							
					     	
					        // QUERY TWO FOR USER PREFERENCES
					        // Set the filter to match the user's ID with the Google ID stored as an attribute in the datastore
							Filter userFilter = new FilterPredicate("GoogleID", FilterOperator.EQUAL, user.getUserId());
							// Initialising query on kind 'userPreference'
							Query queryFetchPreferences = new Query("UserPreference").setFilter(userFilter);	
							// Results being fetched as list
							PreparedQuery pq_two = datastore.prepare(queryFetchPreferences);
							List<Entity> results_two = pq_two.asList(FetchOptions.Builder.withDefaults());
							String glist = "";
							for( Entity result_two : pq_two.asIterable() ) {
								glist = (String) result_two.getProperty("GenreInterests");
							}
							
					        // FOR EACH GENRE IN GENRE TABLE
							for (Entity result : pq_one.asIterable()) {
								String name = (String) result.getProperty("Name");
								String parentGenre = (String) result.getProperty("ParentGenre");
								String description = (String) result.getProperty("Description");
								
							%>
								<div class="form-check">
			    					<label class="form-check-label">
			    					<input type="checkbox" name="genres" class="form-check-input" value="<%= name %>"
			    					<% if ( glist.contains(name) ) { // This pre-checks the box %> checked <% } %>><%= name %></label>
			    				</div>
		    				
							<%
							
							}
							
							%>
							
						</div>
						<button value="submit" class="btn btn-success">Submit Changes</button>
					</form>
				</div>	
			</div>
		</div><!-- END OF MAIN CLEAR-TOP -->
	</div><!-- END OF WRAP -->
	<!-- Footer -->
	<div class="navbar navbar-bottom">
		<hr>
		<footer>
		    <p>&copy; Vybes 2017</p>
		</footer>
	</div>
	
</body>
</html>