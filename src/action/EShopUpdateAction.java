package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopUpdateActionDao;
import dto.EShopInsertActionDto;

public class EShopUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String goodsId[] = request.getParameterValues("goodsId");
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		String goodsSize[] = request.getParameterValues("goodsSize");
		String btnType = request.getParameter("btnType");
		String prdCheck[] = request.getParameterValues("prdCheck");
		String cartBtn = request.getParameter("cBtn");
		String wishListBtn = request.getParameter("wlBtn");
		String oQty[] = request.getParameterValues("amount");

		
		int idx = 0;
		for(int i=0; i<=goodsId.length-1; i++){
			if(cartBtn.equals("cDup"+i) || cartBtn.equals("cDel"+i)) {
				idx = i;
			}
		}
		
		EShopUpdateActionDao UpdateActDao = new EShopUpdateActionDao();
		EShopInsertActionDto goodsSel = UpdateActDao.goodsSel(goodsId[idx], goodsSize[idx]);
		String goodsImg = goodsSel.getGoodsImg();
		String goodsName = goodsSel.getGoodsName();
		int inventory = goodsSel.getInventory();
		int price = goodsSel.getPrice();
		
		
		boolean bc = false;
		boolean bw = false;
		boolean cartDup = false;
		boolean cartDel = false;
		boolean wishListDelAll = false;
		boolean wishListDelSel = false;
		
		if(btnType.equals("cart")) {
			bc = UpdateActDao.insertCart(id, goodsId[idx], goodsImg, goodsName, goodsSize[idx], inventory, oQty[idx], price);
		} else if(btnType.equals("wishList")) {
			bw = UpdateActDao.insertWishList(id, goodsId[idx]);
		} else if(cartBtn.equals("cDup"+idx)) {
			cartDup = UpdateActDao.cartDuplication(goodsId[idx], goodsSize[idx], oQty[idx], id);
		} else if(cartBtn.equals("cDel"+idx)) {
			cartDel = UpdateActDao.cartDelete(id, goodsId[idx], goodsSize[idx]);
		} else if(wishListBtn.equals("wlDelAll")){
			wishListDelAll = UpdateActDao.wishListDeleteAll(id);
		} else if(wishListBtn.equals("wlDelSel")) {
			for(int i=0; i<=goodsId.length-1; i++) {
				wishListDelSel = UpdateActDao.wishListDeleteSelect(id, goodsId[i]);
			}
		}
		String url = "";
		if(bc || cartDup || cartDel) {
			url = "FcController?command=cart";
		} else if(bw || wishListDelAll || wishListDelSel) {
			url = "FcController?command=wishList";
		}
		
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
