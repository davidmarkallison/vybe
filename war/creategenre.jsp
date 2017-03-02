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
    <title>Create an genre</title>
</head>
<body>
   <div class = "container">
       <form method="get" action="/createGenre" enctype="multipart/form-data">
   
            <div class="form-group">
                 <label for="Name">Name</label>
                  <input type="text" name="Name" id="Name" class="form-control" />
            </div>
            <div class="form-group">
                 <label for="Date">Description</label>
                  <input type="text" name="Description" id="Description" class="form-control" />
            </div>
            <div class="form-group">
                 <label for="StartTime">Example Artists</label>
                  <input type="text" name="ExampleArtists" id="ExampleArtists" class="form-control" />
            </div>
            <div class="form-group">
                 <label for="EndTime">Parent Genre</label>
                  <input type="text" name="ParentGenre" id="ParentGenre" class="form-control" />
            </div>
            
            <button type="submit" class="btn btn-success">Save</button>
       </form>
   </div>
</body>
</html>