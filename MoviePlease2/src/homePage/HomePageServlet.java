package homePage;

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
import javax.servlet.http.HttpSession;

import memberDTO.Member;
import movieDTO.Movie;
import reservationListDTO.ReservationList;

/**
 * Servlet implementation class HomePageServlet
 */
@WebServlet("/Home")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", //JDBC URL
					"study",	// DBMS 사용자 아이디
					"study");	// DBMS 사용자 암호
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
		
		RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
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
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", //JDBC URL
					"study",	// DBMS 사용자 아이디
					"study");	// DBMS 사용자 암호
			stmt = conn.prepareStatement("SELECT userId,userPassword,userName,userSex,userBirthday,userAddress,userPhoneNumber,userEmail FROM MEMBERS"
					+ " WHERE userId=? AND userPassword=?");
			stmt.setString(1, request.getParameter("ID"));
			stmt.setString(2, request.getParameter("PASSWORD"));
			
			rs = stmt.executeQuery();
		if(rs.next()) {
			Member member = new Member()
					.setUserId(rs.getString("userId"))
					.setUserPassword(rs.getString("userPassword"))
					.setUserName(rs.getString("userName"))
					.setUserSex(rs.getString("userSex"))
					.setUserBirthday(rs.getInt("userBirthday"))
					.setUserAddress(rs.getString("userAddress"))
					.setUserPhoneNumber(rs.getInt("userPhoneNumber"))
					.setUserEmail(rs.getString("userEmail"));
			HttpSession session = request.getSession();
			session.setAttribute("members", member);
			
			response.sendRedirect("Home");
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/LoginFail.jsp");
			rd.forward(request, response);
		}
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
	}
}
