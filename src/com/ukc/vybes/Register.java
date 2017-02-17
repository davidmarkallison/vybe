package com.ukc.vybes;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.*;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class Register extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		String username = req.getParameter("reg_username");
		String firstname = req.getParameter("reg_firstname");
		String secondname = req.getParameter("reg_secondname");	
		Date date = req.getParameter(new Date());
		String password = req.getParameter("reg_password");
		String email = req.getParameter("reg_email");
		String gender = req.getParameter("reg_gender");
		String agree = req.getParameter("reg_agree");
		
		Entity vybesUser = new Entity("vybesUser");
		
		if (user != null) {
			greeting.setProperty("user_name", user.getNickname());
		} else {
			greeting.setProperty("user_name", "Anonymous");
		}
		
		greeting.setProperty("date", new Date());
		greeting.setProperty("content", content);
		
		datastore.put(greeting);
		
		resp.sendRedirect("/home.jsp");
		
	}

}