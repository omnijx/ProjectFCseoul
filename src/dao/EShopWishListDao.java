package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.EShopWishListDto;

public class EShopWishListDao {
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
	public ArrayList<EShopWishListDto> wishList(String id, int startNum, int endNum) {
		ArrayList<EShopWishListDto> wishListList = new ArrayList<EShopWishListDto>();
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM wish_list WHERE id=? ORDER BY w_date DESC";
			sql = " SELECT g2.*"
					+ " FROM(SELECT rownum rnum, g1.*"
					+ " FROM(SELECT * FROM wish_list WHERE id=? ORDER BY w_date DESC) g1) g2"
					+ " WHERE g2.rnum>=? AND g2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2,  startNum);
			pstmt.setInt(3,  endNum);
			ResultSet rs = pstmt.executeQuery();
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			int price = 0;
			String wDate = "";
			int count = 0;
			while(rs.next()) {
				EShopWishListDto wlDto = new EShopWishListDto(goodsId, goodsImg, goodsName, price, wDate, count);
				wlDto.setGoodsId(rs.getInt("goods_id"));
				wlDto.setGoodsImg(rs.getString("goods_img"));
				wlDto.setGoodsName(rs.getString("goods_name"));
				wlDto.setPrice(rs.getInt("price"));
				wlDto.setwDate(rs.getString("w_date"));
				wishListList.add(wlDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return wishListList;
	}
	
	public EShopWishListDto wishListCount(String id) {
		int goodsId = 0;
		String goodsImg = "";
		String goodsName = "";
		int price = 0;
		String wDate = "";
		int count = 0;
		EShopWishListDto wlCount = new EShopWishListDto(goodsId, goodsImg, goodsName, price, wDate, count); 
		try {
			Connection conn = getConnection();
			String sql = "SELECT count(*) FROM wish_list WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				wlCount.setCount(rs.getInt("count(*)"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return wlCount;
	}
}
