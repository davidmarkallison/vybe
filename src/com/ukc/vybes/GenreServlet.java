package com.ukc.vybes;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

public class GenreServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        
        String g = req.getParameter("genre"); // Get Genre Name
        
        req.setAttribute("g", g);
        req.getRequestDispatcher("genre.jsp").forward(req, resp);
        
   }

}