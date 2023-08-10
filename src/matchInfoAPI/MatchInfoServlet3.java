package matchInfoAPI;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/MatchInfoServlet3")
public class MatchInfoServlet3 extends HttpServlet {
	// 매치 정보 업데이트 서블릿
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("jsonSendServlet doPost 메소드가 실행되었습니다.");
	    request.setCharacterEncoding("UTF-8");
		String data = request.getParameter("data");
		MatchInfoDAO2 MIDa2 = new MatchInfoDAO2();
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONArray jSONArray = (JSONArray) obj;
		try {
			MIDa2.jsonCheck(jSONArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
