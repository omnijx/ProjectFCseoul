package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopMainDao;
import dto.EShopMainDto;

public class EShopMainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		EShopMainDao newPrdDao = new EShopMainDao();
		EShopMainDao recommendPrdDao = new EShopMainDao();
		EShopMainDao bestUniPrdDao = new EShopMainDao();
		ArrayList<EShopMainDto> newPrdDto = newPrdDao.EShopMainPrd("new");
		ArrayList<EShopMainDto> recommendPrdDto = recommendPrdDao.EShopMainPrd("recommend");
		ArrayList<EShopMainDto> bestUniPrdDto = recommendPrdDao.EShopMainBestPrd("유니폼");
		ArrayList<EShopMainDto> bestTraPrdDto = recommendPrdDao.EShopMainBestPrd("트레이닝웨어");
		ArrayList<EShopMainDto> bestFasPrdDto = recommendPrdDao.EShopMainBestPrd("패션");
		ArrayList<EShopMainDto> bestChePrdDto = recommendPrdDao.EShopMainBestPrd("응원용품");
		ArrayList<EShopMainDto> bestSouPrdDto = recommendPrdDao.EShopMainBestPrd("기념품");
		ArrayList<EShopMainDto> bestChiPrdDto = recommendPrdDao.EShopMainBestPrd("어린이");
		
		request.setAttribute("id", id);
		request.setAttribute("newPrdDto", newPrdDto);
		request.setAttribute("recommendPrdDto", recommendPrdDto);
		request.setAttribute("bestUniPrdDto", bestUniPrdDto);
		request.setAttribute("bestTraPrdDto", bestTraPrdDto);
		request.setAttribute("bestFasPrdDto", bestFasPrdDto);
		request.setAttribute("bestChePrdDto", bestChePrdDto);
		request.setAttribute("bestSouPrdDto", bestSouPrdDto);
		request.setAttribute("bestChiPrdDto", bestChiPrdDto);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopMain.jsp");
		rd.forward(request, response);
	}

}
