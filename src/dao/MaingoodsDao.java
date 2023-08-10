package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.GoodsDto;
import oracle.net.aso.p;

public class MaingoodsDao {
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
	public ArrayList<GoodsDto> getgoods(){
		ArrayList<GoodsDto> goodsllist = new ArrayList<>();
		GoodsDto gdto =null;
		try {
			Connection conn = getConnection();
			String sql =  " SELECT * "
						+ " FROM (SELECT * FROM GOODS WHERE best='https://www.fcseoul.com/resources/shop/_img/icon/icon_best.gif' ORDER BY DBMS_RANDOM.VALUE)"
						+ " WHERE ROWNUM <=3";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int goods_id = rs.getInt("goods_id");
				String goods_img = rs.getString("goods_img");
				String goods_name = rs.getString("goods_name");
				int price = rs.getInt("price");
				String new1 = rs.getString("new");
				String best = rs.getString("best");
				String sale = rs.getString("sale");
				String type = rs.getString("type");
				String recommend = rs.getString("recommend");
				
				gdto = new GoodsDto(goods_id, goods_img, goods_name, price, new1, best, sale, type, recommend);
				goodsllist.add(gdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return goodsllist;
		
	}
	public ArrayList<GoodsDto> getbannergoods(){
		ArrayList<GoodsDto> glist = new ArrayList<>();
		GoodsDto gdto =null;
		try {
			Connection conn  = getConnection();
			String sql =  " SELECT *"
						+ " FROM ("
						+ "    SELECT goods.*, ROWNUM AS rnum"
						+ "    FROM goods"
						+ "    WHERE best = 'https://www.fcseoul.com/resources/shop/_img/icon/icon_best.gif'"
						+ ")"
						+ " WHERE rnum BETWEEN 1 AND 4";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int goods_id = rs.getInt("goods_id");
				String goods_img = rs.getString("goods_img");
				String goods_name = rs.getString("goods_name");
				int price = rs.getInt("price");
				String new1 = rs.getString("new");
				String best = rs.getString("best");
				String sale = rs.getString("sale");
				String type = rs.getString("type");
				String recommend = rs.getString("recommend");
				
				gdto = new GoodsDto(goods_id, goods_img, goods_name, price, new1, best, sale, type, recommend);
				glist.add(gdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return glist;
	}
	public ArrayList<GoodsDto> getbannergoods2(){
		ArrayList<GoodsDto> glist = new ArrayList<>();
		GoodsDto gdto =null;
		try {
			Connection conn  = getConnection();
			String sql =  " SELECT *"
						+ " FROM ("
						+ "    SELECT goods.*, ROWNUM AS rnum"
						+ "    FROM goods"
						+ "    WHERE best = 'https://www.fcseoul.com/resources/shop/_img/icon/icon_best.gif'"
						+ ")"
						+ " WHERE rnum BETWEEN 5 AND 8";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int goods_id = rs.getInt("goods_id");
				String goods_img = rs.getString("goods_img");
				String goods_name = rs.getString("goods_name");
				int price = rs.getInt("price");
				String new1 = rs.getString("new");
				String best = rs.getString("best");
				String sale = rs.getString("sale");
				String type = rs.getString("type");
				String recommend = rs.getString("recommend");
				
				gdto = new GoodsDto(goods_id, goods_img, goods_name, price, new1, best, sale, type, recommend);
				glist.add(gdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return glist;
	}
	public ArrayList<GoodsDto> getbannergoods3(){
		ArrayList<GoodsDto> glist = new ArrayList<>();
		GoodsDto gdto =null;
		try {
			Connection conn  = getConnection();
			String sql =  " SELECT *"
						+ " FROM ("
						+ "    SELECT goods.*, ROWNUM AS rnum"
						+ "    FROM goods"
						+ "    WHERE best = 'https://www.fcseoul.com/resources/shop/_img/icon/icon_best.gif'"
						+ ")"
						+ " WHERE rnum BETWEEN 9 AND 12";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int goods_id = rs.getInt("goods_id");
				String goods_img = rs.getString("goods_img");
				String goods_name = rs.getString("goods_name");
				int price = rs.getInt("price");
				String new1 = rs.getString("new");
				String best = rs.getString("best");
				String sale = rs.getString("sale");
				String type = rs.getString("type");
				String recommend = rs.getString("recommend");
				
				gdto = new GoodsDto(goods_id, goods_img, goods_name, price, new1, best, sale, type, recommend);
				glist.add(gdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return glist;
	}
	public ArrayList<GoodsDto> getrecomand(){
		ArrayList<GoodsDto> glist = new ArrayList<>();
		GoodsDto gdto =null;
		try {
			Connection conn  = getConnection();
			String sql =  " SELECT *"
						+ " FROM ("
						+ "    SELECT goods.*"
						+ "    FROM goods"
						+ "    where RECOMMEND = 'Y'"
						+ "    ORDER BY DBMS_RANDOM.VALUE"
						+ ")"
						+ " WHERE rownum <=1";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int goods_id = rs.getInt("goods_id");
				String goods_img = rs.getString("goods_img");
				String goods_name = rs.getString("goods_name");
				int price = rs.getInt("price");
				String new1 = rs.getString("new");
				String best = rs.getString("best");
				String sale = rs.getString("sale");
				String type = rs.getString("type");
				String recommend = rs.getString("recommend");
				
				gdto = new GoodsDto(goods_id, goods_img, goods_name, price, new1, best, sale, type, recommend);
				glist.add(gdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return glist;
	}
	
	
	
}
