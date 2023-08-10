package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;
import user.UserDTO;

public class MemberPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pass = request.getParameter("pass");
		
		UserDAO dao = new UserDAO();
		int ref = dao.passCheck(id, pass);
		UserDTO dto = dao.select(id);
		
		if(ref == 1) {
			request.setAttribute("id", dto.getId());
			request.setAttribute("pass", dto.getPass());
			request.setAttribute("nick_name", dto.getNick_name());
			request.setAttribute("name", dto.getName());
			request.setAttribute("birth", dto.getBirth());
			request.setAttribute("gender", dto.getGender());
			request.setAttribute("email", dto.getEmail());
			request.setAttribute("phone", dto.getPhone());
			request.setAttribute("postal_code", dto.getPostal_code());
			request.setAttribute("address", dto.getAddress());
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("FcController?command=updatePage").forward(request, response);
		} else {
			request.setAttribute("UpdateErrMsg", "<script>alert('비밀번호를 잘못 입력하셨습니다 .')</script>");
			request.getRequestDispatcher("FcController?command=memberCheck").forward(request, response);
		}

	}

}
