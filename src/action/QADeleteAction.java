package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QaDao;

public class QADeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("!!!!!!!!!!!!!!!!!!!");
		request.setCharacterEncoding("utf-8"); 
		int bno = Integer.parseInt(request.getParameter("bno"));
		QaDao qdao = new QaDao();
		try {
			qdao.Qadelete(bno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("qdao", qdao);
		RequestDispatcher rd = request.getRequestDispatcher("FcController?command=QA");
		rd.forward(request, response);
	}

}
