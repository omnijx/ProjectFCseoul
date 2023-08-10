package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;

public class NoticeUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDAO nDao = new NoticeDAO();
		boolean nDto = nDao.noticeUpdateAction(bno, title, content);
		
		request.setAttribute("updateMSG", "<script>alert('수정되었습니다.')</script>");
		
		RequestDispatcher rd = request.getRequestDispatcher("FcController?command=noticeDetail&bno="+bno);
		rd.forward(request, response);
		
		
	}

}
