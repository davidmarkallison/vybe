package com.ukc.vybes;

import java.io.IOException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class VybesServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// Initialise the user handler (user service) and check for logged in
		// user
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {
		
			// If logged in - redirect to home page
			resp.sendRedirect("home.jsp");
		
		} else {
			
			// otherwise send to welcome page
			resp.sendRedirect("welcome.jsp");
		
		}
	}
}
