package user;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserOtpServlet")
public class UserOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json");
		String phone = request.getParameter("phoneNumber");
		String otp = request.getParameter("otp");
		
		UserDAO dao = new UserDAO();
		int CkeckOtp = dao.OtpCheck(phone, otp);
		
		 String jsonData = "";
		if(CkeckOtp == 1) {
			jsonData = "{\"result\": \"failure\", \"message\": \"인증번호가 틀렸습니다.\"}";		
		}else {
			jsonData = "{\"result\": \"success\", \"message\": \"인증이 완료되었습니다.\"}";		}
		response.getWriter().write(jsonData);
	}

}
