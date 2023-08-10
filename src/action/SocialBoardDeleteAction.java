package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SocialBoardUpdateDao;

public class SocialBoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		SocialBoardUpdateDao sbUpdateDao = new SocialBoardUpdateDao();
		boolean socialDelete = false;
		socialDelete = sbUpdateDao.socialDelete(bno);
		
		request.getRequestDispatcher("FcController?command=socialBoard").forward(request, response);
	}

}
