package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QaDao;
import dto.QaDto;

public class QaAnswerWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String a_content = request.getParameter("textwrite");
		
		QaDao qdao = new QaDao();
		QaDto qdto = new QaDto( bno,  null,  null,  null,  null,  null,  null, null,  a_content);
		try {
			qdao.updateanswer(qdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("FcController?command=QA").forward(request, response);
	}

}
