package recordRankAPI;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import matchInfoAPI.MatchInfoDAO2;

@WebServlet("/rankingScoreServlet")
public class rankingScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("recordRankServlt doPost 메소드가 실행되었습니다.");
	    request.setCharacterEncoding("UTF-8");
		String data = request.getParameter("data");
		RankingScoreDAO RRDAO = new RankingScoreDAO();
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONArray jSONArray = (JSONArray) obj;
		try {
			RRDAO.jsonRecordScore(jSONArray);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
