package Ticketing;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TicketingPage3Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object delete = (Object)(request.getParameter("delete"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		request.setAttribute("bno", bno);
		RequestDispatcher rd = request.getRequestDispatcher("TicketPrice.jsp");
		rd.forward(request, response);

	}

}
