package dao;

import java.sql.*;

import dto.EShopInsertActionDto;

public class EShopUpdateActionDao {
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
	
	public EShopInsertActionDto goodsSel(String goodsId, String goodsSize) {
		Connection conn = null;
		String goodsImg = "";
		String goodsName = "";
		int inventory = 0;
		int price = 0;
		EShopInsertActionDto caDto = new EShopInsertActionDto(goodsImg, goodsName, inventory, price);
		try {
			conn = getConnection();
			
			String sql = "SELECT * FROM goods g1, goods_size g2 WHERE g1.goods_id=g2.goods_id AND g1.goods_id=? AND g2.goods_size=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  goodsId);
			pstmt.setString(2,  goodsSize);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				caDto.setGoodsImg(rs.getString("goods_img"));
				caDto.setGoodsName(rs.getString("goods_name"));
				caDto.setInventory(rs.getInt("inventory"));
				caDto.setPrice(rs.getInt("price"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return caDto;
	}
	
	@SuppressWarnings("finally")
	public boolean cartDuplication(String goods_id,String goods_size1,String quantity,String id) { //수량변경
		int ref = 0;
		Connection conn = null;
		try {
			
			conn = getConnection();
			String sql = "SELECT o_quantity FROM cart WHERE goods_id = ? AND goods_size = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goods_id);
			pstmt.setString(2,goods_size1);
			
			String o_quantity = "";
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				o_quantity = rs.getString("o_quantity");
			}
			
			String sql1 = "UPDATE cart SET o_quantity = ? WHERE id= ? AND goods_id =? AND goods_size = ? ";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, quantity);
			pstmt1.setString(2, id);        
			pstmt1.setString(3, goods_id);
			pstmt1.setString(4, goods_size1);
			
			if(!(o_quantity.equals(quantity))) {
				ref = pstmt1.executeUpdate();
			}
			rs.close();
			pstmt.close();
			pstmt1.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
//			if(ref == 1) {
				 return true;
//			 } else {
//				 return false;
//			 }
		}
	}
	
	 @SuppressWarnings("finally")
	public boolean insertCart(String id,String goods_id,String goods_img,String goods_name,String goods_size1,int inventory1,String quantity,int price2) {
		 Connection conn = null;
		 int ref = 0;
		 try {
			 conn = getConnection();
			 
			 String sql = " INSERT INTO cart(id,goods_id,goods_img,goods_name,goods_size,inventory,o_quantity,price)"
					 	+ " VALUES(?,?,?,?,?,?,?,?)";
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1,id);
			 pstmt.setString(2, goods_id);
			 pstmt.setString(3, goods_img);
			 pstmt.setString(4, goods_name);
			 pstmt.setString(5, goods_size1);
			 pstmt.setInt(6, inventory1);
			 pstmt.setString(7,quantity);
			 pstmt.setInt(8,price2);
			 
			 String sql1 = " SELECT count(*) "
					 	 + " FROM cart "
					 	 + " WHERE goods_id =? AND goods_size = ? AND id = ?";
			 PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			 pstmt1.setString(1, goods_id);
			 pstmt1.setString(2, goods_size1);
			 pstmt1.setString(3, id);
			 int cnt =0;
			 ResultSet rs = pstmt1.executeQuery();
			 while(rs.next()) {
				 cnt = rs.getInt("count(*)"); 
			 }
			 System.out.println(cnt);
			 if(inventory1 == 0) {
				 cnt = 1;
			 }
			 if(cnt==0) {
				 ref = pstmt.executeUpdate();
			 }else {
				 cartDuplication(goods_id, goods_size1, quantity, id);
				 ref = 1;
			 }
			 rs.close();
			 pstmt1.close();
			 pstmt.close();
			 conn.close();
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 if(ref == 1) {
				 return true;
			 } else {
				 return false;
			 }
		 }
	}
	 @SuppressWarnings("finally")
	public boolean insertWishList(String id,String goods_id) {
		 Connection conn = null;
		 int ref = 0;
		 try {
			 conn = getConnection();
			 
			 String sql =  " SELECT goods_id,goods_img,goods_name,price "
					 + " FROM goods "
					 + " WHERE goods_id = ?";
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, goods_id);
			 String goods_img = "";
			 String goods_name="";
			 int price =0;
			 ResultSet rs = pstmt.executeQuery();
			 if(rs.next()) {
				 goods_id = rs.getString("goods_id");
				 goods_img = rs.getString("goods_img");
				 goods_name = rs.getString("goods_name");
				 price = rs.getInt("price");
			 }
			 rs.close();
			 pstmt.close();
			 
			 String sql1 =  " INSERT INTO wish_list (id, goods_id, goods_img, goods_name, price, w_date)"
					 + " VALUES(?,?,?,?,?,sysdate)";
			 PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			 pstmt1.setString(1, id);
			 pstmt1.setString(2, goods_id);
			 pstmt1.setString(3,goods_img);
			 pstmt1.setString(4,goods_name);
			 pstmt1.setInt(5, price);
			 
			 String sql5 = "SELECT goods_id FROM wish_list WHERE goods_id = ?";
			 PreparedStatement pstmt5 = conn.prepareStatement(sql5);
			 pstmt5.setString(1, goods_id);
			 ResultSet rs5 = pstmt5.executeQuery();
			 int goods_id23 = 0;
			 if(rs5.next()) {
				 goods_id23 = rs5.getInt("goods_id");
			 }
			 if(goods_id23 == 0) {
				 ref = pstmt1.executeUpdate();
			 }
			 
			 rs5.close();
			 pstmt5.close();
			 pstmt1.close();
			 conn.close();
			 
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
//			 if(ref == 1) {
				 return true;
//			 } else {
//				 return false;
//			 }
		 }
	 }
	 
	 @SuppressWarnings("finally")
	public boolean cartDelete(String id, String goodsId, String goodsSize) {
		 int ref = 0;
		 Connection conn = null;
		 try {
			 conn = getConnection();
			 
			 String sql = "DELETE FROM cart WHERE id=? AND goods_id=? AND goods_size=?";
			 
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setNString(1,  id);
			 pstmt.setString(2, goodsId);
			 pstmt.setNString(3, goodsSize);
			 
			 ref = pstmt.executeUpdate();
			 
			 pstmt.close();
			 conn.close();
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
//			 if(ref == 1) {
				 return true;
//			 } else {
//				 return false;
//			 }
		 }
	 }
	 @SuppressWarnings("finally")
		public boolean wishListDeleteAll(String id) {
			 int ref = 0;
			 Connection conn = null;
			 try {
				 conn = getConnection();
				 
				 String sql = "DELETE FROM wish_list WHERE id=?";
				 
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 
				 pstmt.setString(1,  id);
				 
				 ref = pstmt.executeUpdate();
				 
				 pstmt.close();
				 conn.close();
			 } catch(Exception e) {
				 e.printStackTrace();
			 } finally {
//				 if(ref == 1) {
					 return true;
//				 } else {
//					 return false;
//				 }
			 }
		 }
	 @SuppressWarnings("finally")
	public boolean wishListDeleteSelect(String id, String goodsId) {
		 int ref = 0;
		 Connection conn = null;
		 try {
			 conn = getConnection();
			 
			 String sql = "DELETE FROM wish_list WHERE id=? AND goods_id=?";
			 
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1,  id);
			 pstmt.setString(2, goodsId);
			 
			 ref = pstmt.executeUpdate();
			 
			 pstmt.close();
			 conn.close();
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
//			 if(ref == 1) {
				 return true;
//			 } else {
//				 return false;
//			 }
		 }
	 }
	 
	
}
