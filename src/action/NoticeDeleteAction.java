package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;

public class NoticeDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NoticeDAO nDao = new NoticeDAO();
		boolean nDto = nDao.noticeDelete(bno);
		
		request.setAttribute("deleteMSG", "<script>alert('삭제 되었습니다.')</script>");
		
		RequestDispatcher rd = request.getRequestDispatcher("FcController?command=notice");
		rd.forward(request, response);

	}

}
