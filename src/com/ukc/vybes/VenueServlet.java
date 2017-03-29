package com.ukc.vybes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class VenueServlet extends HttpServlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		// Get venue parameter from genre.jsp
		String v = req.getParameter("venue"); // Get Venue Name

		// Set accessible attribute for venue.jsp
		req.setAttribute("v", v);

		// Send user and attribute to venue.jsp
		req.getRequestDispatcher("venue.jsp").forward(req, resp);

	}

}