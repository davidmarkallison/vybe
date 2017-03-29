package com.ukc.vybes;

import java.io.IOException;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class CreateEventServlet extends HttpServlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialise Datastore
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		// Get parameters from createevent.jsp
		// Set parameters as local variables
		String name = req.getParameter("Name");
		String date = req.getParameter("Date");
		String startTime = req.getParameter("StartTime");
		String endTime = req.getParameter("EndTime");
		String genre = req.getParameter("Genre");
		String venue = req.getParameter("Venue");

		// Create Event Entity
		Entity event = new Entity("Event");

		// Set Event Entity's properties using local variables
		event.setProperty("Name", name);
		event.setProperty("Date", date);
		event.setProperty("StartTime", startTime);
		event.setProperty("EndTime", endTime);
		event.setProperty("Genre", genre);
		event.setProperty("Venue", venue);

		// TODO Store event (venue) location using geolocation functionality
		// from Google Maps API or GeoPT class

		// Update/Add Entity to Datastore
		datastore.put(event);

		// Redirect to the home page
		resp.sendRedirect("/home.jsp");

	}

}