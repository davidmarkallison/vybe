package com.ukc.vybes;
import java.io.IOException;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
//import com.google.appengine.api.datastore.PreparedQuery;
//import com.google.appengine.api.datastore.Query;
//import com.google.appengine.api.datastore.Query.Filter;
//import com.google.appengine.api.datastore.Query.FilterOperator;
//import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class SetPreferencesServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialising DataStore and UserService
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        UserService userService = UserServiceFactory.getUserService();
        com.google.appengine.api.users.User user = userService.getCurrentUser(); // has to be cast to avoid conflict
        
        
        if (user != null) {
        	
            
//            Filter propertyFilter = new FilterPredicate("GoogleID", FilterOperator.EQUAL, user.getUserId());
//            Query queryUserID = new Query("UserPreference").setFilter(propertyFilter);
            
        	String googleID = user.getUserId();
        	String googleName = user.getNickname();
        	String[] genres = req.getParameterValues("genres");
        	String finalGenres = "";
        	if (genres == null) {
        		finalGenres = "No Preferences";
        	} else {
        		for(String s : genres){
        			if(finalGenres == ""){
        				finalGenres = finalGenres + s; 			// To avoid unnecessary commas at the start of the string
        			} else {
        				finalGenres = finalGenres + "," + s;
        			}
            	}
        	}

            Entity userPreference = new Entity("UserPreference", user.getUserId());
            
            userPreference.setProperty("GoogleID", googleID);
            userPreference.setProperty("GoogleNickname", googleName);
            userPreference.setProperty("GenreInterests", finalGenres);
    
            datastore.put(userPreference);
        
        } else {
        	resp.sendRedirect("home.jsp");
        }
      
        // Need to work out how we're going to store the locations of the events
       
        resp.sendRedirect("/home.jsp");
       
   }

}