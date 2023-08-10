package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.NoticeDTO;

public class NoticeDAO {
	
	public Connection conn()throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "project";
		String dbpw = "p123";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,dbid,dbpw);
		
		return conn;
	}
	
	public ArrayList<NoticeDTO> noticeSelect(int startNum, int endNum) {
		ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		try {
			
		Connection conn = conn();
		
		String sql = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT * FROM notice ORDER BY bno DESC) b1) b2"
				+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNum);
		pstmt.setInt(2, endNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		int bno = 0;
		String title = "";
		int w_date = 0;
		String content = "";
		int count = 0;
		
		while(rs.next()) {
			NoticeDTO nDto = new NoticeDTO(bno, title, w_date, content, count);
			nDto.setBno(rs.getInt("bno"));
			nDto.setTitle(rs.getString("title"));
			nDto.setContent(rs.getString("content"));
			nDto.setW_date(rs.getInt("w_date"));
			noticeList.add(nDto);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public NoticeDTO noticeCount() {
		
		int bno = 0;
		String title = "";
		int w_date = 0;
		String contnet = "";
		int count = 0;
		
		NoticeDTO nDto = new NoticeDTO(bno, title, w_date, contnet, count);
		
		try {
			Connection conn = conn();
			
			String sql = "SELECT count(*) FROM notice";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				nDto.setCount(rs.getInt("count(*)"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return nDto;
	}
	
	public NoticeDTO noticeDetail(int bno) {
		String title = "";
		int w_date = 0;
		String content = "";
		int count = 0;
		NoticeDTO nDto = new NoticeDTO(bno, title, w_date, content, count);
		try {
			Connection conn = conn();
			String sql = "SELECT * FROM notice WHERE bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				nDto.setTitle(rs.getString("title"));
				nDto.setContent(rs.getString("content"));
				nDto.setW_date(rs.getInt("w_date"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return nDto;
	}
	
	public boolean noticeWrite(String title, String content) {
		int ref = 0;
		try {
			Connection conn = conn();
			String sql = " INSERT INTO notice(bno, title, w_date, content)"
					   + " VALUES(seq_notice.nextval, ?, TO_NUMBER(TO_CHAR(sysdate, 'YYYYMMDD')), ?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,title);
			pstmt.setString(2,content);
			
			ref = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(ref == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean noticeDelete(int bno) {
		int ref = 0;
		try {
			Connection conn = conn();
			
			String sql = "DELETE FROM notice WHERE bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			ref = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(ref == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public NoticeDTO noticeUpdatePage(int bno) {
		String title = "";
		int w_date = 0;
		String content = "";
		int count = 0;
		
		NoticeDTO nDto = new NoticeDTO(bno, title, w_date, content, count);
		
		try {
			Connection conn = conn();
			
			String sql = "SELECT * FROM notice WHERE bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nDto.setTitle(rs.getString("title"));
				nDto.setW_date(rs.getInt("w_date"));
				nDto.setContent(rs.getString("content"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return nDto;
	}
	
	public boolean noticeUpdateAction(int bno, String title, String content) {
		int ref = 0;
		try {
			Connection conn = conn();
			
			String sql = "UPDATE notice SET title=?,content=? WHERE bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			
			ref = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(ref == 1) {
			return true;
		} else {
			return false;
		}
	}

}
