package movieListPage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDetailDTO.MovieDetail;

/**
 * Servlet implementation class TestDetail
 */
@WebServlet("/MovieDetail")
public class MovieDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailPageServlet() {
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
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		MovieDetail movieDetail = new MovieDetail();
		
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
			stmt = conn.prepareStatement("SELECT MovieName,OpenDate,MovieType,Director,Actor,RunningTime,AgeGrade,Plot,MovieTrailer,PosterOne,PosterTwo,PosterThree"
					+ " FROM moviedetails" + " WHERE movieName=?");
			
			stmt.setString(1, request.getParameter("selectMovieName"));
			
			rs = stmt.executeQuery();
		
			if(rs.next()) {
				movieDetail.setMovieName(rs.getString("MovieName"));
				movieDetail.setOpenDate(rs.getString("OpenDate"));
				movieDetail.setMovieType(rs.getString("MovieType"));
				movieDetail.setDirector(rs.getString("Director"));
				movieDetail.setActor(rs.getString("Actor"));
				movieDetail.setRunningTime(rs.getString("RunningTime"));
				movieDetail.setAgeGrade(rs.getString("AgeGrade"));
				movieDetail.setPlot(rs.getString("Plot"));
				movieDetail.setMovieTrailer(rs.getString("MovieTrailer"));
				movieDetail.setPosterOne(rs.getString("PosterOne"));
				movieDetail.setPosterTwo(rs.getString("PosterTwo"));
				movieDetail.setPosterThree(rs.getString("PosterThree"));
			}
			
			request.setAttribute("movieDetail", movieDetail);
			
		} catch(Exception e) {
			throw new ServletException(e);
		}  finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}

		
		RequestDispatcher rd = request.getRequestDispatcher("/MovieDetail.jsp");
		rd.forward(request, response);
	}

}
