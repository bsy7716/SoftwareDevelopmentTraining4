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

import servlet.ReviewDAO;
import vo.Review;

// ServletContext에 보관된 InquiryDAO 사용하기   
@SuppressWarnings("serial")
@WebServlet("/reviewupdate")
public class ReviewUpdate extends HttpServlet {
  @Override
  protected void doGet(
      HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      ReviewDAO reviewDAO = (ReviewDAO)sc.getAttribute("reviewDAO");

      Review review = reviewDAO.selectOne(Integer.parseInt(request.getParameter("ReviewNo")));

      request.setAttribute("review", review);

      RequestDispatcher rd = request.getRequestDispatcher("/ReviewUpdate.jsp");
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
      ReviewDAO reviewDAO = (ReviewDAO) sc.getAttribute("reviewDAO");  
      
      reviewDAO.update(new Review()
      .setReviewNo(Integer.parseInt(request.getParameter("ReviewNo")))
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