package Ticketing;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TicketingPage4Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s1 = Integer.parseInt(request.getParameter("s1"));
		int s2 = Integer.parseInt(request.getParameter("s2"));
		int s3 = Integer.parseInt(request.getParameter("s3"));
		request.setAttribute("s1", s1);
		request.setAttribute("s2", s2);
		request.setAttribute("s3", s3);
		RequestDispatcher rd = request.getRequestDispatcher("TicketBuy.jsp");
		rd.forward(request, response);
	}

}
