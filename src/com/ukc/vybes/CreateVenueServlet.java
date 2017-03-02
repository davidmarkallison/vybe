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

@SuppressWarnings("serial")

public class CreateVenueServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		// Initialising DataStore
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        String name = req.getParameter("Name"); 			// Get Venue Name
        String desc = req.getParameter("Description"); 		// Get Description of the Venue
        String address = req.getParameter("StreetName")
        		+ ", " + req.getParameter("Postcode"); 		// Get Postcode or Zipcode 
        String phone = req.getParameter("Phone");			// Get Phone Number    
        String times = req.getParameter("OpeningHours");	// Get Opening Hours of Venue
        	
        // GeoCoding using Google's GeoCoding API

		//GeoApiContext context = new GeoApiContext().setApiKey("AIzaSyAuoES8d6Yh6gnrY2fCHqYcIq-z3HMDooo");
		//GeocodingResult[] results =  GeocodingApi.geocode(context, address).await();
		
		
        Entity venue = new Entity("Venue");

		venue.setProperty("Name", name); 					// Set Venue Name
		venue.setProperty("Description", desc);				// Set Description of the Venue
		venue.setProperty("Address", address);				// Set Venue Address
		venue.setProperty("Phone", phone);					// Set Phone Number
		venue.setProperty("Email", name);					// Set Email
		venue.setProperty("OpeningHours", times);			// Set Opening Hours of Venue
        
		datastore.put(venue);

        resp.sendRedirect("/home.jsp");
       
   }

}