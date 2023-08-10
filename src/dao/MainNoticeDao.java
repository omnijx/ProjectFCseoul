package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.MainNoticeDto;

/*BNO
TITLE
W_DATE
CONTENT*/
public class MainNoticeDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "p123";
	
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
							// DB접속을 시도 ---> Connection객체를 리턴.
		System.out.println("getconnect 호출!");
		return conn;
	}
	public ArrayList<MainNoticeDto> getNotice(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MainNoticeDto> ncdto = new ArrayList<MainNoticeDto>();
		try {
			conn = getConnection();
			String sql =  " SELECT * "
						+ " FROM (select * from notice order by w_date desc)"
						+ " WHERE rownum <=2";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String w_date = rs.getString("w_date");
				String content = rs.getString("content");
				MainNoticeDto nodto = new MainNoticeDto(bno, title, w_date, content);
				ncdto.add(nodto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ncdto;
	}
}
