package com.ukc.vybes;

import java.io.IOException;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class CreateGenreServlet extends HttpServlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialise DataStore
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		// Get parameters from creategenre.jsp
		// Set parameters as local variables
		String name = req.getParameter("Name");
		String desc = req.getParameter("Description");
		String examples = req.getParameter("ExampleArtists");
		String parentGenre = req.getParameter("ParentGenre");

		// Create Genre Entity
		Entity genre = new Entity("Genre");

		// Set Entity's properties using local variables
		genre.setProperty("Name", name);
		genre.setProperty("Description", desc);
		genre.setProperty("ExampleArtists", examples);
		genre.setProperty("ParentGenre", parentGenre);

		// Update/Add Entity to Datastore
		datastore.put(genre);

		// Redirect to home page
		resp.sendRedirect("/home.jsp");

	}

}