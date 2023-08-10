package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

public class MemberSecessionAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pass = request.getParameter("pass");
		
		UserDAO dao = new UserDAO();
		int ref = dao.passCheck(id, pass);
		
		if(ref == 1) {
			int ref2 = dao.secession(id);
			if(ref2 == 1) {
				request.setAttribute("SecessionMsg", "<script>alert('탈퇴 되었습니다.')</script>");
				request.getRequestDispatcher("FcController?command=logout").forward(request, response);
			}
		} else {
			request.setAttribute("SecessionErrMsg", "<script>alert('비밀번호를 잘못 입력하셨습니다 .')</script>");
			request.getRequestDispatcher("FcController?command=memberCheckSecession").forward(request, response);
		}

	}

}
