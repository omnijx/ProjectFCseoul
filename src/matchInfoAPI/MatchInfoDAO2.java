package matchInfoAPI;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Objects;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



public class MatchInfoDAO2 {
	MatchInfoDto2 MID2 = new MatchInfoDto2();
	static Object home_full;	
	public MatchInfoDAO2() {
		System.out.println("MatchInfoDAO2 생성자 호출");
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
	public Date matchInfoCheck() throws Exception {
		Connection conn = getConnection();
		System.out.println("matchInfoCheck 실행!!!");
		String sql = "SELECT * FROM MATCH_INFO2 WHERE m_date = (SELECT MAX(m_date) FROM match_info2 WHERE M_date<sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Date dated = null;
		if(rs.next()) {
			dated = rs.getDate("m_date");
			home_full = rs.getObject("home_fulltime");
			System.out.println("home_fulltime : "+ home_full);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dated;
	}
	public void jsonCheck(JSONArray jsonArray) throws Exception {
			System.out.println("jsonUpdate 실행!!!");
			JSONObject jsonarr = (JSONObject) jsonArray.get(0);
			System.out.println("jsonarray 받음!");
	    	JSONObject fixture = (JSONObject) (jsonarr.get("fixture"));
	    	String date = (String) fixture.get("date");
	    	MID2.setm_date(date);
	    	System.out.println("dto date : " + MID2.getm_date());
	    	JSONObject status = (JSONObject) (fixture.get("status"));
	    	String isGame = (String) status.get("long");
	    	System.out.println("isGame : " +isGame);
	    	MID2.setIs_game(isGame);
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
	    	MID2.sethome_fulltime(home.toString());
	    	System.out.println("home : " + home);
			MID2.setaway_fulltime(away.toString());
			System.out.println("home_full : " + home_full);
			MID2.sethome_harf(home_harf.toString());
			MID2.setaway_harf(away_harf.toString());
			MID2.sethome_winner(home_winner);
			MID2.setaway_winner(away_winner);
			System.out.println("dto 입력 완료");
			System.out.println("object null체크 : " + (Objects.isNull(home_full) ? false : home.toString().equals(home_full.toString())));
			System.out.println("MID2.isIs_game() : " + MID2.isIs_game());
    	if(MID2.isIs_game()&&!(Objects.isNull(home_full) ? false : home.toString().equals(home_full.toString()))) {
    		Connection conn = getConnection();
    		String sql = "UPDATE match_info2 SET home_harf = ? , home_s_harf = ? , home_fulltime = ? , home_winner = ? , "
    				+ " away_harf = ? , away_s_harf = ? , away_fulltime = ? , away_winner = ? WHERE m_date = TO_DATE(?, 'YYYY-MM-DD HH24:MI')";
    		PreparedStatement pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, Integer.parseInt(MID2.gethome_harf()));
    		pstmt.setInt(2, Integer.parseInt(MID2.gethome_fulltime()) - Integer.parseInt(MID2.gethome_harf()));
    		pstmt.setInt(3, Integer.parseInt(MID2.gethome_fulltime()));
    		pstmt.setString(4, MID2.gethome_winner());
    		pstmt.setInt(5, Integer.parseInt(MID2.getaway_harf()));
    		pstmt.setInt(6, Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf()));
    		pstmt.setInt(7, Integer.parseInt(MID2.getaway_fulltime()));
    		pstmt.setString(8, MID2.getaway_winner());
    		pstmt.setString(9, MID2.getm_date());
    		System.out.println("home_harf : "+Integer.parseInt(MID2.gethome_harf()));
    		System.out.println("home_s_harf : " + (Integer.parseInt(MID2.gethome_fulltime()) - Integer.parseInt(MID2.gethome_harf())));
    		System.out.println("home_fulltime : " + Integer.parseInt(MID2.gethome_fulltime()));
    		System.out.println("home_winner : " + MID2.gethome_winner());
    		System.out.println("away_harf : " + Integer.parseInt(MID2.getaway_harf()));
    		System.out.println("away_s_harf : " + (Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf())));
    		System.out.println("away_fulltime : " + (Integer.parseInt(MID2.getaway_fulltime())-Integer.parseInt(MID2.getaway_harf())));
    		System.out.println("away_winner : " + MID2.getaway_winner());
    		System.out.println("date : " + MID2.getm_date());
    		pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
    		System.out.println("업데이트되었습니다!");
    	}
    	else {
    		System.out.println("정보가 모두 최신입니다!");
    	}
	}
	public void jsonInformation(JSONArray jsonArray) throws Exception {
		for(int i = 0; i< jsonArray.size(); i++) {
			JSONObject jsonarr = (JSONObject) jsonArray.get(i);
        	JSONObject fixture = (JSONObject) (jsonarr.get("fixture"));
        	String date = (String) fixture.get("date");
        	MID2.setm_date(date);
        	JSONObject status = (JSONObject) (fixture.get("status"));
        	String isGame = (String) status.get("long");
        	MID2.setIs_game(isGame);
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
        	insertInfo();
		}
	}
	public void insertInfo() throws Exception {
		if(MID2.isIs_game()) {
			insertInfoP();
		} else {
			insertInfoF();
		}
		System.out.println("info발동");
	}
	public void insertInfoP() throws Exception {
		System.out.println("p발동");
		Connection conn = getConnection();
		String sql = "INSERT INTO match_info2(competition,round,m_date,stadium,home_name,home_logo,home_harf,home_s_harf,home_fulltime,home_winner,away_name,away_logo,away_harf,away_s_harf,away_fulltime,away_winner,is_home) VALUES(?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
	}
	public void insertInfoF() throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO match_info2(competition,round,m_date,stadium,home_name,home_logo,away_name,away_logo,is_home)"
				+" VALUES(?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI'),?,?,?,?,?,?)";
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
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
	}
	public ArrayList<MatchInfoDTO_1> MatchByDate(String DateTostring,int Month, int Year) {
		ArrayList<MatchInfoDTO_1> arr123 = new ArrayList<MatchInfoDTO_1>();
		MatchInfoDTO_1 mdto1 = null;
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM match_info2 WHERE m_date BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI') AND LAST_DAY(TO_DATE(?, 'YYYY-MM-DD HH24:MI')) ORDER BY m_date";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, DateTostring);
			String LastDate = "";
			if(Month==0){
				LastDate = Year+"-12-01 00:00";
			}else {
				LastDate = DateTostring;
			}
			pstmt.setString(2, LastDate);
			System.out.println("dateTostring : "+ DateTostring +" month : " + Month + " year : " + Year +"matchbydate");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String competition = rs.getString("COMPETITION");
				String round = rs.getString("ROUND");
				String date = rs.getString("M_DATE");
				String stadium = rs.getString("STADIUM");
				String home_name = rs.getString("HOME_NAME");
				String away_name = rs.getString("away_name");
				String home_logo = rs.getString("HOME_LOGO");
				String away_logo = rs.getString("away_logo");
				String is_home = rs.getString("IS_HOME");
				System.out.println(competition);
				System.out.println(round);
				System.out.println(date);
				System.out.println(stadium);
				System.out.println(home_name);
				System.out.println(away_name);
				System.out.println(home_logo);
				System.out.println(away_logo);
				System.out.println(is_home);
			    Object home_harf = Objects.isNull(rs.getObject("HOME_HARF"))?"":rs.getObject("HOME_HARF");
			    Object home_s_harf = Objects.isNull(rs.getObject("home_s_harf"))?"":rs.getObject("home_s_harf");
			    Object home_fulltime = Objects.isNull(rs.getObject("home_fulltime"))?"":rs.getObject("home_fulltime"); 
			    Object home_winner = Objects.isNull(rs.getObject("home_winner"))?"":rs.getObject("home_winner");
			    Object away_harf = Objects.isNull(rs.getObject("away_harf"))?"":rs.getObject("away_harf");
			    Object away_s_harf = Objects.isNull(rs.getObject("away_s_harf"))?"":rs.getObject("away_s_harf");
			    Object away_fulltime = Objects.isNull(rs.getObject("away_fulltime"))?"":rs.getObject("away_fulltime"); 
			    Object away_winner = Objects.isNull(rs.getObject("away_winner"))?"":rs.getObject("away_winner");
				System.out.println(round+"번 경기는 데이터가 있습니다!");
				mdto1 = new MatchInfoDTO_1(competition,round,date,stadium,home_name,
						home_logo,home_harf, home_s_harf,home_fulltime, home_winner,
						 away_name,away_logo,away_harf,away_s_harf,away_fulltime,
						 away_winner,is_home);
				arr123.add(mdto1);
				System.out.println("add성공!");
			}
			System.out.println("리턴 성공");
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr123;
	}
	public ArrayList<MatchInfoDTO_1> MatchByDate2(String DateTostring,int Month, int Year) {
		ArrayList<MatchInfoDTO_1> arr123 = new ArrayList<MatchInfoDTO_1>();
		MatchInfoDTO_1 mdto1 = null;
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM match_info2 WHERE m_date BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI') AND LAST_DAY(TO_DATE(?, 'YYYY-MM-DD HH24:MI')) AND competition = 'K League 1' ORDER BY m_date";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, DateTostring);
			String LastDate = "";
			if(Month==0){
				LastDate = Year+"-12-01 00:00";
			}else {
				LastDate = DateTostring;
			}
			pstmt.setString(2, LastDate);
			System.out.println("dateTostring : "+ DateTostring +" month : " + Month + " year : " + Year +"matchbydate");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String competition = rs.getString("COMPETITION");
				String round = rs.getString("ROUND");
				String date = rs.getString("M_DATE");
				String stadium = rs.getString("STADIUM");
				String home_name = rs.getString("HOME_NAME");
				String away_name = rs.getString("away_name");
				String home_logo = rs.getString("HOME_LOGO");
				String away_logo = rs.getString("away_logo");
				String is_home = rs.getString("IS_HOME");
				System.out.println(competition);
				System.out.println(round);
				System.out.println(date);
				System.out.println(stadium);
				System.out.println(home_name);
				System.out.println(away_name);
				System.out.println(home_logo);
				System.out.println(away_logo);
				System.out.println(is_home);
				Object home_harf = Objects.isNull(rs.getObject("HOME_HARF"))?"":rs.getObject("HOME_HARF");
				Object home_s_harf = Objects.isNull(rs.getObject("home_s_harf"))?"":rs.getObject("home_s_harf");
				Object home_fulltime = Objects.isNull(rs.getObject("home_fulltime"))?"":rs.getObject("home_fulltime"); 
				Object home_winner = Objects.isNull(rs.getObject("home_winner"))?"":rs.getObject("home_winner");
				Object away_harf = Objects.isNull(rs.getObject("away_harf"))?"":rs.getObject("away_harf");
				Object away_s_harf = Objects.isNull(rs.getObject("away_s_harf"))?"":rs.getObject("away_s_harf");
				Object away_fulltime = Objects.isNull(rs.getObject("away_fulltime"))?"":rs.getObject("away_fulltime"); 
				Object away_winner = Objects.isNull(rs.getObject("away_winner"))?"":rs.getObject("away_winner");
				System.out.println(round+"번 경기는 데이터가 있습니다!");
				mdto1 = new MatchInfoDTO_1(competition,round,date,stadium,home_name,
						home_logo,home_harf, home_s_harf,home_fulltime, home_winner,
						away_name,away_logo,away_harf,away_s_harf,away_fulltime,
						away_winner,is_home);
				arr123.add(mdto1);
				System.out.println("add성공!");
			}
			System.out.println("리턴 성공");
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr123;
	}
	public ArrayList<MatchInfoDTO_1> MatchByDate3(String DateTostring,int Month, int Year) {
		ArrayList<MatchInfoDTO_1> arr123 = new ArrayList<MatchInfoDTO_1>();
		MatchInfoDTO_1 mdto1 = null;
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM match_info2 WHERE m_date BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI') AND LAST_DAY(TO_DATE(?, 'YYYY-MM-DD HH24:MI')) AND competition = 'FA Cup' ORDER BY m_date";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, DateTostring);
			String LastDate = "";
			if(Month==0){
				LastDate = Year+"-12-01 00:00";
			}else {
				LastDate = DateTostring;
			}
			pstmt.setString(2, LastDate);
			System.out.println("dateTostring : "+ DateTostring +" month : " + Month + " year : " + Year +"matchbydate");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String competition = rs.getString("COMPETITION");
				String round = rs.getString("ROUND");
				String date = rs.getString("M_DATE");
				String stadium = rs.getString("STADIUM");
				String home_name = rs.getString("HOME_NAME");
				String away_name = rs.getString("away_name");
				String home_logo = rs.getString("HOME_LOGO");
				String away_logo = rs.getString("away_logo");
				String is_home = rs.getString("IS_HOME");
				Object home_harf = Objects.isNull(rs.getObject("HOME_HARF"))?"":rs.getObject("HOME_HARF");
				Object home_s_harf = Objects.isNull(rs.getObject("home_s_harf"))?"":rs.getObject("home_s_harf");
				Object home_fulltime = Objects.isNull(rs.getObject("home_fulltime"))?"":rs.getObject("home_fulltime"); 
				Object home_winner = Objects.isNull(rs.getObject("home_winner"))?"":rs.getObject("home_winner");
				Object away_harf = Objects.isNull(rs.getObject("away_harf"))?"":rs.getObject("away_harf");
				Object away_s_harf = Objects.isNull(rs.getObject("away_s_harf"))?"":rs.getObject("away_s_harf");
				Object away_fulltime = Objects.isNull(rs.getObject("away_fulltime"))?"":rs.getObject("away_fulltime"); 
				Object away_winner = Objects.isNull(rs.getObject("away_winner"))?"":rs.getObject("away_winner");
				System.out.println(round+"번 경기는 데이터가 있습니다!");
				mdto1 = new MatchInfoDTO_1(competition,round,date,stadium,home_name,
						home_logo,home_harf, home_s_harf,home_fulltime, home_winner,
						away_name,away_logo,away_harf,away_s_harf,away_fulltime,
						away_winner,is_home);
				arr123.add(mdto1);
				System.out.println("add성공!");
			}
			System.out.println("리턴 성공");
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr123;
	}
	public MatchInfoDTO_1 selectMatch(String date1) throws Exception {
			System.out.println("selectMatch 실행!!!");
			Connection conn = getConnection();
			MatchInfoDTO_1 mdto = null;
			String sql = "SELECT * FROM match_info2 WHERE TO_CHAR(M_DATE, 'YYYY-MM-DD') = ? ORDER BY m_date";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date1);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String competition = rs.getString("COMPETITION");
				String round = rs.getString("ROUND");
				String date = rs.getString("M_DATE");
				String stadium = rs.getString("STADIUM");
				String home_name = rs.getString("HOME_NAME");
				String away_name = rs.getString("away_name");
				String home_logo = rs.getString("HOME_LOGO");
				String away_logo = rs.getString("away_logo");
				String is_home = rs.getString("IS_HOME");
				Object home_harf = Objects.isNull(rs.getObject("HOME_HARF"))?"":rs.getObject("HOME_HARF");
				Object home_s_harf = Objects.isNull(rs.getObject("home_s_harf"))?"":rs.getObject("home_s_harf");
				Object home_fulltime = Objects.isNull(rs.getObject("home_fulltime"))?"":rs.getObject("home_fulltime"); 
				Object home_winner = Objects.isNull(rs.getObject("home_winner"))?"":rs.getObject("home_winner");
				Object away_harf = Objects.isNull(rs.getObject("away_harf"))?"":rs.getObject("away_harf");
				Object away_s_harf = Objects.isNull(rs.getObject("away_s_harf"))?"":rs.getObject("away_s_harf");
				Object away_fulltime = Objects.isNull(rs.getObject("away_fulltime"))?"":rs.getObject("away_fulltime"); 
				Object away_winner = Objects.isNull(rs.getObject("away_winner"))?"":rs.getObject("away_winner");
				mdto = new MatchInfoDTO_1(competition,round,date,stadium,home_name,
						home_logo,home_harf, home_s_harf,home_fulltime, home_winner,
						away_name,away_logo,away_harf,away_s_harf,away_fulltime,
						away_winner,is_home);
			}
			rs.close();
			pstmt.close();
			conn.close();
			return mdto;
	}
	public String dayofweek(String nowDate) throws Exception {
		System.out.println("dayofWeek 호출");
		Connection conn = getConnection();
		String sql = "SELECT TO_CHAR(TO_DATE(?,'YYYY/MM/DD HH24:MI'), 'DY') as ex1 FROM DUAL";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nowDate);
		String rep = nowDate.replace(" ", "");
		ResultSet rs = pstmt.executeQuery();
		String dOW = "";
		System.out.println(rep);
		if(rs.next()) {
			dOW = rs.getString("ex1");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dOW;
	}
	
	public MatchInfoDTO_1 matchInfoCheckDTO() throws Exception {
	      Connection conn = getConnection();
	      System.out.println("matchInfoCheck 실행!!!");
	      String sql = "SELECT * FROM MATCH_INFO2 WHERE m_date = (SELECT MAX(m_date) FROM match_info2 WHERE M_date<sysdate)";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      ResultSet rs = pstmt.executeQuery();
	      Date dated = null;
	      MatchInfoDTO_1 mdto1 = null;
	      if(rs.next()) {
	         String competition = rs.getString("COMPETITION");
	         String round = rs.getString("ROUND");
	         String date = rs.getString("M_DATE");
	         String stadium = rs.getString("STADIUM");
	         String home_name = rs.getString("HOME_NAME");
	         String away_name = rs.getString("away_name");
	         String home_logo = rs.getString("HOME_LOGO");
	         String away_logo = rs.getString("away_logo");
	         String is_home = rs.getString("IS_HOME");
	         Object home_harf = Objects.isNull(rs.getObject("HOME_HARF"))?"":rs.getObject("HOME_HARF");
	          Object home_s_harf = Objects.isNull(rs.getObject("home_s_harf"))?"":rs.getObject("home_s_harf");
	          Object home_fulltime = Objects.isNull(rs.getObject("home_fulltime"))?"":rs.getObject("home_fulltime"); 
	          Object home_winner = Objects.isNull(rs.getObject("home_winner"))?"":rs.getObject("home_winner");
	          Object away_harf = Objects.isNull(rs.getObject("away_harf"))?"":rs.getObject("away_harf");
	          Object away_s_harf = Objects.isNull(rs.getObject("away_s_harf"))?"":rs.getObject("away_s_harf");
	          Object away_fulltime = Objects.isNull(rs.getObject("away_fulltime"))?"":rs.getObject("away_fulltime"); 
	          Object away_winner = Objects.isNull(rs.getObject("away_winner"))?"":rs.getObject("away_winner");
	          mdto1 = new MatchInfoDTO_1(competition,round,date,stadium,home_name,
	               home_logo,home_harf, home_s_harf,home_fulltime, home_winner,
	               away_name,away_logo,away_harf,away_s_harf,away_fulltime,
	               away_winner,is_home);
	      }
	      rs.close();
	      pstmt.close();
	      conn.close();
	      return mdto1;
	   }
}
