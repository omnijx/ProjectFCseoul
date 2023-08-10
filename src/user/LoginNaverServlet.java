package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@WebServlet("/loginNaverServlet")
public class LoginNaverServlet extends HttpServlet {
	private static final long serialVersionID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String token = request.getParameter("token");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		/* int age = Integer.parseInt(request.getParameter("age")); */
		
		UserDAO dao = new UserDAO();
		int LoginN = dao.LoginNaver(token, id, email, nickname, name, gender);
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setName(name);
		dto.setNick_name(nickname);
		if(LoginN == 1) {
			request.getSession().setAttribute("id", dto.getId());
			request.getSession().setAttribute("name", dto.getName());
			request.getSession().setAttribute("nickname", dto.getNick_name());
			response.sendRedirect("FCmain.jsp");
		} else {
			request.setAttribute("LoginErrMsg", "<script>alert('로그인에 실패하였습니다 ')</script>");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
