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
import dao.QaDao;
import dao.RankDao;
import dto.GoodsDto;
import dto.MainNoticeDto;
import dto.MainPhotoDto;
import dto.MatchDBDto;
import dto.MainNewsDto;
import dto.QaDto;
import dto.RankDto;
import user.UserDAO;

public class QAMainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		HttpSession session = request.getSession();
		
		int pageNum =0;
		String searchBtn = "";
		
		try{
			searchBtn = request.getParameter("searchBtn");
			pageNum = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e){
			searchBtn = "";
			pageNum = 1;
		}
		
		
		 String searchKeyword = request.getParameter("search");
		 String selectOption = request.getParameter("selec");
		 String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		UserDAO uDao = new UserDAO();
		user.UserDTO uDto = uDao.loginDAO(id,pw);
		
		QaDao qDao = new QaDao();
		ArrayList<QaDto> qDto = qDao.getQaAll(pageNum, searchKeyword, selectOption);
		
		int cnt = 0;
		if(searchBtn.equals("search")) {
			cnt = qDao.searchcountqa(searchKeyword, selectOption);
		} else {
			cnt = qDao.countqa();
		}
		
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
		request.setAttribute("uDto", uDto);
		request.setAttribute("qDto", qDto);
		request.setAttribute("page", pageNum);
		request.setAttribute("cnt", cnt);
		
		RequestDispatcher rd = request.getRequestDispatcher("Q&A3.jsp");
		rd.forward(request, response);
		
	}

}
