package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.MainPhotoDao;
import dto.MainPhotoDto;

/**
 * Servlet implementation class PhotoServlet
 */
@WebServlet("/PhotoServlet")
public class PhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		MainPhotoDao pdao = new MainPhotoDao();
		ArrayList<MainPhotoDto> phdto = null;
		
		try {
			phdto = pdao.getPhotoselec(pageNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		for(MainPhotoDto dto: phdto) {
			JSONObject obj = new JSONObject();
			obj.put("bno", dto.getBno());
			obj.put("round",dto.getRound());
			obj.put("title", dto.getTitle());
			obj.put("r_date",dto.getR_date());
			obj.put("image", dto.getImage());
			obj.put("league", dto.getLeague());
			obj.put("category", dto.getCategory());
			array.add(obj);
		}
		 
		out.println(array);
		
		
	}

	

}
