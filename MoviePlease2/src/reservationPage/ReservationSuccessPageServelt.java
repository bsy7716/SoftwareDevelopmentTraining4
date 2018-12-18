package reservationPage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

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
 * Servlet implementation class ReservationSuccessPageServelt
 */
@WebServlet("/ReservationSuccess")
public class ReservationSuccessPageServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSuccessPageServelt() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("members");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String showRoom = "";
		int number = 0;
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", 
					"study",	
					"study");	
			stmt = conn.prepareStatement("SELECT movieShowRoom FROM movietheaters" + " WHERE movieName=? AND movieTheatersName=? AND showTime=? AND showDay=?");
			
			stmt.setString(1, (String)session.getAttribute("movieName"));
			stmt.setString(2, (String)session.getAttribute("movieTheatersName"));
			stmt.setString(3, (String)session.getAttribute("movieShowTime"));
			stmt.setString(4, (String)session.getAttribute("selectDate"));
			rs = stmt.executeQuery();
		
			if(rs.next()) {
				showRoom = rs.getString("movieShowRoom");
				session.setAttribute("movieShowRoom",showRoom);
			}
			
		} catch(Exception e) {
			throw new ServletException(e);
		}  finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
		
		
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", //JDBC URL
					"study",	// DBMS 사용자 아이디
					"study");	// DBMS 사용자 암호
			stmt = conn.prepareStatement("SELECT Number FROM movietheaters" + " WHERE movieName=? AND movieTheatersName=? AND movieShowRoom=? AND showTime=? AND showDay=?");
			
			stmt.setString(1, (String)session.getAttribute("movieName"));
			stmt.setString(2, (String)session.getAttribute("movieTheatersName"));
			stmt.setString(3, (String)session.getAttribute("movieShowRoom"));
			stmt.setString(4, (String)session.getAttribute("movieShowTime"));
			stmt.setString(5, (String)session.getAttribute("selectDate"));
			rs = stmt.executeQuery();
		
			if(rs.next()) {
				number = rs.getInt("Number");
			}
			
		} catch(Exception e) {
			throw new ServletException(e);
		}  finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
		
		
		
		
		
		Calendar oCalendar = Calendar.getInstance();
		String ticketNumber = (request.getParameter("selectSeat")).replaceAll("[0-9]", "")
				+ oCalendar.get(Calendar.YEAR) + (oCalendar.get(Calendar.MONTH)+1) + oCalendar.get(Calendar.DATE) +
				number + (request.getParameter("selectSeat")).replaceAll("[^0-9]", "");
		
		
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC", //JDBC URL
					"study",	// DBMS 사용자 아이디
					"study");	// DBMS 사용자 암호
			stmt = conn.prepareStatement("INSERT INTO reservationList(userId,userName,movieName,showDay,showTime,movieTheatersName,showRoom,seat,price,ticketNumber)"
					+ "VALUES (?,?,?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, loginMember.getUserId());
			stmt.setString(2, loginMember.getUserName());
			stmt.setString(3, (String)session.getAttribute("movieName"));
			stmt.setString(4, (String)session.getAttribute("selectDate"));
			stmt.setString(5, (String)session.getAttribute("movieShowTime"));
			stmt.setString(6, (String)session.getAttribute("movieTheatersName"));
			stmt.setString(7, showRoom);
			stmt.setString(8, request.getParameter("selectSeat"));
			stmt.setString(9, request.getParameter("price"));
			stmt.setString(10, ticketNumber);
			
			stmt.executeUpdate();
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
		 try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
		
		session.setAttribute("selectSeat", request.getParameter("selectSeat"));
		session.setAttribute("price", request.getParameter("price"));
		session.setAttribute("ticketNumber", ticketNumber);
		
		RequestDispatcher rd = request.getRequestDispatcher("ReservationSuccess.jsp");
		rd.forward(request, response);
	}

}
