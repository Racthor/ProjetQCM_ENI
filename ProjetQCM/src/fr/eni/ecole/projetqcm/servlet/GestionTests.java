package fr.eni.ecole.projetqcm.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.ecole.projetqcm.bean.Section;
import fr.eni.ecole.projetqcm.bean.Test;

/**
 * Servlet implementation class GestionTests
 */
@WebServlet("/GestionTests")
public class GestionTests extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private Set<Test> tests; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionTests() {
        super();
		this.tests = new TreeSet<Test>();
		Test t1 = new Test();
		t1.setNom("p");
		Test t2 = new Test();
		t2.setNom("l");
		Test t3 = new Test();
		t3.setNom("o");
		Test t4 = new Test();
		t4.setNom("p");
		tests.add(t1);
		tests.add(t2);
		tests.add(t3);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		recupererTests();
		request.setAttribute("ensembleTests", tests);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/Home/gestionTests.jsp" ).forward( request, response );
	}

	private void recupererTests() {
		// TODO Récupère les tests dans la base de donnée et les mets de le treeSet tests
		String connectionString = "jdbc:sqlserver://localhost:1433;databaseName=qcm;user=sa;password=Pa$$w0rd;";
		Connection cnx = null;
		ResultSet rs = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			// Connexion via des paramètres donnée dans le web.xml
			cnx = DriverManager.getConnection(connectionString);
			PreparedStatement rechercheUser = cnx.prepareStatement(
					"SELECT * "
					+ "FROM Tests "
					+ "RIGHT JOIN Section_Test ON Tests.idTest=Section_Test.idTest "
					+ "LEFT JOIN Themes ON Section_Test.idTheme = Themes.idTheme "
					+ "RIGHT JOIN Questions ON Themes.idTheme = Questions.idTheme "
					+ "RIGHT JOIN ReponsesProposees ON Questions.idQuestion = ReponsesProposees.idQuestion ");
			
			rs = rechercheUser.executeQuery();
			
			StringBuilder sb = new StringBuilder();
			while(rs.next()) { // tant qu'il y a une réponse à la requête
				Test temptEst = new Test();
				temptEst.setNom(rs.getString(2));
				temptEst.setTempsPassage(rs.getDate(4));
				temptEst.setSeuilAcquis(rs.getInt(5));
				temptEst.setSeuilEnCours(rs.getInt(6));
				Section tempSection = new Section();
				
//				temptEst.setSection();
				this.tests.add(temptEst);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{ rs.close(); } catch (SQLException e) {e.printStackTrace();}
			if(cnx != null) try{ cnx.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Récupère les données du formulaire lors de la création d'un test et les intègre à la bdd
		doGet(request, response);
	}

}
