package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QaDao;
import dto.QaDto;

public class QAUpdateAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String type = request.getParameter("type");
		String open = request.getParameter("openyn");
		String title = request.getParameter("title");
		String content = request.getParameter("textwrite");
		String writer = request.getParameter("writer");
		QaDao qdao = new QaDao();
		try {
			qdao.qacor(new QaDto(bno,type,title,content,null,open));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("bno", bno);
		request.setAttribute("open", open);
		request.setAttribute("writer", writer);
		
		request.getRequestDispatcher("FcController?command=QADetail").forward(request, response);
	}

}
