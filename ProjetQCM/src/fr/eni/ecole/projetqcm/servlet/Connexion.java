package fr.eni.ecole.projetqcm.servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Connexion
 */
@WebServlet("/connexion")
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		connexionBdd(request, response);
	}
	
	private void connexionBdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		// Pour que ça comprenne le html
		response.setContentType("text/html");
		
		Connection cnx = null;
		ResultSet rs = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			// Connexion via des paramètres donnée dans le web.xml
			cnx = DriverManager.getConnection(getInitParameter("connectionString"));
			
			StringBuilder sb = new StringBuilder();
			
			PreparedStatement rechercheUser = cnx.prepareStatement("SELECT * FROM Users WHERE email = ? AND password = ?");

			rechercheUser.setString(1, request.getParameter("login"));
			rechercheUser.setString(2, request.getParameter("password"));

			rs = rechercheUser.executeQuery();
		
			// Si candidat : redirect vers candidat.jsp
			// si Eni : redirect vers personnelEni.jsp ou formateurEni.jsp
			// Sinon : retour vers la page d'accueil + message d'erreur
			if (rs.next()) { // y a t'il une réponse à la requête
				sb.append("<br/>Login: ").append(rs.getString(3)); // 4ième valeur dans la table
				sb.append("<br/>Mot de passe: ").append(rs.getString(4)); // 5ième valeur dans la table
				String statut = rs.getString(5);
				if(statut.equals("personnel_ENI")){
					sb.append("Statut : personnel_ENI");
					//forward
					request.getRequestDispatcher( "/Home" ).forward( request, response );
				} else if (statut.equals("formateur")){
					request.setAttribute("formateur", "true");
					//forward
					request.getRequestDispatcher( "/Home" ).forward( request, response );
				} else if (statut.equals("candidat")){
					sb.append("plop");
					//forward
//					request.getRequestDispatcher( "/jsp/candidat.jsp" ).forward( request, response );
				}
			} else {
				// forward home
				request.setAttribute("erreur", "loginPassword");
				request.getRequestDispatcher( "/Centrale" ).forward( request, response );
			}

			
			
		} catch (ClassNotFoundException e) {
			response.getWriter().append("<p>Driver introuvable : </p>");
			e.printStackTrace();
		} catch (SQLException e) {
			response.getWriter().append("<p>Connection fail : SQLException</p>");
			e.printStackTrace();
		} finally {
			if(rs != null) try{ rs.close(); } catch (SQLException e) {e.printStackTrace();}
			if(cnx != null) try{ cnx.close(); } catch (SQLException e) {e.printStackTrace();}
		}
	}
}
