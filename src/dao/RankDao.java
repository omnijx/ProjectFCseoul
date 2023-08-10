package dao;

import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dto.MainNewsDto;
import dto.RankDto;

public class RankDao {
	public void jsonRank(JSONArray jsonArray) throws Exception {
		System.out.println("jsonRank실행");
		for(int i = 0; i< jsonArray.size(); i++) {
            JSONObject jsonarr = (JSONObject) jsonArray.get(i);
            JSONObject all = (JSONObject) (jsonarr.get("all"));
            JSONObject goals = (JSONObject)(all.get("goals"));
            JSONObject team = (JSONObject) (jsonarr.get("team"));

            Object drawO = all.get("draw");
            Object loseO = all.get("lose");
            System.out.println("drawS : " + drawO);

            int draw = Integer.parseInt((String.valueOf(drawO)));
            int lose = Integer.parseInt((String.valueOf(loseO)));

            Object playedO = all.get("played");
            Object winO = all.get("win");

            int played = Integer.parseInt((String.valueOf(playedO)));
            int win = Integer.parseInt((String.valueOf(winO)));

           
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

            
            Object teamNameO = team.get("name");
            String teamName = String.valueOf(teamNameO);
            Object logoO = team.get("logo");
            String logo = String.valueOf(logoO);
            
//            if (!checkTeamExists(teamName)) {
      //      	insertInfoRecord(draw, lose, played, win, goalFor, goalAgainst, goalsDiff, rank, point, teamName, logo, 2023);
//            }
            	rankUpdate(draw, lose, played, win, goalFor, goalAgainst, goalsDiff, rank, point, teamName, logo, 2023);
        }
			
			
			
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
	public boolean checkTeamExists(String teamName) throws Exception {
	    Connection conn = getConnection();
	    String sql = "SELECT COUNT(*) FROM overall_ranking WHERE team = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, teamName);
	    ResultSet rs = pstmt.executeQuery();
	    
	    boolean teamExists = false;
	    if (rs.next()) {
	        int count = rs.getInt(1);
	        if (count > 0) {
	            teamExists = true;
	        }
	    }

	    rs.close();
	    pstmt.close();
	    conn.close();
	    
	    return teamExists;
	}
	public void rankUpdate(int draw,int lose, int played, int win, int goalFor, int goalAgainst, int goalsDiff, int rank, int point, String teamName,String logo, int year) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE OVERALL_RANKING SET rank=?,  team=?,  games=?,  point=?,  win=?,  draw=?,  lose=?,  goals=?,  conced=?,"
				+ "	goals_diff=?,  team_logo=?  WHERE team = ?";
		
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
	        pstmt.setString(11,logo);
	        pstmt.setString(12, teamName);
	        
	        
	        pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
	        System.out.println("update되었습니다");
		
	}
	
	
	public void insertInfoRecord(int draw,int lose, int played, int win, int goalFor, int goalAgainst, int goalsDiff, int rank, int point, String teamName,String logo, int year) throws Exception {
        System.out.println("Insert 시작!");
        Connection conn = getConnection();
        String sql = "INSERT INTO OVERALL_RANKING(rank,team,games,point,win,draw,lose,goals,conced,goals_diff,team_logo,year)"
                +" VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
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
        pstmt.setString(11,logo);
        pstmt.setInt(12, year);
        pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
    }
	
	public ArrayList<RankDto> getFcRank(){
		ArrayList<RankDto> rDto = new ArrayList<RankDto>();
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM overall_ranking WHERE team = 'FC Seoul' and year =2023";
			PreparedStatement pstmt = conn.prepareStatement(sql); 
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String team = rs.getString("team");
				int games = rs.getInt("games");
				int point = rs.getInt("point");
				int win = rs.getInt("win");
				int draw = rs.getInt("draw");
				int lose = rs.getInt("lose");
				int goals = rs.getInt("goals");
				int conced = rs.getInt("conced");
				int goals_diff = rs.getInt("goals_diff");
				String team_logo = rs.getString("team_logo");
				int year = rs.getInt("year");
				RankDto ranDto = new RankDto(rank,team,games,point,win,draw,lose,goals,conced,goals_diff,team_logo,year);
				rDto.add(ranDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return rDto;
	}
	
	public ArrayList<RankDto> getAllRank(){
		ArrayList<RankDto> rDto = new ArrayList<RankDto>();
		try {
			Connection conn = getConnection();
			String sql = "SELECT *"
					+ " FROM (SELECT * FROM overall_ranking ORDER BY point DESC)"
					+ " WHERE rownum <=4 AND year = 2023"
					+ " ORDER BY decode(team,'FC Seoul',1), Point DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int rank = rs.getInt("rank");
				String team = rs.getString("team");
				int games = rs.getInt("games");
				int point = rs.getInt("point");
				int win = rs.getInt("win");
				int draw = rs.getInt("draw");
				int lose = rs.getInt("lose");
				int goals = rs.getInt("goals");
				int conced = rs.getInt("conced");
				int goals_diff = rs.getInt("goals_diff");
				String team_logo = rs.getString("team_logo");
				int year = rs.getInt("year");
				RankDto ranDto = new RankDto(rank,team,games,point,win,draw,lose,goals,conced,goals_diff,team_logo,year);
				rDto.add(ranDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return rDto;
	}
	
}






