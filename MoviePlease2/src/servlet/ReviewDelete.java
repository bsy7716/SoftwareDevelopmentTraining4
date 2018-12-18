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

import servlet.ReviewDAO;

// ServletContext에 보관된 InquiryDAO 사용하기  
@WebServlet("/reviewdelete")
public class ReviewDelete extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  public void doGet(
      HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      ReviewDAO reviewDAO = (ReviewDAO)sc.getAttribute("reviewDAO");
         
      reviewDAO.delete(Integer.parseInt(request.getParameter("ReviewNo")));

      response.sendRedirect("review");

    } catch (Exception e) {
    	throw new ServletException(e);

    }
  }
}

