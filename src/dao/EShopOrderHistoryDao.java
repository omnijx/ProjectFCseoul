package dao;

import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

import dto.EShopOrderHistoryDto;

public class EShopOrderHistoryDao {
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
	
	public ArrayList<EShopOrderHistoryDto> orderHistory(String id) {
		ArrayList<EShopOrderHistoryDto> OHList = new ArrayList<EShopOrderHistoryDto>();
		try {
			Connection conn = getConnection();
			
			String sql = "SELECT * FROM order_history WHERE id=? ORDER BY pay_date";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			int goodsId = 0;
			int oNum = 0;
			String payWay = "";
			String payDate = "";
			String dState = "";
			String cancel = "";
			String oCheck = "";
			String cState = "";
			String oState = "";
			while(rs.next()) {
				EShopOrderHistoryDto OHDto = new EShopOrderHistoryDto(goodsId, oNum, payWay, payDate, dState, cancel, oCheck, cState, oState);
				OHDto.setGoodsId(rs.getInt("goods_id"));
				OHDto.setoNum(rs.getInt("o_num"));
				OHDto.setPayWay(rs.getString("pay_way"));
				OHDto.setPayDate(rs.getString("pay_date"));
				OHDto.setdState(rs.getString("d_state"));
				OHDto.setCancel(rs.getString("cancel"));
				OHDto.setoCheck(rs.getString("o_check"));
				OHDto.setcState(rs.getString("c_state"));
				OHDto.setoState(rs.getString("o_state"));
				OHList.add(OHDto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return OHList;
	}
}
