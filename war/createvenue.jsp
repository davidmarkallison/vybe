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
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.Query.Filter"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="EN"> <!--<![endif]-->
<head>
	<title>Enter a Venue</title>
</head>
<body>
	<div id="floating-panel">
		<input id="address" type="text" value="Canterbury, Kent">
		<input id="submit" type="button" value="Geocode">
	</div>
	<div id="map"></div>
	<br><br><br>
	<div id="latlon">
	</div>
	
	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
	%>
	<br><br><br>
    <div class = "container">
        <form method="get" action="/createVenue" enctype="multipart/form-data">
     
			<div class="form-group">	
			     <label for="Name">Venue Name</label>
			      <input type="text" name="Name" id="Name" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="Desription">Description</label>
			      <input type="text" name="Description" id="Description" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="StreetName">Street Name</label>
			      <input type="text" name="StreetName" id="StreetName" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="Postcode">Postcode</label>
			      <input type="text" name="Postcode" id="Postcode" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="City">City</label>
			      <input type="text" name="City" id="City" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="Phone">Phone Number</label>
			      <input type="text" name="Phone" id="Phone" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="Email">Email</label>
			      <input type="text" name="Email" id="Email" class="form-control" />
			</div>
			<div class="form-group">
			     <label for="OpeningHours">Opening Hours</label>
			      <input type="text" name="OpeningHours" id="OpeningHours" class="form-control" />
			</div>
			<button type="submit" <% if (user != null){ %> class="btn btn-success" <% } else { %> class="btn btn-success" disabled <% } %> >Save</button>
        </form>
    </div>
</body>
</html>