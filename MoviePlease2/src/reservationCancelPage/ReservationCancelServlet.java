package reservationCancelPage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReservationCancleServlet
 */
@WebServlet("/ReservationCancelServlet")
public class ReservationCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCancelServlet() {
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
		System.out.println(request.getParameter("ticketNumber"));
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		
		
		
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC",
					"study",
					"study");
			stmt = conn.prepareStatement("DELETE FROM reservationList"+" WHERE ticketNumber=?");
			
			stmt.setString(1, request.getParameter("ticketNumber"));
			
			stmt.executeUpdate();
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
		 try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
		
		response.sendRedirect("ReservationCancel");
	}

}
