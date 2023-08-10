package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopBuyDao;
import dto.EShopBuyDto;

public class EShopBuyAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		String[] goodsId = request.getParameterValues("goodsId");
		String[] goodsSize = request.getParameterValues("goodsSize");
		String[] oQty = request.getParameterValues("amount");
		String[] checked = request.getParameterValues("checked");
		String cBtn = request.getParameter("cBtn");
		if(cBtn.equals("buySel")) {
			String[] goodsId2 = new String[checked.length];
			String[] goodsSize2 = new String[checked.length];
			String[] oQty2 = new String[checked.length];
			for(int i=0; i<=goodsId.length-1; i++) {
				for(int j=0; j<=checked.length-1; j++) {
					if(checked[j].charAt(0)-48 == i) {
						goodsId2[j] = goodsId[i];
						goodsSize2[j] = goodsSize[i];
						oQty2[j] = oQty[i];
					}
				}
			}
			goodsId = goodsId2;
			goodsSize = goodsSize2;
			oQty = oQty2;
		}
		
		EShopBuyDao EShopBuyDao = new EShopBuyDao();
		EShopBuyDto buyInfoDto = EShopBuyDao.buyInfo(id);
		
		request.setAttribute("id", id);
		request.setAttribute("goodsId", goodsId);
		request.setAttribute("goodsSize", goodsSize);
		request.setAttribute("oQty", oQty);
		request.setAttribute("buyInfoDto", buyInfoDto);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopBuy.jsp");
		rd.forward(request, response);
		
	}
	
}
