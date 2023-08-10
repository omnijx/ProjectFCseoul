package user;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserPhoneServlet")
public class UserPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String phone = request.getParameter("phoneNumber");
		
		Sms sms = new Sms();
		String otp = sms.sendMobileOTP(phone);
		
		UserDAO dao = new UserDAO();
		dao.SmsOtp(otp, phone);
	}

}
