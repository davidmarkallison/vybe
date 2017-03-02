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

public class CreateGenreServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		// Initialising DataStore
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        
        String name = req.getParameter("Name"); 				// Get Genre Name
        String desc = req.getParameter("Description"); 			// Get Description of the Genre
        String examples = req.getParameter("ExampleArtists");	// Get Example Artists 
        String parentGenre = req.getParameter("ParentGenre"); 	// Is this a subgenre    
        	
		
        Entity genre = new Entity("Genre");

		genre.setProperty("Name", name); 					// Set Venue Name
		genre.setProperty("Description", desc);				// Set Description of the Venue
		genre.setProperty("ExampleArtists", examples);				// Set Venue Address
		genre.setProperty("ParentGenre", parentGenre);					// Set Phone Number
        
		datastore.put(genre);

        resp.sendRedirect("/creategenre.jsp");
       
   }

}