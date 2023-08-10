package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopDetailDao;
import dto.EShopDetailDto;

public class EShopDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		int goodsId = 0;
		int pageNum = 0;
		try{
			goodsId = Integer.parseInt(request.getParameter("goodsId"));
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum <= 0) {
				pageNum = 1;
			}
		} catch(Exception e) {
			pageNum = 1;
		}
		int endNum = pageNum * 4;
		int startNum = endNum - 3;
		int count = 0;
		
		EShopDetailDao goodsDetailDao = new EShopDetailDao();
		EShopDetailDto goodsDetail = goodsDetailDao.goodsDetail(goodsId);
		ArrayList<EShopDetailDto> sizeInvenList = goodsDetailDao.goodsSizeInventory(goodsId);
		ArrayList<EShopDetailDto> goodsQRList = goodsDetailDao.goodsQAReview(goodsId, startNum, endNum);
		count = goodsDetailDao.count(goodsId);
		
		request.setAttribute("goodsDetail", goodsDetail);
		request.setAttribute("sizeInvenList", sizeInvenList);
		request.setAttribute("goodsQRList", goodsQRList);
		request.setAttribute("count", count);
		request.setAttribute("goodsId", goodsId);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopDetail.jsp");
		rd.forward(request, response);
	}

}
