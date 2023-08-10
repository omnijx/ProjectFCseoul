package teamMember;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import News.NewsDTO;

public class teamMemberDAO {
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
	public teamMemberDTO getTeamMember(int bno) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM News WHERE bno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		ResultSet rs = pstmt.executeQuery();
		teamMemberDTO dto = null;
		if(rs.next()) {

		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	}
}
