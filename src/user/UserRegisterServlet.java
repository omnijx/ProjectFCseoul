package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String nick_name = request.getParameter("nick_name");
		String birth = request.getParameter("birth");
		String postal_code = request.getParameter("postal_code");
		String phone_owner = request.getParameter("phone_owner");
		String sns_receive = request.getParameter("sns_receive");
		String email_receive = request.getParameter("email_receive");
		String gender = request.getParameter("gender");
		if(id == null || id.equals("") || pw == null || pw.equals("") || pw2 == null || pw2.equals("") ||
			name == null || name.equals("") || email == null || email.equals("") || phone == null || phone.equals("") ||
			address == null || address.equals("") || nick_name == null || nick_name.equals("") || birth == null || birth.equals("") ||
			postal_code == null || postal_code.equals("") || phone_owner == null || phone_owner.equals("") || sns_receive == null || sns_receive.equals("") ||
			email_receive == null || email_receive.equals("") || gender == null || gender.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("join3.jsp");
			return;
		}
		int result = new UserDAO().register(id, pw, name, email, phone, address, nick_name, birth, postal_code, phone_owner, sns_receive, email_receive, gender);
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공메시지");
			request.getSession().setAttribute("messageContent", "회원가입 성공");
			response.sendRedirect("join3.jsp");
			return;
		}
		else {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "오류");
			response.sendRedirect("join3.jsp");
			return;
		}
	}
}
