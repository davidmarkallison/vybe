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
	<title>SET USER PREFERENCES</title>
</head>
<body>
	<h1>SET USER PREFERENCES</h1>
	<h5>Select from the following:</h5>
	<form method="get" action="/setPreferences" enctype="multipart/form-data">
		<input type="checkbox" name="drumandbass" value="drumandbass">Drum and Bass <br>
		<input type="checkbox" name="jazz" value="jazz">Jazz <br>
		<input type="checkbox" name="pop" value="pop">Pop <br>
		<input type="checkbox" name="rock" value="rock">Rock <br>
		<button value="submit">Submit</button>
	</form>
</body>
</html>