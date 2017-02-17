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

public class CreateEventServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialising DataStore
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        UserService userService = UserServiceFactory.getUserService();
        com.google.appengine.api.users.User user = userService.getCurrentUser();
        
        String name = req.getParameter("Name");
        String date = req.getParameter("Date");
        String startTime = req.getParameter("StartTime");
        String endTime = req.getParameter("EndTime");
        String genre = req.getParameter("Genre");
        String venue = req.getParameter("Venue");

        Entity event = new Entity("Event");

		event.setProperty("Name", name); // set the event's(entity) name property value from the form parameter input "event_name" (in the .jsp file)
        event.setProperty("Date", date);
        event.setProperty("StartTime", startTime);
        event.setProperty("EndTime", endTime);
        event.setProperty("Genre", genre);
        event.setProperty("Venue", venue);

        // Need to work out how we're going to store the locations of the events
       
        datastore.put(event);

        resp.sendRedirect("/home.jsp");
       
   }

}