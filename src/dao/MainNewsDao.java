package dao;

import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

import dto.MainNewsDto;

public class MainNewsDao {
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
	/*
	 * BNO TITLE W_DATE CONTENT IMAGE THUMBNAIL
	 */	
	public ArrayList<MainNewsDto> getNews(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MainNewsDto> nsdto = new ArrayList<MainNewsDto>();
		try {
			conn = getConnection();
			String sql =  " SELECT * "
						+ " FROM (select * from news order by w_date desc)"
						+ " WHERE ROWNUM <= 2 AND image is not null";
			pstmt = conn.prepareStatement(sql);
			rs  = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String w_date = rs.getString("w_date");
				String content = rs.getString("content");
				String image = rs.getString("image");
				
				MainNewsDto ndto = new MainNewsDto(bno, title, w_date, content, image);
				nsdto.add(ndto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nsdto;
	}
}
