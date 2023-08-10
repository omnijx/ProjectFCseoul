package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;

public class NoticeWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDAO nDao = new NoticeDAO();
		Boolean nDto = nDao.noticeWrite(title, content);
		
		request.setAttribute("writeMSG", "<script>alert('글이 작성되었습니다 !')</script>");
		
		RequestDispatcher rd = request.getRequestDispatcher("FcController?command=notice");
		rd.forward(request, response);
		
		
	}

}
