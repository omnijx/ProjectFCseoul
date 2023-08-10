package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainNewsDao;
import dao.MainNoticeDao;
import dao.MainPhotoDao;
import dao.MaingoodsDao;
import dao.MatchInfoDao;
import dao.PhotoDAO;
import dao.RankDao;
import dto.GoodsDto;
import dto.MainNewsDto;
import dto.MainNoticeDto;
import dto.MainPhotoDto;
import dto.MatchDBDto;
import dto.PhotoDTO;
import dto.RankDto;

public class PhotoDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int pageNum = 0;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum == 0){
				pageNum = 1;
			}
		} catch(NumberFormatException e){
			pageNum = 1;
		}
		String category ="";
		String searchValue = "";
		String searchType = "";
		int endNum = pageNum * 15;
		int startNum = endNum - 14;
		try{
			category = request.getParameter("category");
			searchValue = request.getParameter("searchValue");
			searchType = request.getParameter("searchType");
			if(category == null){
				category = "all";
			} 
		} catch(Exception e){
			e.printStackTrace();
		}
		PhotoDAO pDao = new PhotoDAO();
		ArrayList<PhotoDTO> photoList = pDao.photoSelect(category, searchValue, startNum, endNum);
		PhotoDTO pCount = pDao.photoCount(category, searchValue);
		PhotoDTO pDetail = pDao.PhotoDetail(bno, startNum, endNum);
		int count = pCount.getCount();
		
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
		request.setAttribute("photoList", photoList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("title", pDetail.getTitle());
		request.setAttribute("r_date", pDetail.getR_date());
		request.setAttribute("image", pDetail.getImage());
		request.setAttribute("bno", pDetail.getBno());
		
		
		RequestDispatcher rd = request.getRequestDispatcher("PhotoDetail.jsp");
		rd.forward(request, response);
	}

}
