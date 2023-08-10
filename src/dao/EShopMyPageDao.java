package dao;

import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;

import dto.EShopMyPageDto;

public class EShopMyPageDao {
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
	public ArrayList<EShopMyPageDto> myPageOH(String id) {
		ArrayList<EShopMyPageDto> myPageOHList = new ArrayList<EShopMyPageDto>();
		try {
			Connection conn = getConnection();
			
			String sql = " SELECT * FROM order_history WHERE id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			String payDate = "";
			int oNum = 0;
			String payWay = "";
			String dState = "";
			String wDate = "";
			int price = 0;
			while(rs.next()) {
				EShopMyPageDto mpohDto = new EShopMyPageDto(goodsId, goodsImg, goodsName, payDate, oNum, payWay, dState, id, wDate, price);
				mpohDto.setoNum(rs.getInt("o_num"));
				mpohDto.setPayDate(rs.getString("pay_date"));
				mpohDto.setPayWay(rs.getString("pay_way"));
				mpohDto.setdState(rs.getString("d_state"));
				myPageOHList.add(mpohDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return myPageOHList;
	}
	public ArrayList<EShopMyPageDto> myPageWL(String id) {
		ArrayList<EShopMyPageDto> myPageWLList = new ArrayList<EShopMyPageDto>();
		
		try {
			Connection conn = getConnection();
			
			String sql = "SELECT * FROM wish_list WHERE id=? AND rownum<=5";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			int goodsId = 0;
			String goodsImg = "";
			String goodsName = "";
			String payDate = "";
			int oNum = 0;
			String payWay = "";
			String dState = "";
			String wDate = "";
			int price = 0;
			while(rs.next()) {
				EShopMyPageDto mpwlDto = new EShopMyPageDto(goodsId, goodsImg, goodsName, payDate, oNum, payWay, dState, id, wDate, price);
				mpwlDto.setGoodsId(rs.getInt("goods_id"));
				mpwlDto.setGoodsImg(rs.getString("goods_img"));
				mpwlDto.setGoodsName(rs.getString("goods_name"));
				mpwlDto.setwDate(rs.getString("w_date"));
				mpwlDto.setPrice(rs.getInt("price"));
				myPageWLList.add(mpwlDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return myPageWLList;
		
	}
}
