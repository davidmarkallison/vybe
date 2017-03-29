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

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialise DataStore
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		// Get parameters from createvenue.jsp and set as local variables
		String name = req.getParameter("Name");
		String desc = req.getParameter("Description");
		String address = req.getParameter("StreetName").trim() // Trimmed for
																// formatting
				+ ", " + req.getParameter("Postcode").trim(); // Trimmed for
																// formatting
		String city = req.getParameter("City");
		String phone = req.getParameter("Phone");
		String email = req.getParameter("Email");
		String times = req.getParameter("OpeningHours");

		// TODO Fix below code for getting a location from the address variable
		// GeoCoding using Google's GeoCoding API
		// GeoApiContext context = new
		// GeoApiContext().setApiKey("AIzaSyAuoES8d6Yh6gnrY2fCHqYcIq-z3HMDooo");
		// GeocodingResult[] results = GeocodingApi.geocode(context,
		// address).await();

		// Create new venue Entity
		Entity venue = new Entity("Venue");

		// Set Entity's properties using local variables
		venue.setProperty("Name", name);
		venue.setProperty("Description", desc);
		venue.setProperty("Address", address);
		venue.setProperty("Phone", phone);
		venue.setProperty("City", city);
		venue.setProperty("Email", email);
		venue.setProperty("OpeningHours", times);

		// Update/Add Entity to the Datastore
		datastore.put(venue);

		// Redirect to home page
		resp.sendRedirect("/home.jsp");

	}

}