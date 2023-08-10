package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QaDao;
import dto.QaDto;

public class QAWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id  = (String)session.getAttribute("id");
		String type = request.getParameter("type");
		String open = request.getParameter("openyn");
		String title = request.getParameter("title");
		String content = request.getParameter("textwrite");
		
		QaDao qdao = new QaDao();
		QaDto qdto = new QaDto( 0,  type,  title,  content,  id,  null,  open, null,  null);
		try {
			qdao.insertQa(qdto, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("FcController?command=QA").forward(request, response);
				
	}
	
}
