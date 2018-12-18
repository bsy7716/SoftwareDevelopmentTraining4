package servlet;

import java.io.IOException;

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

// ServletContext에 보관된 InquiryDAO 사용하기  
@WebServlet("/delete")
public class InquiryDelete extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  public void doGet(
      HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      InquiryDAO inquiryDAO = (InquiryDAO)sc.getAttribute("inquiryDAO");
         
      inquiryDAO.delete(Integer.parseInt(request.getParameter("InquiryNo")));

      response.sendRedirect("inquiry");

    } catch (Exception e) {
    	throw new ServletException(e);

    }
  }
}

