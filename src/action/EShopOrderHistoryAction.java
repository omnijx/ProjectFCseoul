package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopOrderHistoryDao;
import dto.EShopOrderHistoryDto;

public class EShopOrderHistoryAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		
		EShopOrderHistoryDao OHDao = new EShopOrderHistoryDao();
		ArrayList<EShopOrderHistoryDto> OHList = OHDao.orderHistory(id);
		
		request.setAttribute("id", id);
		request.setAttribute("OHList", OHList);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopOrderHistory.jsp");
		rd.forward(request, response);
		
	}

}
