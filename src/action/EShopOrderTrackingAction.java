package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopOrderTrackingDao;
import dto.EShopOrderTrackingDto;

public class EShopOrderTrackingAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oNum = 0;
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		try{
			oNum = Integer.parseInt(request.getParameter("oNum"));
		} catch(Exception e) {
			oNum = 0;
		}
		
		EShopOrderTrackingDao orderTrackingDao = new EShopOrderTrackingDao();
		EShopOrderTrackingDto OTDto = orderTrackingDao.orderTracking(oNum, id);
		EShopOrderTrackingDto OIDto = orderTrackingDao.orderInfo(oNum, id);
		
		request.setAttribute("OTDto", OTDto);
		request.setAttribute("OIDto", OIDto);
		request.setAttribute("oNumm", oNum);
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopOrderTracking.jsp");
		rd.forward(request, response);
	}

}
