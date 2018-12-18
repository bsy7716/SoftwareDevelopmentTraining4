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

import servlet.InquiryDAO;
import vo.Inquiry;

// ServletContext에 보관된 InquiryDAO 사용하기   
@SuppressWarnings("serial")
@WebServlet("/update")
public class InquiryUpdate extends HttpServlet {
  @Override
  protected void doGet(
      HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      InquiryDAO inquiryDAO = (InquiryDAO)sc.getAttribute("inquiryDAO");

      Inquiry inquiry = inquiryDAO.selectOne(Integer.parseInt(request.getParameter("InquiryNo")));

      request.setAttribute("inquiry", inquiry);

      RequestDispatcher rd = request.getRequestDispatcher("/InquiryUpdate.jsp");
      rd.forward(request, response);

    } catch (Exception e) {
    	throw new ServletException(e);
    }
  }

  @Override
  protected void doPost(
      HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      InquiryDAO inquiryDAO = (InquiryDAO) sc.getAttribute("inquiryDAO");  
      
      inquiryDAO.update(new Inquiry()
      .setInquiryNo(Integer.parseInt(request.getParameter("InquiryNo")))
      .setInquiryTitle(request.getParameter("InquiryTitle"))
      .setUserName(request.getParameter("UserName"))
      .setUserEmail(request.getParameter("UserEmail"))
      .setInquiryContent(request.getParameter("InquiryContent"))
      );

      response.sendRedirect("inquiry");

    } catch (Exception e) {
    	throw new ServletException(e);
    }
  }
}