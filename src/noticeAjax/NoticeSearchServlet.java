package noticeAjax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NoticeSearchServlet")
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String searchValue = request.getParameter("searchValue");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		response.getWriter().write(getJSON(searchValue, pageNum));
	}
	
	public String getJSON(String searchValue, int pageNum) {
		if(searchValue == null) searchValue = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		NoticeDAO noticeDAO = new NoticeDAO();
		ArrayList<Notice> noticeList = noticeDAO.search(searchValue, pageNum);
		for(int i=0; i<noticeList.size(); i++) {
			result.append("[{\"value\": \"" + noticeList.get(i).getBno() + "\"},");
			result.append("{\"value\": \"" + noticeList.get(i).getTitle() + "\"},");
			result.append("{\"value\": \"" + noticeList.get(i).getDate() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}

}
