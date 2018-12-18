package reservationPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ResetReservationSessionServlet
 */
@WebServlet("/ResetReservationSessionServlet")
public class ResetReservationSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetReservationSessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("members")!=null)
		{
			session.setAttribute("movieTheatersNames", "0");
			session.setAttribute("movieShowTimes", "0");
			session.setAttribute("movieShowDays", "0");
			session.setAttribute("movieShowRoom","0");
			
			session.setAttribute("movieNameId", "0");
			session.setAttribute("movieTheatersNameId","0");
			session.setAttribute("movieShowTimeId","0");
			
			response.sendRedirect("Reservation");
		}
		else
		{
			response.sendRedirect("Login");
		}
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
