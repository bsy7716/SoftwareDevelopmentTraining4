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
import vo.Review;

  
@WebServlet("/reviewwrite")
public class ReviewWrite extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher rd = request.getRequestDispatcher("/ReviewWrite.jsp");
    rd.forward(request, response);
  }

  @Override
  public void doPost(
      HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      ReviewDAO reviewDAO = (ReviewDAO)sc.getAttribute("reviewDAO");
      
      reviewDAO.register(new Review()
    		  .setID(request.getParameter("ID"))
    		  .setReviewType(request.getParameter("ReviewType"))
    		  .setMovieName(request.getParameter("MovieName"))
    		  .setReviewTitle(request.getParameter("ReviewTitle"))
    		  .setReviewContent(request.getParameter("ReviewContent"))
    		  .setMovieScore(request.getParameter("MovieScore"))
        );

      response.sendRedirect("review");

    } catch (Exception e) {
    	throw new ServletException(e);
    }
  }
}