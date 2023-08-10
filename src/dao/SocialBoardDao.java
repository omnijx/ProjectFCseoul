package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.SocialBoardDto;

public class SocialBoardDao {
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
	public ArrayList<SocialBoardDto> socialBoardSelect(int startNum, int endNum) {
		ArrayList<SocialBoardDto> sBoardList = new ArrayList<SocialBoardDto>();
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = " SELECT g2.*, g2.rnum, TO_CHAR(w_date, 'YYYY.MM.DD') wd" + 
						 " FROM(SELECT rownum rnum, g1.*" + 
						 " FROM(SELECT * FROM social_board sb, member m WHERE sb.writer=m.id ORDER BY sb.bno DESC) g1) g2" + 
						 " WHERE g2.rnum>=? AND g2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2,  endNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			int rno = 0;
			int step = 0;
			String rContent = "";
			String rWriter = "";
			int rOrder = 0;
			int ref = 0;
			String rwDate = "";
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
//				int rno = rs.getInt("rno");
//				int step = rs.getInt("step");
				String writer = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rNum = rs.getInt("r_num");
				String wDate = rs.getString("wd");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				String name = rs.getString("name");
				String nickName = rs.getString("nick_name");
				
				SocialBoardDto sbDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
				sBoardList.add(sbDto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return sBoardList;
	}
	
	public int socialCount() {
		Connection conn;
		int cnt = 0;
		try {
			conn = getConnection();
			String sql = "SELECT count(*) FROM social_board";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
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
	public int socialSearchCount(String searchtxt, String search) {
		Connection conn;
		int cnt = 0;
		try {
			conn = getConnection();
			String sql = "";
			if(search.equals("all")) {
				sql = "SELECT count(*) FROM social_board WHERE title=? OR content=?";
			} else if(search.equals("title")) {
				sql = "SELECT count(*) FROM social_voard WHERE title=?";
			} else if(search.equals("content")){
				sql = "SELECT count(*) FROM social_voard WHERE content=?";
			} else {
				sql = "SELECT count(*) FROM social_voard WHERE name=?";
			}
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			if(search.equals("all")) {
				pstmt.setString(1, "%"+searchtxt+"%");
				pstmt.setString(2, "%"+searchtxt+"%");
			} else {
				pstmt.setString(1, "%"+searchtxt+"%");
			}
			
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
	
	public SocialBoardDto socialDetail(int bno) {
		Connection conn = null;
		String writer = "";
		String title = "";
		String content = "";
		int rNum = 0;
		String wDate = "";
		int good = 0;
		int bad = 0;
		int rno = 0;
		String rContent = "";
		String rWriter = "";
		int step = 0;
		int rOrder = 0;
		int ref = 0;
		String rwDate = "";
		String name = "";
		String nickName = "";
		
		SocialBoardDto sdDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
		try {
			conn = getConnection();
			
			String sql = " SELECT *" +
						 " FROM social_board sb, member m" +
						 " WHERE sb.writer=m.id AND sb.bno=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				sdDto.setWriter(rs.getString("id"));
				sdDto.setTitle(rs.getString("title"));
				sdDto.setContent(rs.getString("content"));
				sdDto.setrNum(rs.getInt("r_num"));
				sdDto.setwDate(rs.getString("w_date"));
				sdDto.setGood(rs.getInt("good"));
				sdDto.setBad(rs.getInt("bad"));
//				sdDto.setRno(rs.getInt("rno"));
//				sdDto.setStep(rs.getInt("step"));
//				sdDto.setrContent(rs.getString("r_content"));
//				sdDto.setrWriter(rs.getString("r_writer"));
//				sdDto.setStep(rs.getInt("Step"));
//				sdDto.setRef(rs.getInt("ref"));
//				sdDto.setRwDate(rs.getString("r_date"));
				sdDto.setName(rs.getString("name"));
				sdDto.setNickName(rs.getString("nick_name"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sdDto;
	}
	
	public ArrayList<SocialBoardDto> socialComment(int bno) {
		Connection conn = null;
		ArrayList<SocialBoardDto> sCommentList = new ArrayList<SocialBoardDto>();
		
		try {
			conn = getConnection();
			
			String sql = " SELECT *" +
						 " FROM social_comment sc, member m" +
						 " WHERE sc.writer=m.id AND sc.bno=?" +
						 " ORDER BY r_order";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			String writer = "";
			String title = "";
			String content = "";
			int rNum = 0;
			String wDate = "";
			int good = 0;
			int bad = 0;
			int rno = 0;
			String rContent = "";
			String rWriter = "";
			int step = 0;
			int rOrder = 0;
			int ref = 0;
			String rwDate = "";
			String name = "";
			String nickName = "";

			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SocialBoardDto scDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
//				scDto.setWriter(rs.getString("id"));
//				scDto.setTitle(rs.getString("title"));
//				scDto.setContent(rs.getString("content"));
//				scDto.setrNum(rs.getInt("r_num"));
//				scDto.setwDate(rs.getString("w_date"));
//				scDto.setGood(rs.getInt("good"));
//				scDto.setBad(rs.getInt("bad"));
				scDto.setrContent(rs.getString("content"));
				scDto.setrWriter(rs.getString("writer"));
				scDto.setStep(rs.getInt("step"));
				scDto.setRef(rs.getInt("ref"));
				scDto.setRwDate(rs.getString("w_date"));
				scDto.setRno(rs.getInt("rno"));
				scDto.setName(rs.getString("name"));
				scDto.setNickName(rs.getString("nick_name"));
				sCommentList.add(scDto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sCommentList;
	}
	
	public SocialBoardDto nameNickName(String id) {
		Connection conn = null;
		int bno = 0;
		String title = "";
		String content = "";
		int rNum = 0;
		String wDate = "";
		int good = 0;
		int bad = 0;
		int rno = 0;
		String rContent = "";
		String rWriter = "";
		int step = 0;
		int rOrder = 0;
		int ref = 0;
		String rwDate = "";
		String name = "";
		String nickName = "";
		
		SocialBoardDto nameDto = new SocialBoardDto(bno, id, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
		try {
			conn = getConnection();
			
			String sql = " SELECT * FROM member WHERE id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				nameDto.setName(rs.getString("name"));
				nameDto.setNickName(rs.getString("nick_name"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return nameDto;
	}
	
	public ArrayList<SocialBoardDto> socialSearchAll(String searchTxt, int startNum, int endNum) {
		ArrayList<SocialBoardDto> searchList = new ArrayList<SocialBoardDto>();
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = " SELECT g2.*, g2.rnum, TO_CHAR(w_date, 'YYYY.MM.DD') wd" + 
						 " FROM(SELECT rownum rnum, g1.*" + 
						 " FROM(SELECT * FROM social_board sb, member m WHERE sb.writer=m.id AND (sb.title LIKE? OR sb.content LIKE? OR m.nick_name LIKE? OR m.name LIKE?) ORDER BY sb.bno DESC) g1) g2" + 
						 " WHERE g2.rnum>=? AND g2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchTxt + "%");
			pstmt.setString(2, "%" + searchTxt + "%");
			pstmt.setString(3, "%" + searchTxt + "%");
			pstmt.setString(4, "%" + searchTxt + "%");
			pstmt.setInt(5, startNum);
			pstmt.setInt(6,  endNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			int rno = 0;
			String rContent = "";
			String rWriter = "";
			int step = 0;
			int rOrder = 0;
			int ref = 0;
			String rwDate = "";
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rNum = rs.getInt("r_num");
				String wDate = rs.getString("wd");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				String name = rs.getString("name");
				String nickName = rs.getString("nick_name");
				
				SocialBoardDto sbDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
				searchList.add(sbDto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return searchList;
	}
	
	public ArrayList<SocialBoardDto> socialSearchTitle(String searchTxt, int startNum, int endNum) {
		ArrayList<SocialBoardDto> searchList = new ArrayList<SocialBoardDto>();
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = " SELECT g2.*, g2.rnum, TO_CHAR(w_date, 'YYYY.MM.DD') wd" + 
						 " FROM(SELECT rownum rnum, g1.*" + 
						 " FROM(SELECT * FROM social_board sb, member m WHERE sb.writer=m.id AND sb.title LIKE? ORDER BY sb.bno DESC) g1) g2" + 
						 " WHERE g2.rnum>=? AND g2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchTxt + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3,  endNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			int rno = 0;
			String rContent = "";
			String rWriter = "";
			int step = 0;
			int rOrder = 0;
			int ref = 0;
			String rwDate = "";
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rNum = rs.getInt("r_num");
				String wDate = rs.getString("wd");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				String name = rs.getString("name");
				String nickName = rs.getString("nick_name");
				
				SocialBoardDto sbDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
				searchList.add(sbDto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return searchList;
	}
	public ArrayList<SocialBoardDto> socialSearchContent(String searchTxt, int startNum, int endNum) {
		ArrayList<SocialBoardDto> searchList = new ArrayList<SocialBoardDto>();
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = " SELECT g2.*, g2.rnum, TO_CHAR(w_date, 'YYYY.MM.DD') wd" + 
						 " FROM(SELECT rownum rnum, g1.*" + 
						 " FROM(SELECT * FROM social_board sb, member m WHERE sb.writer=m.id AND sb.content LIKE? ORDER BY sb.bno DESC) g1) g2" + 
						 " WHERE g2.rnum>=? AND g2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchTxt + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3,  endNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			int rno = 0;
			String rContent = "";
			String rWriter = "";
			int step = 0;
			int rOrder = 0;
			int ref = 0;
			String rwDate = "";
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rNum = rs.getInt("r_num");
				String wDate = rs.getString("wd");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				String name = rs.getString("name");
				String nickName = rs.getString("nick_name");
				
				SocialBoardDto sbDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
				searchList.add(sbDto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return searchList;
	}
	public ArrayList<SocialBoardDto> socialSearchName(String searchTxt, int startNum, int endNum) {
		ArrayList<SocialBoardDto> searchList = new ArrayList<SocialBoardDto>();
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = " SELECT g2.*, g2.rnum, TO_CHAR(w_date, 'YYYY.MM.DD') wd" + 
						 " FROM(SELECT rownum rnum, g1.*" + 
						 " FROM(SELECT * FROM social_board sb, member m WHERE sb.writer=m.id AND (m.name LIKE? OR m.nick_name LIKE?) ORDER BY sb.bno DESC) g1) g2" + 
						 " WHERE g2.rnum>=? AND g2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchTxt + "%");
			pstmt.setString(2, "%" + searchTxt + "%");
			pstmt.setInt(3, startNum);
			pstmt.setInt(4,  endNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			int rno = 0;
			String rContent = "";
			String rWriter = "";
			int step = 0;
			int rOrder = 0;
			int ref = 0;
			String rwDate = "";
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rNum = rs.getInt("r_num");
				String wDate = rs.getString("wd");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				String name = rs.getString("name");
				String nickName = rs.getString("nick_name");
				
				SocialBoardDto sbDto = new SocialBoardDto(bno, writer, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
				searchList.add(sbDto);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return searchList;
	}
	
	public SocialBoardDto detailInfo(String id, int bno) {
		Connection conn = null;
		String title = "";
		String content = "";
		int rNum = 0;
		String wDate = "";
		int good = 0;
		int bad = 0;
		int rno = 0;
		String rContent = "";
		String rWriter = "";
		int step = 0;
		int rOrder = 0;
		int ref = 0;
		String rwDate = "";
		String name = "";
		String nickName = "";
		
		SocialBoardDto dto = new SocialBoardDto(bno, id, title, content, rNum, wDate, good, bad, rno, rContent, rWriter, step, rOrder, ref, rwDate, name, nickName);
		try {
			conn = getConnection();
			String sql = "SELECT * FROM social_board sb, member m WHERE sb.writer=m.id AND sb.writer=? AND sb.bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, bno);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setNickName(rs.getString("nick_name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setwDate(rs.getString("w_date"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
