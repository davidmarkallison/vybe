package com.ukc.vybes;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class VenueServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        
        String v = req.getParameter("venue"); // Get Venue Name
        
        req.setAttribute("v", v);
        req.getRequestDispatcher("venue.jsp").forward(req, resp);
        
   }

}