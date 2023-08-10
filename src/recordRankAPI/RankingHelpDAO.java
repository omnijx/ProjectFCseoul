package recordRankAPI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class RankingHelpDAO {
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
	public void jsonRecordAssist(JSONArray jsonArray) throws Exception {
		System.out.println("jsonRecordAssist 실행!");
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
			Object assist = goals.get("assists");
			insertInfoRecordAssist(count,String.valueOf(player_name),String.valueOf(team),Integer.parseInt((String.valueOf(player_games))),num_replace,Integer.parseInt((String.valueOf(assist))));
		}
	}
	public void insertInfoRecordAssist(int rank, String player_name, String team, int player_games, int num_replace, int assist) throws Exception {
		System.out.println("Insert 시작!");
		Connection conn = getConnection();
		String sql = "INSERT INTO ASSIST_RANK(rank, player_name, games, team, assist, num_replace, assist_game, year)"
				+" VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rank);
		pstmt.setString(2, player_name);
		pstmt.setInt(3, player_games);
		pstmt.setString(4, team);
		pstmt.setInt(5, assist);
		pstmt.setInt(6, num_replace);
		pstmt.setInt(7, (assist*2)/player_games);
		pstmt.setInt(8, 2020);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public ArrayList<rankingHelpDTO> helpList(int year) throws Exception{
		ArrayList<rankingHelpDTO> arr = new ArrayList<rankingHelpDTO>();
		rankingHelpDTO rHDTO = null;
		Connection conn = getConnection();
		String sql = "SELECT * FROM ASSIST_RANK WHERE YEAR = ? ORDER BY rank";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, year);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			int rank = rs.getInt("rank");
			String name = rs.getString("player_name");
            String team = rs.getString("team");
            int assist = rs.getInt("assist");
            int games = rs.getInt("games");
            int num_replace = rs.getInt("num_replace");
            int assist_game = rs.getInt("assist_game");
            rHDTO = new rankingHelpDTO(rank,name,team,assist,games,num_replace,assist_game,year);
            arr.add(rHDTO);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return arr;
	}
}
