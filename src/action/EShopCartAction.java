package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EShopCartDao;
import dto.EShopCartDto;

public class EShopCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");

		EShopCartDao cartDao = new EShopCartDao();
		ArrayList<EShopCartDto> cartList = cartDao.cart(id);
		
		request.setAttribute("id", id);
		request.setAttribute("cartList", cartList);
		
		RequestDispatcher rd = request.getRequestDispatcher("EShopCart.jsp");
		rd.forward(request, response);
	}

}
