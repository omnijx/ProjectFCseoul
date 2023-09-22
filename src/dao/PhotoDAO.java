package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PhotoDTO;

public class PhotoDAO {
	
	public Connection conn()throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "project";
		String dbpw = "p123";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,dbid,dbpw);
		
		return conn;
	}
	
	public ArrayList<PhotoDTO> photoSelect(String category, String searchValue, int startNum, int endNum) {
		ArrayList<PhotoDTO> photoList = new ArrayList<PhotoDTO>();
		try {
			Connection conn = conn();
			String sql = "";
			if(category.equals("all")) {
				sql = "SELECT b2.*"
						+ " FROM (SELECT rownum rnum, b1.*"
						+ " FROM (SELECT * FROM photo ORDER BY bno) b1) b2"
						+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
			} else if(category.equals("search")) {
				sql = "SELECT b2.*"
						+ " FROM (SELECT rownum rnum, b1.*"
						+ " FROM (SELECT * FROM photo WHERE title LIKE? ORDER BY bno) b1) b2"
						+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
			} else {
				sql = "SELECT b2.*"
						+ " FROM (SELECT rownum rnum, b1.*"
						+ " FROM (SELECT * FROM photo WHERE category=? ORDER BY bno) b1) b2"
						+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
			}
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			if(category.equals("all")){
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
			} else if(category.equals("search")) {
				pstmt.setString(1, "%"+searchValue+"%");
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
			}
			else {
				pstmt.setString(1, category);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
			}
			
			ResultSet rs = pstmt.executeQuery();
			
			int bno = 0;
			String round = "";
			String title = "";
			String r_date = "";
			String image = "";
			String league = "";
			String category2 = "";
			int count = 0;
			while(rs.next()) {
				PhotoDTO pDto = new PhotoDTO(bno, round, title, r_date, image, league, category2, count);
				pDto.setBno(rs.getInt("bno"));
				pDto.setImage(rs.getString("image"));
				pDto.setTitle(rs.getString("title"));
				pDto.setR_date(rs.getString("r_date"));
				photoList.add(pDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return photoList;
	}

	public PhotoDTO photoCount(String category, String searchValue) {
		int bno = 0;
		String round = "";
		String title = "";
		String r_date = "";
		String image = "";
		String league = "";
		String category2 = "";
		int count = 0;
		PhotoDTO pDto = new PhotoDTO(bno, round, title, r_date, image, league, category2, count);
		try {
			Connection conn = conn();
			
			String sql = "";
			if(category.equals("all")) {
		 		sql = "SELECT count(*) FROM photo";
		 	} else if(category.equals("search")) {
		 		sql = "SELECT count(*) FROM photo WHERE title LIKE?";
		 	} else {
		 		sql = "SELECT count(*) FROM photo WHERE category=?";
		 	}
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			if(category.equals("search")) {
		 		pstmt.setString(1, "%"+searchValue+"%");
		 	}
		 	else if(!(category.equals("all"))){
		 		pstmt.setString(1, category);
		 	} 
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pDto.setCount(rs.getInt("count(*)"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pDto;
	}
	
	public PhotoDTO PhotoDetail(int bno, int startNum, int endNum) {
		int bno2 = 0;
		String round = "";
		String title = "";
		String r_date = "";
		String image = "";
		String league = "";
		String category2 = "";
		int count = 0;
		PhotoDTO pDto = new PhotoDTO(bno2, round, title, r_date, image, league, category2, count);
	
		try {
			Connection conn = conn(); 
			String sql = "SELECT b2.*"
					+ " FROM (SELECT rownum rnum, b1.*"
					+ " FROM (SELECT * FROM photo WHERE bno=? ORDER BY bno) b1) b2"
					+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				pDto.setTitle(rs.getString("title"));
				pDto.setR_date(rs.getString("r_date"));
				pDto.setImage(rs.getString("image"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pDto;
	}

	
	
}
