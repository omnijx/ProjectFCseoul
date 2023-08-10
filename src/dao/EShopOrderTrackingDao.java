package dao;

import java.sql.*;

import dto.EShopOrderTrackingDto;

public class EShopOrderTrackingDao {
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
	public EShopOrderTrackingDto orderTracking(int oNum, String id) {
		int goodsId = 0;
		String goodsImg = "";
		String goodsName = "";
		String payWay = "";
		String payDate = "";
		String dState = "";
		String oCheck = "";
		String oState = "";
		String goodsSize = "";
		int oQty = 0;
		int price = 0;
		String name = "";
		String email = "";
		String phone = "";
		String address = "";
		String postalNum = "";
		EShopOrderTrackingDto OTDto = new EShopOrderTrackingDto(goodsId, oNum, goodsImg, goodsName, payWay, payDate, dState, oCheck, oState, goodsSize, oQty, price, name, email, phone, address, postalNum);
		try {
			Connection conn = getConnection();
			String sql = "SELECT *" + 
						 " FROM order_history oh, goods g, goods_size gs" + 
						 " WHERE oh.goods_id=g.goods_id AND oh.goods_id=gs.goods_id AND g.goods_id=gs.goods_id AND id=? AND o_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, id);
			pstmt.setInt(2, oNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				OTDto.setGoodsId(rs.getInt("goods_id"));
				OTDto.setGoodsImg(rs.getString("goods_img"));
				OTDto.setGoodsName(rs.getString("goods_name"));
				OTDto.setPayWay(rs.getString("pay_way"));
				OTDto.setdState(rs.getString("d_state"));
				OTDto.setoCheck(rs.getString("o_check"));
				OTDto.setoState(rs.getString("o_state"));
				OTDto.setGoodsSize(rs.getString("goods_size"));
				OTDto.setoQty(rs.getInt("o_qty"));
				OTDto.setPrice(rs.getInt("price"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return OTDto;
	}
	
	public EShopOrderTrackingDto orderInfo(int oNum, String id) {
		int goodsId = 0;
		String goodsImg = "";
		String goodsName = "";
		String payWay = "";
		String payDate = "";
		String dState = "";
		String oCheck = "";
		String oState = "";
		String goodsSize = "";
		int oQty = 0;
		int price = 0;
		String name = "";
		String email = "";
		String phone = "";
		String address = "";
		String postalNum = "";
		EShopOrderTrackingDto OIDto = new EShopOrderTrackingDto(goodsId, oNum, goodsImg, goodsName, payWay, payDate, dState, oCheck, oState, goodsSize, oQty, price, name, email, phone, address, postalNum);
		try {
			Connection conn = getConnection();
			String sql = "SELECT *" + 
						 " FROM order_history oh, member m" + 
						 " WHERE oh.id=m.id AND oh.id=? AND o_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, oNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				OIDto.setName(rs.getString("name"));
				OIDto.setEmail(rs.getString("email"));
				OIDto.setPhone(rs.getString("phone"));
				OIDto.setAddress(rs.getString("address"));
				OIDto.setPostalNum(rs.getString("postal_code"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return OIDto;
	}
	
}
