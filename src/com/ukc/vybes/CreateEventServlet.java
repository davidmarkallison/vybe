package com.ukc.vybes;
import java.io.IOException;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
//import com.google.appengine.api.users.UserService;
//import com.google.appengine.api.users.UserServiceFactory;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author David Allison
 * NEED TO COMMENT THIS FILE THE SAME WAY AS CreateVenueServlet.java.
 *
 */


@SuppressWarnings("serial")

public class CreateEventServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        String name = req.getParameter("Name");
        String date = req.getParameter("Date");
        String startTime = req.getParameter("StartTime");
        String endTime = req.getParameter("EndTime");
        String genre = req.getParameter("Genre");
        String venue = req.getParameter("Venue");

        Entity event = new Entity("Event");

		event.setProperty("Name", name);
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