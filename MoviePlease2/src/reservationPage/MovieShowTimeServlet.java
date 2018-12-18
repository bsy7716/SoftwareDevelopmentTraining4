package reservationPage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MovieShowTimeServlet
 */
@WebServlet("/MovieShowTimeServlet")
public class MovieShowTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieShowTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
	
		
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
			stmt = conn.prepareStatement("SELECT distinct showTime" + " from movieTheaters" + " WHERE movieName=? AND movieTheatersName=?" + " order by showTime");
			stmt.setString(1, (String) session.getAttribute("movieName"));
			stmt.setString(2, request.getParameter("movieTheatersName"));
			ArrayList<String> movieShowTime = new ArrayList<String>();
			rs = stmt.executeQuery();
		while(rs.next()) {
			movieShowTime.add(rs.getString("showTime")
					);
		}
		
		session.setAttribute("movieTheatersName", request.getParameter("movieTheatersName"));
		session.setAttribute("movieTheatersNameId", request.getParameter("movieTheatersNameId"));
		session.setAttribute("movieShowTimeId", "0");
		session.setAttribute("movieShowTimes", movieShowTime);
		session.setAttribute("movieShowDays", "0");
		response.sendRedirect("Reservation");
		
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
	}

}
