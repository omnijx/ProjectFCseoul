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
import dao.SocialBoardUpdateDao;
import dto.GoodsDto;
import dto.MainNoticeDto;
import dto.MainPhotoDto;
import dto.MatchDBDto;
import dto.MainNewsDto;
import dto.RankDto;

public class SocialBoardUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  // 세션값 사용하기 위한 세팅
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writeBtn = request.getParameter("writeBtn");
		String rContent = request.getParameter("rContent");
		String comment = request.getParameter("comment");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int answerNum = Integer.parseInt(request.getParameter("rno"));
		
		int pageNum = 0;
		try{
			pageNum = Integer.parseInt(request.getParameter("page"));
			if(pageNum <= 0) {
				pageNum = 1;
			}
		} catch(NumberFormatException e) {
			pageNum = 1;
		}
		String url = "";
		
		SocialBoardUpdateDao sbUpdateDao = new SocialBoardUpdateDao();
		boolean socialInsert = false;
		boolean socialUpdate = false;
		boolean commentWrite = false;
		boolean nestedComment = false;
		boolean commentChange = false;
		boolean commentDelete = false;
		if(writeBtn.equals("등록")) {
			socialInsert = sbUpdateDao.socialWrite(id, title, content);
		} else if(writeBtn.equals("수정")) {
			socialUpdate = sbUpdateDao.socialUpdate(id, bno, title, content);
		} else if(comment.equals("mainComment")) {
			commentWrite = sbUpdateDao.commentWrite(id, bno, rContent);
		} else if(comment.equals("reComment")) {
			nestedComment = sbUpdateDao.nestedComment(id, bno, rContent, answerNum);
		} else if(comment.equals("updateComment")) {
			commentChange = sbUpdateDao.commentChange(answerNum, rContent);
		} else if(comment.equals("deleteComment")) {
			commentDelete = sbUpdateDao.commentDelete(id, bno, answerNum);
		}
		
		if(socialInsert) {
			url = "FcController?command=socialBoard";
		} else {
			url = "FcController?command=socialBoardDetail";
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
		request.setAttribute("id", id);
		request.setAttribute("page", pageNum);
		request.setAttribute("bno", bno);
		request.setAttribute("rno", answerNum);
		request.setAttribute("rContent", rContent);
		request.setAttribute("comment", comment);
		request.setAttribute("writeBtn", writeBtn);
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
