package reservationPage;

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

/**
 * Servlet implementation class SelectDateServlet
 */
@WebServlet("/Reservation2")
public class ReservationPage2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPage2Servlet() {
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
			stmt = conn.prepareStatement("SELECT seat" + " from reservationList" + " WHERE movieName=? AND movieTheatersName=? AND showTime=? AND showDay=?");
			stmt.setString(1, (String) session.getAttribute("movieName"));
			stmt.setString(2, (String) session.getAttribute("movieTheatersName"));
			stmt.setString(3, (String) session.getAttribute("movieShowTime"));
			stmt.setString(4, request.getParameter("selectDate"));
			
			ArrayList<String> seatList = new ArrayList<String>();
			rs = stmt.executeQuery();
		while(rs.next()) {
			seatList.add(rs.getString("seat")
					);
		}

		session.setAttribute("seatList", seatList);
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
			try {if(rs!=null)rs.close();}catch(Exception e) {
		} try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}

		session.setAttribute("selectDate",request.getParameter("selectDate"));
		RequestDispatcher rd = request.getRequestDispatcher("/Reservation2.jsp");
		rd.forward(request, response);
	}

}
