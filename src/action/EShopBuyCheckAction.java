package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopBuyDao;
import dto.EShopBuyDto;

public class EShopBuyCheckAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] goodsId = request.getParameterValues("goodsId");
		String delOption = "";
		String oName = "";
		String oEmail = "";
		String oPhone = "";
		String oPostalNum = "";
		String oAddress = "";
		String req = "";
		String payWay = "";
		String oQty[] = request.getParameterValues("oQty");
		String goodsSize[] = request.getParameterValues("goodsSize");
		String buyBtn = "";
		String bcBtn = "";
		int[] oNum = new int[goodsId.length];
		for(int i=0; i<=oNum.length-1; i++) {
			oNum[i] = (int)((Math.random()*100000)+10000);
		}
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		try{
			delOption = request.getParameter("delOption");
			oName = request.getParameter("oName");
			oEmail = request.getParameter("oEmail");
			oPhone = request.getParameter("oPTel1") + request.getParameter("oPTel2") + request.getParameter("oPTel3");
			oPostalNum = request.getParameter("oPosNum");
			oAddress = request.getParameter("oAddr1") + request.getParameter("oAddr2");
			req = request.getParameter("req");
			payWay = request.getParameter("payWay");
			buyBtn = request.getParameter("buyBtn");
			bcBtn = request.getParameter("BCBtn");
			
		} catch(Exception e) {
			
		}
		
		boolean insertPayment = false;
		EShopBuyDao EShopBuyDao = new EShopBuyDao();
		for(int i=0; i<=goodsId.length-1; i++) {
			insertPayment = EShopBuyDao.insertPayment(id, delOption, oName, oEmail, oPhone, oPostalNum, oAddress, req, payWay, oQty[i], goodsId[i], goodsSize[i], oNum[i]);
		}
		EShopBuyDto buyInfoDto = EShopBuyDao.buyInfo(id);
		EShopBuyDto buyCheckDto = EShopBuyDao.buyCheckSelect(id, goodsId[0], goodsSize[0], oQty[0]);
		EShopBuyDto pgTest = EShopBuyDao.buyPrd(id, goodsId[0], goodsSize[0]);
		int total = 0;
		for(int i=0; i<=goodsId.length-1; i++) {
			EShopBuyDto buyDto = EShopBuyDao.buyPrd(id, goodsId[i], goodsSize[i]);
			total += buyDto.getPrice();
		}
		request.setAttribute("id", id);
		request.setAttribute("buyInfoDto", buyInfoDto);
		request.setAttribute("buyCheckDto", buyCheckDto);
		request.setAttribute("pgTest", pgTest);
		request.setAttribute("total", total);
		request.setAttribute("goodsId", goodsId);
		request.setAttribute("goodsSize", goodsSize);
		request.setAttribute("oQty", oQty);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopBuyCheckP2.jsp");
		rd.forward(request, response);
		
		
	}
	
}
