package noticeAjax;

import java.sql.*;
import java.util.ArrayList;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public NoticeDAO() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "project";
			String dbpw = "p123";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Notice> search(String searchValue, int pageNum){
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		
		String sql = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT * FROM notice WHERE title LIKE ? ORDER BY bno DESC) b1) b2"
				+ " WHERE b2.rnum>=?  AND b2.rnum<=? ORDER BY b2.rnum DESC";
		
		
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchValue + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setBno(rs.getInt("bno"));
				notice.setTitle(rs.getString("title"));
				notice.setDate(rs.getString("w_date"));
				noticeList.add(notice);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}

}
