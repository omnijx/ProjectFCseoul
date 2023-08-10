package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import dto.MatchInfoDto;
import dto.MatchDBDto;
import dto.RankDto;

public class MatchInfoDao {
	static Object home_full;
	MatchInfoDto MID2= new MatchInfoDto();
	public void jsonInformation(JSONArray jsonArray) throws Exception {
		for(int i = 0; i< jsonArray.size(); i++) {
		JSONObject jsonarr = (JSONObject) jsonArray.get(i);
        	JSONObject fixture = (JSONObject) (jsonarr.get("fixture"));
        	String date = (String) fixture.get("date");
        	MID2.setm_date(date);
        	
        	JSONObject status = (JSONObject) (fixture.get("status"));
        	String isGame = (String) status.get("long");
        	MID2.setIs_game(isGame);
        	MID2.setMatch_fin(isGame);
        	
        	JSONObject venue = (JSONObject) (fixture.get("venue"));
        	String stadium = (String) venue.get("name");
        	MID2.setstadium(stadium);
        	
        	JSONObject goals = (JSONObject) (jsonarr.get("goals"));
        	Object home = (Object) goals.get("home");
        	Object away = (Object) goals.get("away");
        	
        	JSONObject league = (JSONObject) (jsonarr.get("league"));
        	String round = (String) (league.get("round"));
        	String competition = (String) (league.get("name"));
        	MID2.setround(round);
        	MID2.setcompetiton(competition);

        	JSONObject score = (JSONObject) (jsonarr.get("score"));
        	JSONObject halftime = (JSONObject) (score.get("halftime"));
        	Object home_harf = (Object) (halftime.get("home"));
        	Object away_harf = (Object) (halftime.get("away"));
        	JSONObject teams = (JSONObject) (jsonarr.get("teams"));
        	JSONObject teams_home = (JSONObject) (teams.get("home"));
        	String home_name = (String) (teams_home.get("name"));
        	MID2.sethome_name(home_name);
        	MID2.setis_home(home_name);
        	
        	Object home_winner = (Object) (teams_home.get("winner"));
        	String home_logo = (String) (teams_home.get("logo"));
        	MID2.sethome_logo(home_logo);
        	
        	JSONObject teams_away = (JSONObject) (teams.get("away"));
        	String away_name = (String) (teams_away.get("name"));
        	MID2.setaway_name(away_name);
        	
        	Object away_winner = (Object) (teams_away.get("winner"));
        	String away_logo = (String) (teams_away.get("logo"));
        	MID2.setaway_logo(away_logo);
        	
        	if(MID2.isIs_game()) {
        		MID2.sethome_fulltime(home.toString());
        		MID2.setaway_fulltime(away.toString());;
        		if(home_harf!=null) {
	        		MID2.sethome_harf(home_harf.toString());
	        		MID2.setaway_harf(away_harf.toString());
	        		MID2.sethome_winner(home_winner);
	        		MID2.setaway_winner(away_winner);
        		}
        		}else {
        			MID2.sethome_harf("0");
	        		MID2.setaway_harf("0");
	        		MID2.sethome_winner("0");
	        		MID2.setaway_winner("0");
        	}
//       	insertInfo();
//       	getupdateMatchInfo();
        		
		}
	}
	public boolean insertCheck(String round)throws Exception{
		Connection conn = getConnection();
		String sql = "select count(*) from match_info where round is not null";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		boolean b =false;
		
		while(rs.next()) {
			int count  = rs.getInt(1);
			if(count>=34) {
				b = true;
			}
		}
		rs.close();
		pstmt.close();
		conn.close();
		return b;
	}
	
	public void insertInfo() throws Exception {
		if(MID2.isIs_game()) {
			insertInfoP();
		} else {
			insertInfoF();
		}
		System.out.println("info발동");
	}
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "p123";
	
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
							// DB접속을 시도 ---> Connection객체를 리턴.
		return conn;
	}
	
	public void insertInfoP() throws Exception {			//한경기
		System.out.println("p발동");
		Connection conn = getConnection();
		String sql = "INSERT INTO match_info(competition,round,m_date,stadium,home_name,home_logo,home_harf,home_s_harf,home_fulltime,home_winner,away_name,away_logo,away_harf,away_s_harf,away_fulltime,away_winner,is_home,match_fin) VALUES(?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, MID2.getcompetiton());
		pstmt.setString(2, MID2.getround());
		pstmt.setString(3, MID2.getm_date());
		pstmt.setString(4, MID2.getstadium());
		pstmt.setString(5, MID2.gethome_name());
		pstmt.setString(6, MID2.gethome_logo());
		pstmt.setInt(7, Integer.parseInt(MID2.gethome_harf()));
		pstmt.setInt(8, Integer.parseInt(MID2.gethome_fulltime())-Integer.parseInt(MID2.gethome_harf()));
		pstmt.setInt(9, Integer.parseInt(MID2.gethome_fulltime()));
		pstmt.setString(10, MID2.gethome_winner());
		pstmt.setString(11, MID2.getaway_name());
		pstmt.setString(12, MID2.getaway_logo());
		pstmt.setInt(13, Integer.parseInt(MID2.getaway_harf()));
		pstmt.setInt(14, Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf()));
		pstmt.setInt(15, Integer.parseInt(MID2.getaway_fulltime()));
		pstmt.setString(16, MID2.getaway_winner());
		pstmt.setString(17, MID2.getis_home());
		pstmt.setString(18, MID2.getMatch_fin());
		
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
	}
	public void insertInfoF() throws Exception {		// 안한경기
		Connection conn = getConnection();
		String sql = "INSERT INTO match_info(competition,round,m_date,stadium,home_name,home_logo,away_name,away_logo,is_home,match_fin)"
				+" VALUES(?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, MID2.getcompetiton());
		pstmt.setString(2, MID2.getround());
		pstmt.setString(3, MID2.getm_date());
		pstmt.setString(4, MID2.getstadium());
		pstmt.setString(5, MID2.gethome_name());
		pstmt.setString(6, MID2.gethome_logo());
		pstmt.setString(7, MID2.getaway_name());
		pstmt.setString(8, MID2.getaway_logo());
		pstmt.setString(9, MID2.getis_home());
		pstmt.setString(10, MID2.getMatch_fin());
		
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
	}

	public ArrayList<MatchDBDto>  prevMatch(){ 
		ArrayList<MatchDBDto> mdbdto = new ArrayList<MatchDBDto>();
		try {
			Connection conn = getConnection();
			  System.out.println("!!!");
				String sql = " SELECT * "
						   + " FROM (SELECT * FROM match_info WHERE match_fin = 'Match Finished' and m_date <sysdate  order by m_date desc) "
			  			   + " WHERE rownum<=1";
			  	PreparedStatement pstmt  = conn.prepareStatement(sql);
			  	
			  	
			  	MatchDBDto mdto2 =null;
			  	ResultSet rs = pstmt.executeQuery();
			  	while(rs.next()) {
			  		String competiton = rs.getString("competition");		
			  		String round = rs.getString("round");
			  		Date m_date = rs.getDate("m_date");
			  		String stadium = rs.getString("stadium");
			  		String home_name = rs.getString("home_name");
			  		String home_logo = rs.getString("home_logo");
			  		int home_harf = rs.getInt("home_harf");
			  		int home_s_harf = rs.getInt("home_s_harf");
			  		int home_fulltime = rs.getInt("home_fulltime");
			  		String home_winner = rs.getString("home_winner");
			  		String away_name = rs.getString("away_name");
			  		String away_logo = rs.getString("away_logo");
			  		int away_harf = rs.getInt("away_harf");
			  		int away_s_harf = rs.getInt("away_s_harf");
			  		int away_fulltime = rs.getInt("away_fulltime");
			  		String away_winner = rs.getString("away_winner");
			  		String is_home = rs.getString("is_home");
			  		String match_fin = rs.getString("match_fin");
			  		

			  		mdto2 = new MatchDBDto(competiton, round, m_date, stadium, home_name, home_logo, home_harf, home_s_harf, home_fulltime, home_winner, 
			  			    away_name, away_logo, away_harf, away_s_harf, away_fulltime, away_winner, is_home, match_fin);

			  		mdbdto.add(mdto2);
			  		
			  	}
			  	rs.close();
			  	pstmt.close();
			  	conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	  	
	  	return mdbdto;
	  
	  }
	 public ArrayList<MatchDBDto> nextMatch(){
		 ArrayList<MatchDBDto> mdbdto = new ArrayList<MatchDBDto>();
		 try {
			 Connection conn = getConnection();
			 String sql = " SELECT * "
			 			+ " FROM (select * from match_info where match_fin = 'Not Started' order by m_date ) "
			 			+ " WHERE rownum<=1 ";
			 MatchDBDto mdto2 =null;
			  	
			 
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery();
			 while(rs.next()) {
				 	String competiton = rs.getString("competition");		
			  		String round = rs.getString("round");
			  		Date m_date = rs.getDate("m_date");
			  		String stadium = rs.getString("stadium");
			  		String home_name = rs.getString("home_name");
			  		String home_logo = rs.getString("home_logo");
			  		int home_harf = rs.getInt("home_harf");
			  		int home_s_harf = rs.getInt("home_s_harf");
			  		int home_fulltime = rs.getInt("home_fulltime");
			  		String home_winner = rs.getString("home_winner");
			  		String away_name = rs.getString("away_name");
			  		String away_logo = rs.getString("away_logo");
			  		int away_harf = rs.getInt("away_harf");
			  		int away_s_harf = rs.getInt("away_s_harf");
			  		int away_fulltime = rs.getInt("away_fulltime");
			  		String away_winner = rs.getString("away_winner");
			  		String is_home = rs.getString("is_home");
			  		String match_fin = rs.getString("match_fin");
			  		mdto2 = new MatchDBDto(competiton, round, m_date, stadium, home_name, home_logo, home_harf, home_s_harf, home_fulltime, home_winner, 
			  			    away_name, away_logo, away_harf, away_s_harf, away_fulltime, away_winner, is_home, match_fin);
			  	mdbdto.add(mdto2);	

			 }
			 	rs.close();
			  	pstmt.close();
			  	conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		  	return mdbdto;
	 }
	 public ArrayList<MatchDBDto> nextnextMatch(){
		 ArrayList<MatchDBDto> mdbdto = new ArrayList<MatchDBDto>();
		 try {
			 Connection conn = getConnection();
			 String sql = "SELECT * "
			 			+ " FROM (  SELECT *"
			 			+ "        FROM match_info"
			 			+ "        WHERE M_DATE > (SELECT MIN(M_DATE) FROM match_info WHERE match_fin = 'Not Started')order by m_date)"
			 			+ " WHERE rownum<=1";
			 MatchDBDto mdto2 =null;
			  	
			 
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery();
			 while(rs.next()) {
				 	String competiton = rs.getString("competition");		
			  		String round = rs.getString("round");
			  		Date m_date = rs.getDate("m_date");
			  		String stadium = rs.getString("stadium");
			  		String home_name = rs.getString("home_name");
			  		String home_logo = rs.getString("home_logo");
			  		int home_harf = rs.getInt("home_harf");
			  		int home_s_harf = rs.getInt("home_s_harf");
			  		int home_fulltime = rs.getInt("home_fulltime");
			  		String home_winner = rs.getString("home_winner");
			  		String away_name = rs.getString("away_name");
			  		String away_logo = rs.getString("away_logo");
			  		int away_harf = rs.getInt("away_harf");
			  		int away_s_harf = rs.getInt("away_s_harf");
			  		int away_fulltime = rs.getInt("away_fulltime");
			  		String away_winner = rs.getString("away_winner");
			  		String is_home = rs.getString("is_home");
			  		String match_fin = rs.getString("match_fin");
			  		mdto2 = new MatchDBDto(competiton, round, m_date, stadium, home_name, home_logo, home_harf, home_s_harf, home_fulltime, home_winner, 
			  			    away_name, away_logo, away_harf, away_s_harf, away_fulltime, away_winner, is_home, match_fin);
			  	mdbdto.add(mdto2);	

			 }
			 	rs.close();
			  	pstmt.close();
			  	conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		  	
		  	return mdbdto;
	 }
	 
//	 1		COMPETITION	VARCHAR2(1000 BYTE)
//	 2	ROUND	VARCHAR2(1000 BYTE)
//	 3		M_DATE	DATE
//	 4	STADIUM	VARCHAR2(1000 BYTE)
//	 5	HOME_NAME	VARCHAR2(1000 BYTE)
//	 6	HOME_LOGO	VARCHAR2(1000 BYTE)
//	 7	HOME_HARF	NUMBER
//	8 	HOME_S_HARF	NUMBER
//	 9	HOME_FULLTIME	NUMBER
//	 10	HOME_WINNER	VARCHAR2(100 BYTE)
//	 11	AWAY_NAME	VARCHAR2(1000 BYTE)
//	 12	AWAY_LOGO	VARCHAR2(1000 BYTE)
//	13	 AWAY_HARF	NUMBER
//	14	 AWAY_S_HARF	NUMBER
//	 15	AWAY_FULLTIME	NUMBER
//	16	 AWAY_WINNER	VARCHAR2(100 BYTE)
//	17	 IS_HOME	VARCHAR2(100 BYTE)
//	18	 MATCH_FIN	VARCHAR2(100 BYTE)
	 
	 public void getupdateMatchInfo()throws Exception {
		 Connection conn = getConnection();
		 String sql = " UPDATE MATCH_INFO SET home_harf=?,home_s_harf = ?, home_fulltime=?,home_winner=?,"
		 			+ " away_harf=?, away_s_harf=?, away_fulltime=?, away_winner = ?,match_fin=? WHERE m_date =(select min(m_date)from match_info where MATCH_FIN ='Not Started')";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 
		
			pstmt.setInt(1, Integer.parseInt(MID2.gethome_harf()));
			
			pstmt.setInt(2, Integer.parseInt(MID2.gethome_fulltime())-Integer.parseInt(MID2.gethome_harf()));
			
			pstmt.setInt(3, Integer.parseInt(MID2.gethome_fulltime()));
			
			pstmt.setString(4, MID2.gethome_winner());
			
			pstmt.setInt(5, Integer.parseInt(MID2.getaway_harf()));
			
			pstmt.setInt(6, Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf()));
			
			pstmt.setInt(7, Integer.parseInt(MID2.getaway_fulltime()));
			
			pstmt.setString(8, MID2.getaway_winner());

			pstmt.setString(9, MID2.getMatch_fin());
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
	 }
	 
//	 public Date matchInfoCheck() throws Exception {
//		 
//         Connection conn = getConnection();
//         System.out.println("matchInfoCheck 실행!!!");
//         String sql = "SELECT * FROM MATCH_INFO WHERE m_date = (SELECT MAX(m_date) FROM match_info WHERE M_date<sysdate)";
//         PreparedStatement pstmt = conn.prepareStatement(sql);
//         ResultSet rs = pstmt.executeQuery();
//         Date dated = null;
//         if(rs.next()) {
//             dated = rs.getDate("m_date");
//             home_full = rs.getObject("home_fulltime");
//             System.out.println("home_fulltime : "+ home_full);
//         }
//         rs.close();
//         pstmt.close();
//         conn.close();
//         return dated;
// }
//	 
//	 public void jsonCheck(JSONArray jsonArray) throws Exception {
//		
//			System.out.println("jsonUpdate 실행!!!");
//			JSONObject jsonarr = (JSONObject) jsonArray.get(0);
//			System.out.println("jsonarray 받음!");
//	    	JSONObject fixture = (JSONObject) (jsonarr.get("fixture"));
//	    	String date = (String) fixture.get("date");
//	    	MID2.setm_date(date);
//	    	System.out.println("dto date : " + MID2.getm_date());
//	    	JSONObject status = (JSONObject) (fixture.get("status"));
//	    	String isGame = (String) status.get("long");
//	    	System.out.println("isGame : " +isGame);
//	    	MID2.setIs_game(isGame);
//	    	JSONObject venue = (JSONObject) (fixture.get("venue"));
//	    	String stadium = (String) venue.get("name");
//	    	MID2.setstadium(stadium);
//	    	JSONObject goals = (JSONObject) (jsonarr.get("goals"));
//	    	Object home = (Object) goals.get("home");
//	    	Object away = (Object) goals.get("away");
//	    	JSONObject league = (JSONObject) (jsonarr.get("league"));
//	    	String round = (String) (league.get("round"));
//	    	String competition = (String) (league.get("name"));
//	    	MID2.setround(round);
//	    	MID2.setcompetiton(competition);
//	    	JSONObject score = (JSONObject) (jsonarr.get("score"));
//	    	JSONObject halftime = (JSONObject) (score.get("halftime"));
//	    	Object home_harf = (Object) (halftime.get("home"));
//	    	Object away_harf = (Object) (halftime.get("away"));
//	    	JSONObject teams = (JSONObject) (jsonarr.get("teams"));
//	    	JSONObject teams_home = (JSONObject) (teams.get("home"));
//	    	String home_name = (String) (teams_home.get("name"));
//	    	MID2.sethome_name(home_name);
//	    	MID2.setis_home(home_name);
//	    	Object home_winner = (Object) (teams_home.get("winner"));
//	    	String home_logo = (String) (teams_home.get("logo"));
//	    	MID2.sethome_logo(home_logo);
//	    	JSONObject teams_away = (JSONObject) (teams.get("away"));
//	    	String away_name = (String) (teams_away.get("name"));
//	    	MID2.setaway_name(away_name);
//	    	Object away_winner = (Object) (teams_away.get("winner"));
//	    	String away_logo = (String) (teams_away.get("logo"));
//	    	MID2.setaway_logo(away_logo);
//	    	MID2.sethome_fulltime(home.toString());
//	    	System.out.println("home : " + home);
//			MID2.setaway_fulltime(away.toString());
//			System.out.println("home_full : " + home_full);
//			MID2.sethome_harf(home_harf.toString());
//			MID2.setaway_harf(away_harf.toString());
//			MID2.sethome_winner(home_winner);
//			MID2.setaway_winner(away_winner);
//			System.out.println("dto 입력 완료");
//			System.out.println("object null체크 : " + (Objects.isNull(home_full) ? false : home.toString().equals(home_full.toString())));
//			System.out.println("MID2.isIs_game() : " + MID2.isIs_game());
// 	if(MID2.isIs_game()&&!(Objects.isNull(home_full) ? false : home.toString().equals(home_full.toString()))) {
// 		Connection conn = getConnection();
// 		String sql = "UPDATE match_info SET home_harf = ? , home_s_harf = ? , home_fulltime = ? , home_winner = ? , "
// 				+ " away_harf = ? , away_s_harf = ? , away_fulltime = ? , away_winner = ? WHERE m_date = TO_DATE(?, 'YYYY-MM-DD HH24:MI')";
// 		PreparedStatement pstmt = conn.prepareStatement(sql);
// 		pstmt.setInt(1, Integer.parseInt(MID2.gethome_harf()));
// 		pstmt.setInt(2, Integer.parseInt(MID2.gethome_fulltime()) - Integer.parseInt(MID2.gethome_harf()));
// 		pstmt.setInt(3, Integer.parseInt(MID2.gethome_fulltime()));
// 		pstmt.setString(4, MID2.gethome_winner());
// 		pstmt.setInt(5, Integer.parseInt(MID2.getaway_harf()));
// 		pstmt.setInt(6, Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf()));
// 		pstmt.setInt(7, Integer.parseInt(MID2.getaway_fulltime()));
// 		pstmt.setString(8, MID2.getaway_winner());
// 		pstmt.setString(9, MID2.getm_date());
// 		System.out.println("home_harf : "+Integer.parseInt(MID2.gethome_harf()));
// 		System.out.println("home_s_harf : " + (Integer.parseInt(MID2.gethome_fulltime()) - Integer.parseInt(MID2.gethome_harf())));
// 		System.out.println("home_fulltime : " + Integer.parseInt(MID2.gethome_fulltime()));
// 		System.out.println("home_winner : " + MID2.gethome_winner());
// 		System.out.println("away_harf : " + Integer.parseInt(MID2.getaway_harf()));
// 		System.out.println("away_s_harf : " + (Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf())));
// 		System.out.println("away_fulltime : " + (Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf())));
// 		System.out.println("away_winner : " + MID2.getaway_winner());
// 		System.out.println("date : " + MID2.getm_date());
// 		pstmt.executeUpdate();
// 		pstmt.close();
// 		conn.close();
// 		System.out.println("업데이트되었습니다!");
// 	}
// 	else {
// 		System.out.println("정보가 모두 최신입니다!");
// 	}
//	}
//	 
	 
	 
	 
	
	
}
