package com.ukc.vybes;

import java.io.IOException;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class SetPreferencesServlet extends HttpServlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialising DataStore and UserService
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		UserService userService = UserServiceFactory.getUserService();

		// Getting user object if logged in
		com.google.appengine.api.users.User user = userService.getCurrentUser(); // has to be cast to avoid conflict with other packages
		
		if (user != null) {

			// Getting parameters from preferences.jsp
			String googleID = user.getUserId();
			String googleName = user.getNickname();
			String[] genres = req.getParameterValues("genres");
			String finalGenres = "";
			if (genres == null) {
				finalGenres = "No Preferences";
			} else {
				for (String s : genres) {
					if (finalGenres == "") {
						// To avoid unnecessary commas at the start of the
						// string
						finalGenres = finalGenres + s;
					} else {
						finalGenres = finalGenres + "," + s;
					}
				}
			}

			// Create new UserPreference Entity for a specific user
			Entity userPreference = new Entity("UserPreference", user.getUserId());

			// Set Entity's properties
			userPreference.setProperty("GoogleID", googleID);
			userPreference.setProperty("GoogleNickname", googleName);
			userPreference.setProperty("GenreInterests", finalGenres);

			// Update/Add new Entity to Datastore
			datastore.put(userPreference);

		} else {
			// Redirect to home page if not logged in
			resp.sendRedirect("home.jsp");
		}

		// Redirect to home page
		resp.sendRedirect("/home.jsp");

	}

}