package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserRegisterNickCheckServlet")
public class UserRegisterNickCheckServlet extends HttpServlet {
	private static final long serialVersionID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String nick_name = request.getParameter("nick_name");
		response.getWriter().write(new UserDAO().registerNickCheck(nick_name) + "");
	}
}
