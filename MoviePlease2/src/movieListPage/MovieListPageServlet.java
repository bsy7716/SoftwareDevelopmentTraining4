package movieListPage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDTO.Movie;

/**
 * Servlet implementation class MovieListPageServlet
 */
@WebServlet("/MovieList")
public class MovieListPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC",
					"study",
					"study");
			stmt = conn.prepareStatement("SELECT movieName,imageUrl,openDate" + " from MOVIE");
			
			ArrayList<Movie> movies = new ArrayList<Movie>();
			rs = stmt.executeQuery();
			
		while(rs.next()) {
			movies.add(new Movie()
					.setMovieName(rs.getString("movieName"))
					.setImageUrl(rs.getString("imageUrl"))
					.setopenDate(rs.getString("openDate"))
					);
			}

		request.setAttribute("movieList", movies);
		
		RequestDispatcher rd = request.getRequestDispatcher("/MovieList.jsp");
		rd.forward(request, response);
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
