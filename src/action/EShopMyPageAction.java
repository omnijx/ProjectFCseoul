package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopMyPageDao;
import dto.EShopMyPageDto;

public class EShopMyPageAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		EShopMyPageDao myPageOHDto = new EShopMyPageDao();
		ArrayList<EShopMyPageDto> myPageOHList = myPageOHDto.myPageOH(id);
		ArrayList<EShopMyPageDto> myPageWLList = myPageOHDto.myPageWL(id);
		
		request.setAttribute("id", id);
		request.setAttribute("myPageOHList", myPageOHList);
		request.setAttribute("myPageWLList", myPageWLList);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopMyPage.jsp");
		rd.forward(request, response);
	}

}
