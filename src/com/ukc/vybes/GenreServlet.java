package com.ukc.vybes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class GenreServlet extends HttpServlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		// Get genre from home.jsp
		String g = req.getParameter("genre");

		// Set accessible attribute for the forwarded address
		req.setAttribute("g", g);

		// Send user and attribute to genre.jsp
		req.getRequestDispatcher("genre.jsp").forward(req, resp);

	}

}