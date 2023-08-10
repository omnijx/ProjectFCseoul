package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.EShopMainDto;

public class EShopMainDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "p123";
	
		Class.forName(driver);  // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB 접속을 시도 ---> Connection객체를 리턴.
		return conn;
	}
	public ArrayList<EShopMainDto> EShopMainPrd(String cate) {
		ArrayList<EShopMainDto> PrdList = new ArrayList<EShopMainDto>();
		try {
			Connection conn = getConnection();
			
			String prdSql = "";
			if(cate.equals("new")) {
				prdSql = " SELECT *"
					   + " FROM (SELECT * FROM goods ORDER BY DBMS_RANDOM.RANDOM)" 
					   + " WHERE new='https://www.fcseoul.com/resources/shop/_img/icon/icon_new.gif' AND rownum<=5";
			} else if(cate.equals("recommend")) {
				prdSql = " SELECT *"
					   + " FROM (SELECT * FROM goods ORDER BY DBMS_RANDOM.RANDOM)" 
		   			   + " WHERE recommend='Y' AND rownum<=5";
			}
			
			
			PreparedStatement pstmt = conn.prepareStatement(prdSql);
			
			ResultSet rs = pstmt.executeQuery();
			
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			int price = 0;
			while(rs.next()) {
				EShopMainDto dto = new EShopMainDto(goodsId, goodsImg, goodsName, price);
				dto.setGoodsId(rs.getInt("goods_id"));
				dto.setGoodsImg(rs.getString("goods_img"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setPrice(rs.getInt("price"));
				PrdList.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return PrdList;
	}
	public ArrayList<EShopMainDto> EShopMainBestPrd(String type) {
		ArrayList<EShopMainDto> bestPrdList = new ArrayList<EShopMainDto>();
		try {
			
			Connection conn = getConnection();
			
			String bestPrdSql = " SELECT *"
					+ " FROM (SELECT * FROM goods ORDER BY DBMS_RANDOM.RANDOM)" 
					+ " WHERE type=? AND best='https://www.fcseoul.com/resources/shop/_img/icon/icon_best.gif' AND rownum<=4";
			
			PreparedStatement pstmt = conn.prepareStatement(bestPrdSql);
			pstmt.setString(1, type);
			
			ResultSet rs = pstmt.executeQuery();
			
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			int price = 0;
			while(rs.next()) {
				EShopMainDto dto = new EShopMainDto(goodsId, goodsImg, goodsName, price);
				dto.setGoodsId(rs.getInt("goods_id"));
				dto.setGoodsImg(rs.getString("goods_img"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setPrice(rs.getInt("price"));
				bestPrdList.add(dto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bestPrdList;
	}
	public ArrayList<EShopMainDto> EShopMainSearch(String searchText) {
		ArrayList<EShopMainDto> searchList = new ArrayList<EShopMainDto>();
		try {
			Connection conn = getConnection();
			
			String sql = "SELECT * FROM goods WHERE goods_name LIKE'%?%'";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			
			ResultSet rs = pstmt.executeQuery();
			
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			int price = 0;
			while(rs.next()) {
				EShopMainDto dto = new EShopMainDto(goodsId, goodsImg, goodsName, price);
				dto.setGoodsId(rs.getInt("goods_id"));
				dto.setGoodsImg(rs.getString("goods_img"));
				dto.setGoodsName(rs.getString("goods_name"));
				dto.setPrice(rs.getInt("price"));
				searchList.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return searchList;
		
	}
	
	
}
