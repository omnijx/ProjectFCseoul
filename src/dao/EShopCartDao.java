package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.EShopCartDto;

public class EShopCartDao {
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
	public ArrayList<EShopCartDto> cart(String id) {
		ArrayList<EShopCartDto> cartList = new ArrayList<EShopCartDto>();
		try {
			Connection conn = getConnection();
			String sql ="SELECT * FROM cart WHERE id=? ORDER BY c_date DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			String goodsSize = "";
			int inventory = 0;
			int qty = 0;
			int price = 0;
			String cDate = "";
			while(rs.next()) {
				EShopCartDto cartDto = new EShopCartDto(goodsId, goodsImg, goodsName, goodsSize, inventory, qty, price, cDate);
				cartDto.setGoodsId(rs.getInt("goods_id"));
				cartDto.setGoodsImg(rs.getString("goods_img"));
				cartDto.setGoodsName(rs.getString("goods_name"));
				cartDto.setGoodsSize(rs.getString("goods_size"));
				cartDto.setInventory(rs.getInt("inventory"));
				cartDto.setQty(rs.getInt("O_QUANTITY"));
				cartDto.setPrice(rs.getInt("price"));
				cartDto.setcDate(rs.getString("c_date"));
				cartList.add(cartDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cartList;
	}
}
