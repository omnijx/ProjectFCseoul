package News;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class NewsDAO {
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
	public ArrayList<NewsDTO> getThreeNewsDto() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM (SELECT * FROM news ORDER BY bno DESC) b1 WHERE rownum <= 3";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<NewsDTO> arr = new ArrayList<NewsDTO>();
		NewsDTO dto = null;
		while(rs.next()) {
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String Image = rs.getString("Image_real");
			Date writedate = rs.getDate("w_date");
			System.out.println("title : "+title+" content : "+content + " Image : " + Image + " w_date : " + writedate);
			dto = new NewsDTO(bno,title,content,Image,writedate);
			arr.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return arr;
	}
	public NewsDTO getBoardDto(int bno) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM News WHERE bno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		ResultSet rs = pstmt.executeQuery();
		NewsDTO dto = null;
		if(rs.next()) {
			String title = rs.getString("title");
			String content = rs.getString("content");
			String Image = rs.getString("Image_real");
			Date writedate = rs.getDate("w_date");
			System.out.println("title : "+title+" content : "+content + " Image : " + Image + " w_date : " + writedate);
			dto = new NewsDTO(bno,title,content,Image,writedate);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	}
	public ArrayList<NewsDTO> getBoardPage(int pageNum, String searchT, boolean searchB) throws Exception {
		Connection conn2 = getConnection();
		ArrayList<NewsDTO> arr = new ArrayList<NewsDTO>();
		String sql2 = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT * FROM news ORDER BY bno DESC) b1 "+(searchB==true? "WHERE"+searchT:"")+") b2"
				+ " WHERE b2.rnum>=?  AND b2.rnum<=? ";
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		System.out.println(endNum);
		System.out.println(startNum);
		PreparedStatement pstmt2 = conn2.prepareStatement(sql2);
		pstmt2.setInt(1, startNum);
		pstmt2.setInt(2, endNum);
		NewsDTO dto = null;
		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()) {
			int bno = rs2.getInt("bno");
			String title = rs2.getString("title");
			Date writedate = rs2.getDate("w_date");
			String content = rs2.getString("Content");
			String Image = rs2.getString("Image_real");
			dto = new NewsDTO(bno,title,content,Image,writedate);
			arr.add(dto);
		}
		rs2.close();
		pstmt2.close();
		conn2.close();
		return arr;
	}
	public int pageNation(boolean searchB, String searchT) throws Exception{
		Connection conn = getConnection();
		String sql = "select * FROM news " + (searchB==true? "WHERE"+searchT:"");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		while(rs.next()) {
			count++;
		}
		int pageFull = (count+9)/10;
		rs.close();
		pstmt.close();
		conn.close();
		return pageFull;
	}
	public ArrayList<NewsDTO> getBoardPage2(int pageNum, String searchT, boolean searchB) throws Exception {
		Connection conn2 = getConnection();
		ArrayList<NewsDTO> arr = new ArrayList<NewsDTO>();
		String sql2 = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT * FROM news ORDER BY bno DESC) b1 "+(searchB==true? "WHERE"+searchT:"")+") b2"
				+ " WHERE b2.rnum>=?  AND b2.rnum<=? ";
		int endNum = pageNum * 9;
		int startNum = endNum - 8;
		System.out.println(endNum);
		System.out.println(startNum);
		PreparedStatement pstmt2 = conn2.prepareStatement(sql2);
		pstmt2.setInt(1, startNum);
		pstmt2.setInt(2, endNum);
		NewsDTO dto = null;
		ResultSet rs2 = pstmt2.executeQuery();
		while(rs2.next()) {
			int bno = rs2.getInt("bno");
			String title = rs2.getString("title");
			Date writedate = rs2.getDate("w_date");
			String content = rs2.getString("Content");
			String Image = rs2.getString("Image_real");
			dto = new NewsDTO(bno,title,content,Image,writedate);
			arr.add(dto);
		}
		rs2.close();
		pstmt2.close();
		conn2.close();
		return arr;
	}
	public int pageNation2(boolean searchB, String searchT) throws Exception{
		Connection conn = getConnection();
		String sql = "select * FROM news " + (searchB==true? "WHERE"+searchT:"");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		while(rs.next()) {
			count++;
		}
		int pageFull = (count+8)/9;
		rs.close();
		pstmt.close();
		conn.close();
		return pageFull;
	}
	public void insertNews(String title , String content , String Image , String Image_real) throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO News(bno,title,content,Image,Image_real,w_date) VALUES (seq_news.nextval,?,?,?,?,sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, Image);
		pstmt.setString(4, Image_real);
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
		System.out.println("입력되었습니다!");
	}
	
	public void DeleteNews(int bno) throws Exception {
		
		Connection conn = getConnection();
		String sql = "DELETE FROM News WHERE bno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
		System.out.println("삭제되었습니다!");
		
	}
}
