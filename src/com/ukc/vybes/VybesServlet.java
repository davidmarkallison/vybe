package com.ukc.vybes;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class VybesServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.sendRedirect("home.jsp");
	}
}
