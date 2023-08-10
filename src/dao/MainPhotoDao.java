package dao;

import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

import dto.MainPhotoDto;



public class MainPhotoDao {
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
/*	public ArrayList<PhotoDto> getPhotobanner(){
		System.out.println("getPhotobanner 실행!");
		PhotoDto pdto = null;
		ArrayList<PhotoDto> photoBannerList = new ArrayList<PhotoDto>();
		try {
			Connection conn = getConnection();
			String sql =  " SELECT *"
						+ " FROM(select * from photo order by r_date DESC)"
						+ " WHERE ROWNUM <= 2";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String round = rs.getString("round");
				String title = rs.getString("title");
				String r_date = rs.getString("r_date");
				String image = rs.getString("image");
				String league = rs.getString("league");
				String category = rs.getString("category");
				pdto = new PhotoDto(bno,round, title,r_date,image,league , category);
				System.out.println("round : " + round + "title : " + title + "r_date : " + r_date + "image : " + image +"league : "+ league+"category : "+ category);
				photoBannerList.add(pdto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("tq");
		}
		return photoBannerList;
	}*/
	public ArrayList<MainPhotoDto> getPhotoimg(){
		ArrayList<MainPhotoDto> photoBanner = new ArrayList<MainPhotoDto>();
		System.out.println("getphoto");
		try {
			Connection conn = getConnection();
			String sql = "SELECT *  FROM (SELECT * FROM photo ORDER BY r_date DESC)  WHERE rownum <= 2";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				System.out.println("while문!");
				int bno = rs.getInt("bno");
				String round = rs.getString("round");
				String title = rs.getString("title");
				String r_date = rs.getString("r_date");
				String image = rs.getString("image");
				String league = rs.getString("league");
				String category =rs.getString("category");
				MainPhotoDto pdto  = new MainPhotoDto(bno,round,title,r_date,image,league,category);
				photoBanner.add(pdto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return photoBanner;
	}
	
	
	public ArrayList<MainPhotoDto> getPhotoselec(int photonum){
		ArrayList<MainPhotoDto> photolist = new ArrayList<>();
		try {
			Connection conn = getConnection();
			
			int endNum = photonum*15;
			int startNum = endNum-14;
			
			String sql =  " SELECT *"
						+ " FROM (select rownum rnum, t1.*"
						+ " from (select * from photo order by bno desc)t1)t2"
						+ " WHERE t2.rnum>=? AND t2.rnum<=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String round = rs.getString("round");
				String title = rs.getString("title");
				String r_date = rs.getString("r_date");
				String image = rs.getString("image");
				String league = rs.getString("league");
				String category =rs.getString("category");
				MainPhotoDto pdto = new MainPhotoDto(bno, round, title, r_date, image, league, category);
				
				photolist.add(pdto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return photolist;
	}
	
	
}
