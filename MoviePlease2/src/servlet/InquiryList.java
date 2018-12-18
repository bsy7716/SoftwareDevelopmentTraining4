package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Inquiry;

@WebServlet("/inquiry")
public class InquiryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		if(session.getAttribute("members")!=null)
		{
			try {
				ServletContext sc = this.getServletContext();
				
				InquiryDAO inquiryDAO = (InquiryDAO)sc.getAttribute("inquiryDAO");
				
				request.setAttribute("inquirys", inquiryDAO.selectList());
				response.setContentType("text/html; charset=UTF-8");
				RequestDispatcher rd = request.getRequestDispatcher("/InquiryList.jsp");
				rd.include(request, response);
			}
			catch(Exception e){
				throw new ServletException(e);
			}
		}
		else
		{
			response.sendRedirect("Login");
		}
	
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

    public InquiryList() {
        super();
        // TODO Auto-generated constructor stub
    }
}