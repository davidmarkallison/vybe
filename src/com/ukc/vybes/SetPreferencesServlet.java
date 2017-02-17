package com.ukc.vybes;
import java.io.IOException;
import java.io.PrintWriter;

import com.google.api.server.spi.auth.common.User;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


import java.io.IOException;
//import javax.servlet.annotation.*;
import javax.servlet.ServletException;
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
        /**
         * TODO Create a check to see if the user already has a preference.
         * 		This will involve querying the DataStore using the userID (googleID variable).
         */
        if (user != null) {
        	String googleID = user.getUserId();
        	String googleName = user.getNickname();
        	String genres = req.getParameter("GenrePreferences");
            Entity userPreference = new Entity("UserPreference");
            userPreference.setProperty("GoogleID", googleID);
            userPreference.setProperty("GoogleNickname", googleName);
            userPreference.setProperty("GenresInterests", genres);
            datastore.put(userPreference);
        } else {
        	resp.sendRedirect("home.jsp");
        }
      
        // Need to work out how we're going to store the locations of the events
       
        

        resp.sendRedirect("/home.jsp");
       
   }

}