package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopCatePageDao;
import dto.EShopCatePageDto;

public class EShopCatePageAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		String type = request.getParameter("type");
		String maintxt = request.getParameter("maintxt");
		int pageNum = 0;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum <= 0) {
				pageNum = 1;
			}
		} catch(NumberFormatException e) {
			pageNum = 1;
		}
		int endNum = pageNum * 15;
		int startNum = endNum - 14;
		
		EShopCatePageDao catePageDao = new EShopCatePageDao();
		ArrayList<EShopCatePageDto> prdList = catePageDao.EShopCateMainPrd(type, startNum, endNum, maintxt);
		ArrayList<EShopCatePageDto> prdListBest = catePageDao.EShopCateBestPrd(type, startNum, endNum, maintxt);
		int count = catePageDao.catePageCount(type, startNum, endNum, maintxt);
		
		request.setAttribute("id", id);
		request.setAttribute("type", type);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maintxt", maintxt);
		request.setAttribute("prdList", prdList);
		request.setAttribute("prdListBest", prdListBest);
		request.setAttribute("count", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopCatePage.jsp");
		rd.forward(request, response);
	}

}
