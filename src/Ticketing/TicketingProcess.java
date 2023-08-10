package Ticketing;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class TicketingProcess implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TicketingDao tDao = new TicketingDao();
		String clickArr = request.getParameter("data");
		System.out.println(clickArr);
		JSONParser parser = new JSONParser();
		JSONArray clickJSON = new JSONArray();
		ArrayList<TicketingDto> ticketingArr = null;
		int bno = 0;
		try {
			clickJSON = (JSONArray)parser.parse(clickArr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(clickJSON);
		try {
			ticketingArr = tDao.getTicketDto(clickJSON);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			bno = tDao.insertTicketingInfo(ticketingArr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("완료");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(bno);
	}

}
