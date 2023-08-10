package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.EShopDetailDto;

public class EShopDetailDao {
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
	
	public EShopDetailDto goodsDetail(int goodsId) {
		Connection conn = null;
		String goodsImg = "";
		String goodsName = "";
		int goodsPrice = 0;
		String img = "";
		String newC = "";
		String best = "";
		String sale = "";
		String goodsSize1 = "";
		int inventory1 = 0;
		int bno = 0;
		String title = "";
		String content = "";
		String writer = "";
		String name = "";
		String wDate = "";
		String category = "";
		String aContent = "";
		String answer = "";
		EShopDetailDto goodsDetail = new EShopDetailDto(goodsImg, goodsName, goodsPrice, img, newC, best, sale, goodsSize1, inventory1, bno, title, content, writer, name, wDate, category, aContent, answer);
		try {
			conn = getConnection();
			String sql = " SELECT g1.*, g2.*, g3.*" +
						 " FROM goods g1, goods_img g2, goods_size g3" +
						 " WHERE g1.goods_id = g2.goods_id AND g1.goods_id=g3.goods_id AND g1.goods_id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				goodsDetail.setGoodsImg(rs.getString("goods_img"));
				goodsDetail.setGoodsName(rs.getString("goods_name"));
				goodsDetail.setGoodsPrice(rs.getInt("price"));
				goodsDetail.setImg(rs.getString("img"));
				goodsDetail.setNewC(rs.getString("new"));
				goodsDetail.setBest(rs.getString("best"));
				goodsDetail.setSale(rs.getString("sale"));
				goodsDetail.setGoodsSize1(rs.getString("goods_size"));
				goodsDetail.setInventory1(rs.getInt("inventory"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return goodsDetail;
	}
	
	public ArrayList<EShopDetailDto> goodsSizeInventory(int goodsId) {
		Connection conn = null;
		ArrayList<EShopDetailDto> sizeInvenList = new ArrayList<EShopDetailDto>();
		String goodsImg = "";
		String goodsName = "";
		int goodsPrice = 0;
		String img = "";
		String newC = "";
		String best = "";
		String sale = "";
		String goodsSize1 = "";
		int inventory1 = 0;
		int bno = 0;
		String title = "";
		String content = "";
		String writer = "";
		String name = "";
		String wDate = "";
		String category = "";
		String aContent = "";
		String answer = "";
		try {
			conn = getConnection();
			String sql = " SELECT g1.*, g2.*, g3.*" +
						 " FROM goods g1, goods_img g2, goods_size g3" +
						 " WHERE g1.goods_id = g2.goods_id AND g1.goods_id=g3.goods_id AND g1.goods_id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				EShopDetailDto goodsDetail = new EShopDetailDto(goodsImg, goodsName, goodsPrice, img, newC, best, sale, goodsSize1, inventory1, bno, title, content, writer, name, wDate, category, aContent, answer);
				goodsDetail.setGoodsImg(rs.getString("goods_img"));
				goodsDetail.setGoodsName(rs.getString("goods_name"));
				goodsDetail.setGoodsPrice(rs.getInt("price"));
				goodsDetail.setImg(rs.getString("img"));
				goodsDetail.setNewC(rs.getString("new"));
				goodsDetail.setBest(rs.getString("best"));
				goodsDetail.setSale(rs.getString("sale"));
				goodsDetail.setGoodsSize1(rs.getString("goods_size"));
				goodsDetail.setInventory1(rs.getInt("inventory"));
				sizeInvenList.add(goodsDetail);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return sizeInvenList;
	}
	
	public ArrayList<EShopDetailDto> goodsQAReview(int goodsId, int startNum, int endNum) {
		Connection conn = null;
		ArrayList<EShopDetailDto> goodsQRList = new ArrayList<EShopDetailDto>();
		String goodsImg = "";
		String goodsName = "";
		int goodsPrice = 0;
		String img = "";
		String newC = "";
		String best = "";
		String sale = "";
		String goodsSize1 = "";
		int inventory1 = 0;
		int bno = 0;
		String title = "";
		String content = "";
		String writer = "";
		String name = "";
		String wDate = "";
		String category = "";
		String aContent = "";
		String answer = "";
		try {
			conn = getConnection();
			String sql = " SELECT g2.*" +
						" FROM(SELECT rownum rnum, g1.*" +
						" FROM(SELECT *" + 
						" FROM goods_qa_review gqr, member m" + 
						" WHERE gqr.writer=m.id AND gqr.goods_id=?" + 
						" ORDER BY bno DESC) g1) g2" +
						" WHERE g2.rnum>=? AND g2.rnum<=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				EShopDetailDto goodsDetail = new EShopDetailDto(goodsImg, goodsName, goodsPrice, img, newC, best, sale, goodsSize1, inventory1, bno, title, content, writer, name, wDate, category, aContent, answer);
				goodsDetail.setBno(rs.getInt("bno"));
				goodsDetail.setTitle(rs.getString("title"));
				goodsDetail.setContent(rs.getString("content"));
				goodsDetail.setWriter(rs.getString("writer"));
				goodsDetail.setName(rs.getString("name"));
				goodsDetail.setwDate(rs.getString("w_date"));
				goodsDetail.setCategory(rs.getString("category"));
				goodsDetail.setaContent(rs.getString("a_content"));
				goodsDetail.setAnswer(rs.getString("answer"));
				goodsQRList.add(goodsDetail);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return goodsQRList;
	}
	public int count(int goodsId) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = getConnection();
			String sql = " SELECT count(*) FROM goods_qa_review WHERE goods_id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count(*)");
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
