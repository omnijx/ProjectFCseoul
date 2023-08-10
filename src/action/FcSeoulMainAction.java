package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MaingoodsDao;
import dao.MatchInfoDao;
import dao.MainNewsDao;
import dao.MainNoticeDao;
import dao.MainPhotoDao;
import dao.RankDao;
import dto.GoodsDto;
import dto.MatchDBDto;
import dto.MainNewsDto;
import dto.MainNoticeDto;
import dto.MainPhotoDto;
import dto.RankDto;

public class FcSeoulMainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		MainPhotoDao pdao= new MainPhotoDao();
		ArrayList <MainPhotoDto> pdto = pdao.getPhotoimg();
		ArrayList<MainPhotoDto> phdto = pdao.getPhotoselec(1);
		MainNewsDao ndao = new MainNewsDao();
		ArrayList <MainNewsDto> ndto = ndao.getNews();
		MainNoticeDao ntdao = new MainNoticeDao();
		ArrayList <MainNoticeDto> ntdto = ntdao.getNotice();
		RankDao radao = new RankDao();
		ArrayList <RankDto> radto = radao.getFcRank();
		ArrayList <RankDto> aradto = radao.getAllRank();
		
		MatchInfoDao midao = new MatchInfoDao();
		ArrayList<MatchDBDto> prevdto = midao.prevMatch();
		ArrayList<MatchDBDto> nextdto = midao.nextMatch();
		ArrayList<MatchDBDto> nextnextdto = midao.nextnextMatch();
		
		MaingoodsDao mgdao = new MaingoodsDao();
		ArrayList<GoodsDto> gdto = mgdao.getgoods();
		ArrayList<GoodsDto> goodsdto = mgdao.getbannergoods();
		ArrayList<GoodsDto> goodsdto2 = mgdao.getbannergoods2();
		ArrayList<GoodsDto> goodsdto3 = mgdao.getbannergoods3();
		ArrayList<GoodsDto> goodsrcdto = mgdao.getrecomand();
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("phdto", phdto);
		request.setAttribute("ndto", ndto);
		request.setAttribute("ntdto", ntdto);
		request.setAttribute("radto", radto);
		request.setAttribute("aradto", aradto);
		request.setAttribute("prevdto", prevdto);
		request.setAttribute("nextdto", nextdto);
		request.setAttribute("nextnextdto", nextnextdto);
		request.setAttribute("gdto", gdto);
		request.setAttribute("goodsdto", goodsdto);
		request.setAttribute("goodsdto2", goodsdto2);
		request.setAttribute("goodsdto3", goodsdto3);
		request.setAttribute("goodsrcdto", goodsrcdto);
		
		request.getRequestDispatcher("main.jsp").forward(request, response);
		
		
	}

}
