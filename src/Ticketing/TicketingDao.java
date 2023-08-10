package Ticketing;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Objects;

import org.json.simple.JSONArray;


public class TicketingDao {
	public ArrayList<TicketingDto> tDtoArr = new ArrayList<TicketingDto>();
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "p1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		return conn;
	}
	public String getDayOfWeek(String date) throws Exception{
		Connection conn = getConnection();
		String dateS = date.substring(0, date.length()-3);
		String sql = "SELECT TO_CHAR(TO_DATE((SELECT m_date FROM match_info2 where m_date = ?),'YYYY-MM-DD HH24:MI'), 'dy') AS \"day\" FROM dual";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dateS);
		ResultSet rs = pstmt.executeQuery();
		String DayOfWeek = null;
		if(rs.next()) {
			DayOfWeek = rs.getString("day");
		}
		return DayOfWeek;
	}
	public homeMatchDto selectMatchDto() throws Exception {
		Connection conn = getConnection();
		homeMatchDto hDto = null;
		String sql = "SELECT * FROM MATCH_INFO2 WHERE m_date = (SELECT min(m_date) FROM Match_info2 WHERE m_date > sysdate AND is_home = 'TRUE')";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String home_name = rs.getString("home_name");
			String home_logo = rs.getString("home_logo");
			String away_name = rs.getString("away_name");
			String away_logo = rs.getString("away_logo");
			String stadium = rs.getString("stadium");
			String date = rs.getString("m_date");
			hDto = new homeMatchDto(home_name,home_logo,away_name,away_logo,stadium,date);
		}
		return hDto;
	}
	public ArrayList<homeMatchDto> getMatchDto() throws Exception {
		homeMatchDto hDto = null;
		Connection conn = getConnection();
		ArrayList<homeMatchDto> arr = new ArrayList<homeMatchDto>();
		String sql = "SELECT * FROM Match_info2 WHERE m_date > sysdate AND is_home = 'TRUE' ORDER BY m_date";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String home_name = rs.getString("home_name");
			String home_logo = rs.getString("home_logo");
			String away_name = rs.getString("away_name");
			String away_logo = rs.getString("away_logo");
			String stadium = rs.getString("stadium");
			String date = rs.getString("m_date");
			System.out.println("date : " + date);
			hDto = new homeMatchDto(home_name,home_logo,away_name,away_logo,stadium,date);
			arr.add(hDto);
		}
		return arr;
	}
	public ArrayList<TicketingDto> getTicketDto(JSONArray jsonarr) throws Exception {
		System.out.println("연결 성공!"+jsonarr);
		Connection conn = getConnection();
		TicketingDto tDto = null;
		for(int i = 0; i< jsonarr.size(); i++) {
			String sql = "SELECT * FROM seat WHERE x_start = ? AND y_start = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			JSONArray jObj = (JSONArray) jsonarr.get(i);
			System.out.println("jobj : "+ jObj);
			int x_start = Integer.parseInt((String) jObj.get(0));
			System.out.println("x_start : "+ x_start);
			int y_start = Integer.parseInt((String) jObj.get(1));
			System.out.println("y_start : "+ y_start);
			pstmt.setInt(1, x_start);
			pstmt.setInt(2, y_start);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String section = rs.getString("section");
				String sold_out = rs.getString("sold_out");
				String round = rs.getString("round");
				int x_start1 = rs.getInt("x_start");
				int x_end = rs.getInt("x_end");
				int y_start1 = rs.getInt("y_start");
				int y_end = rs.getInt("x_end");
				tDto = new TicketingDto(section, sold_out,x_start1, x_end, y_start1, y_end, round);
			}
			tDtoArr.add(tDto);
			rs.close();
			pstmt.close();
		}
		System.out.println(tDtoArr);
		conn.close();
		return tDtoArr;
	}
	public int insertTicketingInfo(ArrayList <TicketingDto> arr) throws Exception {
		System.out.println("insertTicketingInfo");
		System.out.println("arraysize : "+arr.size());
		Connection conn = getConnection();
			String sql = "INSERT INTO ticketing(ticketing_number,seat_num1,seat_num2,seat_num3,seat_num4,seat_num5,seat_num6) "
					+ "VALUES(seq_bno_ticketing.nextval,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i = 0;
			for (i = 0; i < arr.size(); i++) {
				pstmt.setString(i+1, arr.get(i).getSection());
				System.out.println(arr.get(i).getSection());
			}
			if (i>=arr.size() && i<6) {
				for (int j = i; j < 6; j++) {
				 pstmt.setString(j+1, null);
				}
			}
			pstmt.executeUpdate();
			String sql2 = "SELECT seq_bno_ticketing.currval FROM dual";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			ResultSet rs = pstmt2.executeQuery();
			int ticketing_num = 0;
			if(rs.next()) {
				ticketing_num = rs.getInt("currval");
			}
			System.out.println(ticketing_num+"번 예매정보가 등록되었습니다!");
			rs.close();
			pstmt2.close();
			pstmt.close();
			conn.close();
			return ticketing_num;
	}
	public ArrayList<Object> getArray(int bno) throws Exception{
		ArrayList<Object> jArray = new ArrayList<Object>();
		Connection conn = getConnection();
		String sql = "SELECT * FROM TICKETING WHERE TICKETING_NUMBER = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			jArray.add((rs.getObject("seat_num1")));
			if(!Objects.isNull(rs.getObject("seat_num2"))) {
				jArray.add((rs.getObject("seat_num2")));
			}
			if(!Objects.isNull(rs.getObject("seat_num3"))) {
				jArray.add((rs.getObject("seat_num3")));
			}
			if(!Objects.isNull(rs.getObject("seat_num4"))) {
				jArray.add((rs.getObject("seat_num4")));
			}
			if(!Objects.isNull(rs.getObject("seat_num5"))) {
				jArray.add((rs.getObject("seat_num5")));
			}
			if(!Objects.isNull(rs.getObject("seat_num6"))) {
				jArray.add((rs.getObject("seat_num6")));
			}
		}
		System.out.println(jArray);
		rs.close();
		pstmt.close();
		conn.close();
		return jArray;
	}
	public void TicketCreate(String id, String Stadium, String m_date, int s1, int s2, int s3, int ticketing_bno) throws Exception {
		Connection conn = getConnection();
		ArrayList<Object> seatInfo = getArray(ticketing_bno);
		int [] ticketPrice = {16000,11000,5000};
		String [] ticketType = {"성인","청소년","어린이"};
		ArrayList<Integer> arr = new ArrayList<Integer>();
		arr.add(s1);
		arr.add(s2);
		arr.add(s3);
		System.out.println("ticketing_bno : " + ticketing_bno);
		System.out.println("ticketPrice[i] : " + ticketPrice[0]);
		System.out.println("m_date : " + m_date);
		System.out.println("Stadium : " + Stadium);
		System.out.println("id : " + id);
		System.out.println("ticketType[i] : " + ticketType[0]);
		System.out.println("seatInfo.get(count) : " + seatInfo.get(0));
		String sql = "INSERT INTO ticket(ticketing_number,ticket_price,ticket_number,m_date,stadium,id,ticket_type,section) "+
					  "VALUES(?,?,seq_ticket_num.nextval,TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int count = 0;
		for(int i=0; i< arr.size(); i++) {
			for(int j = 0; j < arr.get(i); j++) {
				pstmt.setInt(1, ticketing_bno);
				pstmt.setInt(2, ticketPrice[i]);
				pstmt.setString(3, m_date);
				pstmt.setString(4, Stadium);
				pstmt.setString(5, id);
				pstmt.setString(6, ticketType[i]);
				pstmt.setObject(7, seatInfo.get(count));
				pstmt.executeUpdate();
				count++;
			}
		}
		pstmt.close();
		conn.close();
		System.out.println("티켓 생성!");
		UpdateTicketing(seatInfo);
	}
	public void UpdateTicketing(ArrayList<Object> seatInfo) throws Exception {
		System.out.println(seatInfo.toString());
		Connection conn = getConnection();
		String sql = "Update seat SET sold_out = 'Y' WHERE section = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		for(int i = 0; i< seatInfo.size(); i++) {
			pstmt.setObject(1, seatInfo.get(i));
			pstmt.executeUpdate();
		}
		pstmt.close();
		conn.close();
		System.out.println("업데이트 성공!");
	}
}
