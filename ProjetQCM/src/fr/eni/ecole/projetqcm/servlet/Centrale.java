package fr.eni.ecole.projetqcm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Centrale
 */
public class Centrale extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Centrale() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doIt(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void doIt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session;
		if (request.getParameter("session") !=null) {
			session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}
		}
		session = request.getSession();		
		response.setContentType("text/html");
//		RequestDispatcher dispatcher = null;
//		dispatcher = request.getRequestDispatcher("/html/home.html");
//		dispatcher.include(request, response);
		request.setAttribute("login",true);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/Login/login.jsp" ).forward( request, response );
		
	}
}
