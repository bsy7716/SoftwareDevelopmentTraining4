package memberJoin;

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

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/MemberJoinServlet")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
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

		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			ServletContext sc = this.getServletContext();
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC",
					"study",	
					"study");	
			stmt = conn.prepareStatement("INSERT INTO MEMBERS(userId,userPassword,userName,userSex,userBirthday,userAddress,userPhoneNumber,userEmail)"
					+ "VALUES (?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, request.getParameter("userId"));
			stmt.setString(2, request.getParameter("userPassword"));
			stmt.setString(3, request.getParameter("userName"));
			
			if(request.getParameter("man")==null)
				stmt.setString(4,"woman");
			else
				stmt.setString(4,"man");
			
			stmt.setInt(5, Integer.parseInt(""+request.getParameter("userYear")+request.getParameter("userMonth")+request.getParameter("userDay")));
			stmt.setString(6, request.getParameter("userAddress"));
			stmt.setInt(7, Integer.parseInt(""+request.getParameter("userFirstPhoneNumber")+request.getParameter("userSecondPhoneNumber")+request.getParameter("userThirdPhoneNumber")));
			stmt.setString(8, request.getParameter("userEmail"));
			stmt.executeUpdate();
		
		} catch(Exception e) {
			throw new ServletException(e);
		} finally {
		 try {if(stmt!=null) stmt.close();}catch(Exception e) {}
		try {if(conn!=null) conn.close();}catch(Exception e) {}
		}
		RequestDispatcher rd = request.getRequestDispatcher("/MemberJoinSuccess.jsp");
		rd.forward(request, response);
	}

}
