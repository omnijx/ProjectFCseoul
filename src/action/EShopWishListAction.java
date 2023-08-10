package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopWishListDao;
import dto.EShopWishListDto;

public class EShopWishListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = 0;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum <= 0) {
				pageNum = 1;
			}
		} catch(NumberFormatException e) {
			pageNum = 1;
		}
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		
		EShopWishListDao wishListDao = new EShopWishListDao();
		ArrayList<EShopWishListDto> wishListList = wishListDao.wishList(id, startNum, endNum);
		EShopWishListDto wishListCount = wishListDao.wishListCount(id);
		int count = wishListCount.getCount();
		
		request.setAttribute("id", id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("wishListList", wishListList);
		request.setAttribute("count", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopWishList.jsp");
		rd.forward(request, response);
		
	}

}
