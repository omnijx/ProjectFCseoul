package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

public class JoinRegisterAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String email1 = request.getParameter("email");
		String email2 = request.getParameter("domain");
		String email3 = request.getParameter("domain2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String nick_name = request.getParameter("nick_name");
		String birth1 = request.getParameter("birth");
		String birth2 = request.getParameter("month");
		String birth3 = request.getParameter("day");
		String postal_code = request.getParameter("postal_code");
		String phone_owner = request.getParameter("phone_owner");
		String email_receive = request.getParameter("email_receive");
		String sms_receive = request.getParameter("sms_receive");
		String gender = request.getParameter("gender");
		String phone = phone1+phone2+phone3;
		String email = email1+"@"+email2+email3;
		String birth = birth1+birth2+birth3;
		String address = address1+address2;
		
		UserDAO uDao = new UserDAO();
		int nDto = uDao.register(pass, id, name, email, phone, address, nick_name, birth, postal_code, phone_owner, sms_receive, email_receive, gender);
		
		request.setAttribute("id", id);
		request.setAttribute("pass", pass);
				
		if(nDto == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("FcController?command=join4");
			rd.forward(request, response);
		} else {
			
		}
				
				
	}

}
