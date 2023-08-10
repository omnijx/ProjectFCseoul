package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

public class MemberUpdatePageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String pass = request.getParameter("pass");
		String nick_name = request.getParameter("nick_name");
		String phone = request.getParameter("phone");
		String postal_code = request.getParameter("postal_code");
		String address = request.getParameter("address");
		
		UserDAO dao = new UserDAO();
		int ref = dao.update(id, pass, nick_name, phone, postal_code, address);
		
		if(ref == 1) {
			request.getRequestDispatcher("FcController?command=fcmyPage").forward(request, response);
		} 
		

	}

}
