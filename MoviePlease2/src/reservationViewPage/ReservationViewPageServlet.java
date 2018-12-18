package reservationViewPage;

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
import reservationListDTO.ReservationList;

/**
 * Servlet implementation class ReservationViewPageServlet
 */
@WebServlet("/ReservationView")
public class ReservationViewPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationViewPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		
		if(session.getAttribute("members")!=null)
		{
			Member loginMember = (Member)session.getAttribute("members");
			
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
				stmt = conn.prepareStatement("SELECT movieName,showDay,showTime,movieTheatersName,showRoom,seat,price,ticketNumber"
						+ " FROM reservationList" + " WHERE userId=?");
				
				stmt.setString(1, loginMember.getUserId());
				rs = stmt.executeQuery();
		
				ArrayList<ReservationList> reservationList = new ArrayList<ReservationList>();
				while(rs.next()) {
					reservationList.add(new ReservationList()
							.setMovieName(rs.getString("movieName"))
							.setShowDay(rs.getString("showDay"))
							.setShowTime(rs.getString("showTime"))
							.setMovieTheatersName(rs.getString("movieTheatersName"))
							.setShowRoom(rs.getString("showRoom"))
							.setSeat(rs.getString("seat"))
							.setPrice(rs.getString("price"))
							.setTicketNumber(rs.getString("ticketNumber"))
							);
					}
				request.setAttribute("reservationLists", reservationList);
			} catch(Exception e) {
				throw new ServletException(e);
			}  finally {
				try {if(rs!=null)rs.close();}catch(Exception e) {
			} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
			try {if(conn!=null) conn.close();}catch(Exception e) {}
			}
			
		
			RequestDispatcher rd = request.getRequestDispatcher("/ReservationView.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("Login");
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
