package Ticketing;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TicketingP2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TicketingDao TDao = new TicketingDao();
		homeMatchDto MDto = null;
		try {
			MDto = TDao.selectMatchDto();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("MatchInfo", MDto);
		Object sess = (Object) request.getParameter("session");
		HttpSession session = request.getSession();
		if(!(Objects.isNull(sess))) {
			session.removeAttribute("MatchBno");
			session.removeAttribute("adult");
			session.removeAttribute("Teen");
			session.removeAttribute("child");
			session.removeAttribute("Teen");
			session.removeAttribute("ticketArr");
		}
		RequestDispatcher rd = request.getRequestDispatcher("TicketEx2.jsp");
		rd.forward(request, response);
	}

}
