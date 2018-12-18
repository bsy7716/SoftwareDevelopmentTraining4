package homePage;

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
import javax.servlet.http.HttpSession;

import memberDTO.Member;

/**
 * Servlet implementation class IdPasswordSearchServlet
 */
@WebServlet("/IdPasswordSearchServlet")
public class IdPasswordSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdPasswordSearchServlet() {
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
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		
		if(request.getParameter("id")!=null)
		{
			Member member = new Member();
					
			try {
				ServletContext sc = this.getServletContext();
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", //JDBC URL
						"study",	// DBMS 사용자 아이디
						"study");	// DBMS 사용자 암호
				stmt = conn.prepareStatement("SELECT userPassword FROM MEMBERS"
						+ " WHERE userId=? AND userName=? AND userBirthday=? AND userEmail=?");
				stmt.setString(1, request.getParameter("id"));
				stmt.setString(2, request.getParameter("name"));
				stmt.setInt(3, Integer.parseInt(request.getParameter("birthday")));
				stmt.setString(4, request.getParameter("email"));
				rs = stmt.executeQuery();
			if(rs.next()) {
				member.setUserPassword(rs.getString("userPassword"));

			}
			request.setAttribute("password", member.getUserPassword());
			request.setAttribute("cheak", "passwordCheak");
				RequestDispatcher rd = request.getRequestDispatcher("/IdPasswordSearchSuccess.jsp");
				rd.forward(request, response);
			
			} catch(Exception e) {
				throw new ServletException(e);
			} finally {
				try {if(rs!=null)rs.close();}catch(Exception e) {
			} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			try {if(conn!=null) conn.close();}catch(Exception e) {}
			}
		}
		
		else {
			Member member = new Member();
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", //JDBC URL
					"study",	// DBMS 사용자 아이디
					"study");	// DBMS 사용자 암호
			stmt = conn.prepareStatement("SELECT userId FROM MEMBERS"
					+ " WHERE userName=? AND userBirthday=? AND userEmail=?");
			stmt.setString(1, request.getParameter("name"));
			stmt.setInt(2, Integer.parseInt(request.getParameter("birthday")));
			stmt.setString(3, request.getParameter("email"));
			rs = stmt.executeQuery();
		if(rs.next()) {
			member.setUserId(rs.getString("userId"));
			
		}
		
			request.setAttribute("id", member.getUserId());
			request.setAttribute("cheak", "idCheak");
			RequestDispatcher rd = request.getRequestDispatcher("/IdPasswordSearchSuccess.jsp");
			rd.forward(request, response);
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
		}
	}

}
