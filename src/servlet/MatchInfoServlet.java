package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dao.MatchInfoDao;


@WebServlet("/MatchInfoServlet")
public class MatchInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MatchInfoDao mid = new MatchInfoDao();
		System.out.println("옴");
		request.setCharacterEncoding("UTF-8");
        String data = request.getParameter("data");
        JSONParser parser = new JSONParser();
        Object obj = null;
        try {
            obj = parser.parse(data);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        JSONArray jsonArr = (JSONArray) obj;
        try {
            mid.jsonInformation(jsonArr);
        } catch (Exception e) {
            e.printStackTrace();
        }
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
