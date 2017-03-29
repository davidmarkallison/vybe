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
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="EN">
<!--<![endif]-->
<head>
<title>Create an event</title>
</head>
<body>
	<div class="container">
		<form method="get" action="/createEvent" enctype="multipart/form-data">

			<div class="form-group">
				<label for="Name">Event Name</label> <input type="text" name="Name"
					id="Name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="Date">Event Date</label> <input type="text" name="Date"
					id="Date" class="form-control" />
			</div>
			<div class="form-group">
				<label for="StartTime">Event Start Time</label> <input type="text"
					name="StartTime" id="StartTime" class="form-control" />
			</div>
			<div class="form-group">
				<label for="EndTime">Event End Time</label> <input type="text"
					name="EndTime" id="EndTime" class="form-control" />
			</div>
			<select name="Genre" id="Genre">
				<%
                
				// Initialising Datastore
                DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                
                Query queryAllGenres = new Query("Genre").addSort("Name", Query.SortDirection.ASCENDING);
                // Results being fetched as list
                PreparedQuery pqGenres = datastore.prepare(queryAllGenres);
                List<Entity> genreResults = pqGenres.asList(FetchOptions.Builder.withDefaults());
                
                for (Entity result : pqGenres.asIterable()) {
                
                %>
				<option value="<%= result.getProperty("Name") %>">
					<%= result.getProperty("Name") %></option>
				<%
                }
                %>

			</select>
			<div class="form-group">
				<select name="Venue" id="Venue">
					<%
	
	                Query queryAllVenues = new Query("Venue").addSort("Name", Query.SortDirection.ASCENDING);
	                // Results being fetched as list
	                PreparedQuery pqVenues = datastore.prepare(queryAllVenues);
	                List<Entity> venueResults = pqVenues.asList(FetchOptions.Builder.withDefaults());
	                
	                for (Entity result : pqVenues.asIterable()) {
	                
	                %>

					<option value="<%= result.getProperty("Name") %>">

						<%= result.getProperty("Name") %></option>

					<%
                	}
               		%>

				</select>
			</div>
			<button type="submit" class="btn btn-success">Save</button>
		</form>
	</div>
</body>
</html>