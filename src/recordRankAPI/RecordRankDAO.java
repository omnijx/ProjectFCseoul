package recordRankAPI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class RecordRankDAO {
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
	public void jsonRecordInformationThisYear(JSONArray jsonArray) throws Exception {
		System.out.println("jsonRecordInformationThisYear 실행!");
		for(int i = 0; i< jsonArray.size(); i++) {
			JSONObject jsonarr = (JSONObject) jsonArray.get(i);
			JSONObject all = (JSONObject) (jsonarr.get("all"));
			Object drawO = all.get("draw");
			Object loseO = all.get("draw");
			System.out.println("drawS : " + drawO);
			int draw = Integer.parseInt((String.valueOf(drawO)));
			int lose = Integer.parseInt((String.valueOf(loseO)));
			Object playedO = all.get("played");
			Object winO = all.get("win");
			int played = Integer.parseInt((String.valueOf(playedO)));
			int win = Integer.parseInt((String.valueOf(winO)));
			JSONObject goals = (JSONObject)(all.get("goals"));
			Object goalForO = goals.get("for");
			int goalFor = Integer.parseInt((String.valueOf(goalForO)));
			Object goalAgainstO = goals.get("against");
			int goalAgainst = Integer.parseInt((String.valueOf(goalAgainstO)));
			Object goalsDiffO = jsonarr.get("goalsDiff");
			int goalsDiff = Integer.parseInt((String.valueOf(goalsDiffO)));
			Object rankO = jsonarr.get("rank");
			int rank = Integer.parseInt((String.valueOf(rankO)));
			Object pointO = jsonarr.get("points");
			int point = Integer.parseInt((String.valueOf(pointO)));
			JSONObject team = (JSONObject) (jsonarr.get("team"));
			Object teamNameO = team.get("name");
			String teamName = String.valueOf(teamNameO);
			insertInfoRecord(draw,lose, played, win, goalFor,goalAgainst, goalsDiff,rank,point,teamName,2023);
		}
	} 
	public void jsonRecordInformation(JSONArray jsonArray) throws Exception {
		System.out.println("jsonRecordInformation 실행!");
		for(int i = 0 ; i<= 1; i ++) {
			JSONArray jsonarr = (JSONArray) jsonArray.get(i);
			for(int j = 0; j< jsonarr.size(); j++) {
				JSONObject jsonarrValue = (JSONObject) jsonarr.get(j);
				JSONObject all = (JSONObject) (jsonarrValue.get("all"));
				Object drawO = all.get("draw");
				Object loseO = all.get("draw");
				System.out.println("drawS : " + drawO);
				int draw = Integer.parseInt((String.valueOf(drawO)));
				int lose = Integer.parseInt((String.valueOf(loseO)));
				Object playedO = all.get("played");
				Object winO = all.get("win");
				int played = Integer.parseInt((String.valueOf(playedO)));
				int win = Integer.parseInt((String.valueOf(winO)));
				JSONObject goals = (JSONObject)(all.get("goals"));
				Object goalForO = goals.get("for");
				int goalFor = Integer.parseInt((String.valueOf(goalForO)));
				Object goalAgainstO = goals.get("against");
				int goalAgainst = Integer.parseInt((String.valueOf(goalAgainstO)));
				Object goalsDiffO = jsonarrValue.get("goalsDiff");
				int goalsDiff = Integer.parseInt((String.valueOf(goalsDiffO)));
				Object rankO = jsonarrValue.get("rank");
				int rank = Integer.parseInt((String.valueOf(rankO))) + i*6;
				Object pointO = jsonarrValue.get("points");
				int point = Integer.parseInt((String.valueOf(pointO)));
				JSONObject team = (JSONObject) (jsonarrValue.get("team"));
				Object teamNameO = team.get("name");
				String teamName = String.valueOf(teamNameO);
				insertInfoRecord(draw,lose, played, win, goalFor,goalAgainst, goalsDiff,rank,point,teamName,2018);
			}
		}
	}
	public void insertInfoRecord(int draw,int lose, int played, int win, int goalFor, int goalAgainst, int goalsDiff, int rank, int point, String teamName, int year) throws Exception {
		System.out.println("Insert 시작!");
		Connection conn = getConnection();
		String sql = "INSERT INTO OVERALL_RANKING(rank,team,games,point,win,draw,lose,goals,conced,goals_diff,year)"
				+" VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rank);
		pstmt.setString(2, teamName);
		pstmt.setInt(3, played);
		pstmt.setInt(4, point);
		pstmt.setInt(5, win);
		pstmt.setInt(6, draw);
		pstmt.setInt(7, lose);
		pstmt.setInt(8, goalFor);
		pstmt.setInt(9, goalAgainst);
		pstmt.setInt(10, goalsDiff);
		pstmt.setInt(11, year);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public ArrayList<recordRankDTO> rankingList(int year) throws Exception{
		ArrayList<recordRankDTO> arr = new ArrayList<recordRankDTO>();
		recordRankDTO rRDTO = null;
		Connection conn = getConnection();
		String sql = "SELECT * FROM OVERALL_RANKING WHERE YEAR = ? ORDER BY rank";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, year);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
          int rank = rs.getInt("rank");
		  String team = rs.getString("team");
          int games = rs.getInt("games");
          int point = rs.getInt("point");
          int win = rs.getInt("win") ;
		  int draw = rs.getInt("draw");
          int lose = rs.getInt("lose");
          int goals = rs.getInt("goals");
		  int conced = rs.getInt("conced");
          int goals_diff = rs.getInt("goals_diff");
          rRDTO = new recordRankDTO( rank,  team,  games,  point,  win,  draw,  lose,  goals,
      			 conced,  goals_diff, "",  year);
          arr.add(rRDTO);
			}
		rs.close();
		pstmt.close();
		conn.close();
		return arr;
	}
}
