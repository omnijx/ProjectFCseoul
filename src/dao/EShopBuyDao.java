package dao;

import java.sql.*;

import dto.EShopBuyDto;

public class EShopBuyDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "p123";
	
		Class.forName(driver);  // JDBC �뱶�씪�씠踰� 濡쒕뵫.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB �젒�냽�쓣 �떆�룄 ---> Connection媛앹껜瑜� 由ы꽩.
		return conn;
	}
	
	public boolean insertPayment(String id,String delOption,String oName,String oEmail,String oPhone,String oPostalNum,String oAddress,String req,String payWay, String oQty, String goodsId, String goodsSize, int oNum) {
		Connection conn = null;
		int ref = 0;
		try {
			conn = getConnection();
			
			String sql = "INSERT INTO payment(id, goods_id, delivery_way, pay_way, request, o_name, phone, post_num, address, o_qty, goods_size, o_email, o_num)" +
						 "Values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, goodsId);
			pstmt.setString(3, delOption);
			pstmt.setString(4, payWay);
			pstmt.setString(5, req);
			pstmt.setString(6, oName);
			pstmt.setString(7, oPhone);
			pstmt.setString(8, oPostalNum);
			pstmt.setString(9, oAddress);
			pstmt.setString(10, oQty);
			pstmt.setString(11, goodsSize);
			pstmt.setString(12, oEmail);
			pstmt.setInt(13, oNum);
			
			ref = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return true;
	}
	
	public EShopBuyDto buyPrd(String id, String goodsId, String goodsSize) {
		String oNum = "";
		String goodsImg = "";
		String goodsName = "";
		String payWay = "";
		String payDate = "";
		String dState = "";
		String oCheck = "";
		String oState = "";
		String oQty = "";
		int price = 0;
		String name = "";
		String email = "";
		String phone = "";
		String address = "";
		String postalNum = "";
		EShopBuyDto buyDto = new EShopBuyDto(goodsId, oNum, goodsImg, goodsName, payWay, payDate, dState, oCheck, oState, goodsSize, oQty, price, name, email, phone, address, postalNum);
		try {
			Connection conn = getConnection();
			String sql = " SELECT *" + 
						 " FROM goods g1, goods_size g2" + 
						 " WHERE g1.goods_id=g2.goods_id AND g1.goods_id=? AND g2.goods_size=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodsId);
			pstmt.setString(2,goodsSize);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				buyDto.setGoodsId(rs.getString("goods_id"));
				buyDto.setGoodsImg(rs.getString("goods_img"));
				buyDto.setGoodsName(rs.getString("goods_name"));
				buyDto.setGoodsSize(rs.getString("goods_size"));
				buyDto.setPrice(rs.getInt("price"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return buyDto;
	}
	
	public EShopBuyDto buyInfo(String id) {
		String goodsId = "";
		String goodsImg = "";
		String goodsName = "";
		String payWay = "";
		String payDate = "";
		String dState = "";
		String oCheck = "";
		String oState = "";
		String goodsSize = "";
		String oNum = "";
		String oQty = "";
		int price = 0;
		String name = "";
		String email = "";
		String phone = "";
		String address = "";
		String postalNum = "";
		EShopBuyDto BIDto = new EShopBuyDto(goodsId, oNum, goodsImg, goodsName, payWay, payDate, dState, oCheck, oState, goodsSize, oQty, price, name, email, phone, address, postalNum);
		try {
			Connection conn = getConnection();
			String sql = "SELECT *" + 
						 " FROM member" + 
						 " WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BIDto.setName(rs.getString("name"));
				BIDto.setEmail(rs.getString("email"));
				BIDto.setPhone(rs.getString("phone"));
				BIDto.setAddress(rs.getString("address"));
				BIDto.setPostalNum(rs.getString("postal_code"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return BIDto;
	}
	
	public EShopBuyDto buyCheckSelect(String id, String goodsId, String goodsSize, String oQty) {
		String oNum = "";
		String goodsImg = "";
		String goodsName = "";
		String payWay = "";
		String payDate = "";
		String dState = "";
		String oCheck = "";
		String oState = "";
		int price = 0;
		String name = "";
		String email = "";
		String phone = "";
		String address = "";
		String postalNum = "";
		EShopBuyDto buyDto = new EShopBuyDto(goodsId, oNum, goodsImg, goodsName, payWay, payDate, dState, oCheck, oState, goodsSize, oQty, price, name, email, phone, address, postalNum);
		try {
			Connection conn = getConnection();
			String sql = " SELECT *" + 
						 " FROM payment" + 
						 " WHERE id=? AND goods_id=? AND goods_size=? AND o_qty=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2,goodsId);
			pstmt.setString(3,goodsSize);
			pstmt.setString(4,oQty);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				buyDto.setName(rs.getString("o_name"));
				buyDto.setEmail(rs.getString("o_email"));
				buyDto.setPhone(rs.getString("phone"));
				buyDto.setAddress(rs.getString("address"));
				buyDto.setPostalNum(rs.getString("post_num"));
				buyDto.setoCheck(rs.getString("delivery_way"));
				buyDto.setPayWay(rs.getString("pay_way"));
				buyDto.setoState(rs.getString("request"));
				buyDto.setoNum(rs.getString("o_num"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return buyDto;
	}
	
	
	public boolean insertOrderHistory(String id, String goodsId, String goodsSize, String oQty) {
		Connection conn = null;
		try {
			conn = getConnection();
			
			String sqlSel = "SELECT * FROM payment WHERE id=? AND goods_id=? AND goods_size=? AND o_qty=?";
			String sql = "INSERT INTO order_history(id, goods_id, o_num, pay_way, o_check, o_qty)" +
						 "Values(?, ?, ?, ?, ?, ?)";
			
			int oNum = 0;
			String payWay = "";
			String delOption = "";
			
			PreparedStatement pstmt1 = conn.prepareStatement(sql);
			PreparedStatement pstmt2 = conn.prepareStatement(sqlSel);
			pstmt2.setString(1, id);
			pstmt2.setString(2, goodsId);
			pstmt2.setString(3, goodsSize);
			pstmt2.setString(4, oQty);
			
			ResultSet rs = pstmt2.executeQuery();
			if(rs.next()) {
				oNum = rs.getInt("o_num");
				payWay = rs.getString("pay_way");
				delOption = rs.getString("delivery_way");
			}
			rs.close();
			pstmt2.close();
			
			pstmt1.setString(1, id);
			pstmt1.setString(2, goodsId);
			pstmt1.setInt(3, oNum);
			pstmt1.setString(4, payWay);
			pstmt1.setString(5, delOption);
			pstmt1.setString(6, oQty);
			
			
			pstmt1.executeUpdate();
			
			pstmt1.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean paymentDelete(String id) {
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = "DELETE FROM payment WHERE id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
}
