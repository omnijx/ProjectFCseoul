package action;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainNewsDao;
import dao.MainNoticeDao;
import dao.MainPhotoDao;
import dao.MaingoodsDao;
import dao.MatchInfoDao;
import dao.RankDao;
import dto.GoodsDto;
import dto.MainNewsDto;
import dto.MainNoticeDto;
import dto.MainPhotoDto;
import dto.MatchDBDto;
import dto.RankDto;
import matchInfoAPI.MatchInfoDAO2;
import matchInfoAPI.MatchInfoDTO_1;

public class MatchInfoAction3 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int Month = 0;
		int Year = 0;
		MatchInfoDAO2 MID2 = new MatchInfoDAO2();
		ArrayList<MatchInfoDTO_1> mDTO1arr = null;
		Date dt = null;
		try{
			dt = MID2.matchInfoCheck();
		} catch (Exception e){
			e.printStackTrace();
		}
		String dtD = dt.toString();
		System.out.println("Dt : "+dtD);
		String MonthValue = "";
		LocalDateTime now = null;
		DateTimeFormatter dtf = null;
		try {
			Year = Integer.parseInt(request.getParameter("Year"));
			Month = Integer.parseInt(request.getParameter("Month"));
			if(Month==0){
				now = LocalDateTime.of(Year,1,1,00,00,00);
				MonthValue = "전체";
			}else{
				now = LocalDateTime.of(Year,Month,1,00,00,00);
				MonthValue = (Month >= 10 ? Integer.toString(Month) : "0"+Integer.toString(Month));
			}
			dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); 
		} catch(NumberFormatException e) {
			now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
			dtf = DateTimeFormatter.ofPattern("yyyy-MM-01 00:00");
			Month = now.getMonthValue();
			MonthValue = (Month >= 10 ? Integer.toString(Month) : "0"+Integer.toString(Month));
			Year = now.getYear();
		}
		String informationDate = now.format(dtf).toString();
		try {
			mDTO1arr = MID2.MatchByDate3(informationDate,Month,Year);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		request.setAttribute("Month", Month);
		request.setAttribute("Year", Year);
		request.setAttribute("dtD", dtD);
		request.setAttribute("MonthValue", MonthValue);
		request.setAttribute("showMatchInfo", mDTO1arr);
		request.setAttribute("Month", Month);
		request.setAttribute("Year", Year);
		request.setAttribute("dtD", dtD);
		request.setAttribute("MonthValue", MonthValue);
		request.setAttribute("showMatchInfo", mDTO1arr);
		request.getRequestDispatcher("MatchInfoV2_3.jsp").forward(request,  response);
	}

}
