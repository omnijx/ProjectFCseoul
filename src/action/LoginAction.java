package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;
import user.UserDTO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8"); 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO uDao = new UserDAO();
		UserDTO uDto = uDao.loginDAO(id, pw);
		int ref = uDao.secessionCheck(id);
		
		if(ref == 1) {
			request.setAttribute("MemberSecessionMsg", "<script>alert('탈퇴된 회원입니다. .')</script>");
			request.getRequestDispatcher("FcController?command=login").forward(request, response);
		} else if(uDto.getId() != null){
			session.setAttribute("id", uDto.getId());
//			session.setAttribute("name", uDto.getName());
//			session.setAttribute("nick_name", uDto.getNick_name());
//			session.setAttribute("number_of_login", uDto.getNumber_of_login());
			RequestDispatcher rd = request.getRequestDispatcher("FcController?command=fcSeoulMain");
			rd.forward(request, response);
		} else {
			request.setAttribute("LoginErrMsg", "<script>alert('아이디 또는 비밀번호를 잘못 입력하셨습니다 .')</script>");
//			response.sendRedirect("Login.jsp?msg=err"); &msg=err
			request.getRequestDispatcher("FcController?command=login").forward(request, response);
		}

	}

}
