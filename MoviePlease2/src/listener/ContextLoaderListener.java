package listener;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;

import javax.servlet.annotation.WebListener;

import servlet.InquiryDAO;
import servlet.ReviewDAO;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
  Connection conn;
  
  @Override
  public void contextInitialized(ServletContextEvent event) {
    try {
      ServletContext sc = event.getServletContext();

      Class.forName(sc.getInitParameter("driver"));
      conn = DriverManager.getConnection(
          sc.getInitParameter("url"),
          sc.getInitParameter("username"),
          sc.getInitParameter("password"));
	  
	  
	  InquiryDAO inquiryDAO = new InquiryDAO();
	  inquiryDAO.setConnection(conn);
	  
	  sc.setAttribute("inquiryDAO", inquiryDAO);
	  
	  ReviewDAO reviewDAO = new ReviewDAO();
	  reviewDAO.setConnection(conn);
	  
	  sc.setAttribute("reviewDAO", reviewDAO);

    } catch(Throwable e) {
      e.printStackTrace();
    }
  }

  @Override
  public void contextDestroyed(ServletContextEvent event) {
    try {
      conn.close();
    } catch (Exception e) {}
  }
}