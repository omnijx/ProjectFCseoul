package recordRankAPI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class RankingScoreDAO {
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
	public void jsonRecordScore(JSONArray jsonArray) throws Exception {
		System.out.println("jsonRecordScore 실행!");
		int count = 0;
		for(int i = 0; i< jsonArray.size(); i++) {
			count++;
			JSONObject jsonarr = (JSONObject) jsonArray.get(i);
			JSONObject playerJ = (JSONObject) (jsonarr.get("player"));
			Object player_name = playerJ.get("name");
			JSONArray statistics = (JSONArray) (jsonarr.get("statistics"));
			JSONObject statistic = (JSONObject) statistics.get(0);
			JSONObject teamJ = (JSONObject) statistic.get("team");
			Object team = teamJ.get("name");
			JSONObject games = (JSONObject) statistic.get("games");
			Object player_games = games.get("appearences");
			JSONObject substitutes = (JSONObject) statistic.get("substitutes");
			Object in = substitutes.get("in");
			Object out = substitutes.get("out");
			int num_replace = Integer.parseInt((String.valueOf(in))) + Integer.parseInt((String.valueOf(out)));
			JSONObject goals = (JSONObject) statistic.get("goals");
			Object goal = goals.get("total");
			
			insertInfoRecordScore(count,String.valueOf(player_name),String.valueOf(team),Integer.parseInt((String.valueOf(player_games))),num_replace,Integer.parseInt((String.valueOf(goal))));
		}
	}
	public void insertInfoRecordScore(int rank, String player_name, String team, int player_games, int num_replace, int goal) throws Exception {
		System.out.println("Insert 시작!");
		Connection conn = getConnection();
		String sql = "INSERT INTO SCORING_RANKING(rank, player_name, player_games, team, player_goals, num_replace, goals_game, year)"
				+" VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rank);
		pstmt.setString(2, player_name);
		pstmt.setInt(3, player_games);
		pstmt.setString(4, team);
		pstmt.setInt(5, goal);
		pstmt.setInt(6, num_replace);
		pstmt.setInt(7, (goal*2)/player_games);
		pstmt.setInt(8, 2019);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public ArrayList<rankingScoreDTO> ScoreList(int year) throws Exception{
		ArrayList<rankingScoreDTO> arr = new ArrayList<rankingScoreDTO>();
		rankingScoreDTO rSDTO = null;
		Connection conn = getConnection();
		String sql = "SELECT * FROM SCORING_RANKING WHERE YEAR = ? ORDER BY rank";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, year);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			int rank = rs.getInt("rank");
			String name = rs.getString("player_name");
            String team = rs.getString("team");
            int goals_game = rs.getInt("GOALS_GAME");
            int player_goals = rs.getInt("PLAYER_GOALS");
            int num_replace = rs.getInt("num_replace");
            int player_games = rs.getInt("PLAYER_GAMES");
            rSDTO = new rankingScoreDTO( rank,  name,  team,  goals_game,  player_games,  num_replace,  goals_game,year);
            arr.add(rSDTO);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return arr;
	}
}
