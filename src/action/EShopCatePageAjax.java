package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.EShopCatePageDao;
import dto.EShopCatePageDto;

public class EShopCatePageAjax implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		int pageNum = 0;
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
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
		
		int count = 0;
		
		String sel = request.getParameter("select");
		String type = request.getParameter("type");
		String maintxt = request.getParameter("maintxt");
		
		EShopCatePageDao catePageDao = new EShopCatePageDao();
		ArrayList<EShopCatePageDto> prdList = null;
		ArrayList<EShopCatePageDto> prdListBest = catePageDao.EShopCateBestPrd(type, startNum, endNum, maintxt);
		count = catePageDao.catePageCount(type, startNum, endNum, maintxt);
		
		switch(sel) {
		case "ALL" :
			prdList = catePageDao.EShopCateMainPrd(type, startNum, endNum, maintxt);
			break;
		case "LOW" :
			prdList = catePageDao.EShopCateMainPrdLowPrice(type, startNum, endNum, maintxt);
			break;
		case "HIGH" :
			prdList = catePageDao.EShopCateMainPrdHighPrice(type, startNum, endNum, maintxt);
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		for(EShopCatePageDto dto : prdList) {
			JSONObject obj = new JSONObject();
			obj.put("goodsId", dto.getGoodsId());
			obj.put("goodsImg", dto.getGoodsImg());
			obj.put("goodsName", dto.getGoodsName());
			obj.put("price", dto.getPrice());
			obj.put("newP", dto.getNewP());
			obj.put("bestP", dto.getBestP());
			array.add(obj);
		}
//		System.out.println(pageNum);
//		out.println(array);
		request.setAttribute("sel", sel);
		request.setAttribute("type", type);
		request.setAttribute("maintxt", maintxt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("array", array);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopCatePage.jsp");
		rd.forward(request, response);
	}

}
