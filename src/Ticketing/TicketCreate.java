package Ticketing;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TicketCreate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("create 도착!!");
		int s1 = Integer.parseInt(request.getParameter("s1"));
		int s2 = Integer.parseInt(request.getParameter("s2"));
		int s3 = Integer.parseInt(request.getParameter("s3"));
		int ticketingbno = Integer.parseInt(request.getParameter("ticketingbno"));
		String stadium = request.getParameter("stadium");
		String m_date = request.getParameter("m_date");
		String id = request.getParameter("id");
		TicketingDao Tdao = new TicketingDao();
		try {
			Tdao.TicketCreate(id, stadium, m_date, s1, s2, s3, ticketingbno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("s1", s1);
		request.setAttribute("s2", s2);
		request.setAttribute("s3", s3);
		RequestDispatcher rd = request.getRequestDispatcher("TicketBuy.jsp");
		rd.forward(request, response);
	}

}
