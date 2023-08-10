package Ticketing;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TicketingP1 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TicketingDao tDao = new TicketingDao();
		ArrayList<homeMatchDto> MatchList = null;
		try {
			MatchList = tDao.getMatchDto();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		attribute은 object 타입이다.
		request.setAttribute("MatchList", MatchList);
		RequestDispatcher rd = request.getRequestDispatcher("TicketingEx1.jsp");
		rd.forward(request, response);
	}
}
