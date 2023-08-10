package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MainNoticeDao;
import dao.MainPhotoDao;
import dao.MaingoodsDao;
import dao.MatchInfoDao;
import dao.MainNewsDao;
import dao.RankDao;
import dao.SocialBoardDao;
import dto.GoodsDto;
import dto.MainNoticeDto;
import dto.MainPhotoDto;
import dto.MatchDBDto;
import dto.MainNewsDto;
import dto.RankDto;
import dto.SocialBoardDto;

public class SocialBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String search = "";
		String searchBtn = "";
		String searchTxt = "";
		int pageNum = 0;
		try{
			search = request.getParameter("search");
			searchBtn = request.getParameter("searchBtn");
			searchTxt = request.getParameter("searchTxt");
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum <= 0) {
				pageNum = 1;
			}
		} catch(NumberFormatException e) {
			pageNum = 1;
			search = "";
			searchBtn = "";
			searchTxt = "";
			pageNum = 1;
		}
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		int count = 0;
		
		SocialBoardDao sbMainDao = new SocialBoardDao();
		ArrayList<SocialBoardDto> sbMainList = new ArrayList<SocialBoardDto>();
		
		MainPhotoDao pdao= new MainPhotoDao();
		ArrayList <MainPhotoDto> pdto = pdao.getPhotoimg();
		MainNewsDao ndao = new MainNewsDao();
		ArrayList <MainNewsDto> ndto = ndao.getNews();
		MainNoticeDao ntdao = new MainNoticeDao();
		ArrayList <MainNoticeDto> ntdto = ntdao.getNotice();
		RankDao radao = new RankDao();
		ArrayList <RankDto> radto = radao.getFcRank();
		
		MatchInfoDao midao = new MatchInfoDao();
		ArrayList<MatchDBDto> prevdto = midao.prevMatch();
		ArrayList<MatchDBDto> nextdto = midao.nextMatch();
		ArrayList<MatchDBDto> nextnextdto = midao.nextnextMatch();
		
		MaingoodsDao mgdao = new MaingoodsDao();
		ArrayList<GoodsDto> goodsdto = mgdao.getbannergoods();
		ArrayList<GoodsDto> goodsdto2 = mgdao.getbannergoods2();
		ArrayList<GoodsDto> goodsdto3 = mgdao.getbannergoods3();
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("ndto", ndto);
		request.setAttribute("ntdto", ntdto);
		request.setAttribute("radto", radto);
		request.setAttribute("prevdto", prevdto);
		request.setAttribute("nextdto", nextdto);
		request.setAttribute("nextnextdto", nextnextdto);
		request.setAttribute("goodsdto", goodsdto);
		request.setAttribute("goodsdto2", goodsdto2);
		request.setAttribute("goodsdto3", goodsdto3);
		
		if(searchBtn.equals("검색") && search.equals("all")) {
			sbMainList = sbMainDao.socialSearchAll(searchTxt, startNum, endNum);
			count = sbMainDao.socialSearchCount(searchTxt, search);
		} else if(searchBtn.equals("검색") && search.equals("title")) {
			sbMainList = sbMainDao.socialSearchTitle(searchTxt, startNum, endNum);
			count = sbMainDao.socialSearchCount(searchTxt, search);
		} else if(searchBtn.equals("검색") && search.equals("content")) {
			sbMainList = sbMainDao.socialSearchContent(searchTxt, startNum, endNum);
			count = sbMainDao.socialSearchCount(searchTxt, search);
		} else if(searchBtn.equals("검색") && search.equals("name")) {
			sbMainList = sbMainDao.socialSearchName(searchTxt, startNum, endNum);
			count = sbMainDao.socialSearchCount(searchTxt, search);
		} else {
			sbMainList = sbMainDao.socialBoardSelect(startNum, endNum);
			count = sbMainDao.socialCount();
		}
		
		request.setAttribute("id", id);
		request.setAttribute("sbMainList", sbMainList);
		request.setAttribute("count", count);
		request.setAttribute("page", pageNum);
		
		RequestDispatcher rd = request.getRequestDispatcher("SocialBoard.jsp");
		rd.forward(request, response);
	}

}
