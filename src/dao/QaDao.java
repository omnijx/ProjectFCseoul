package dao;

import java.sql.*;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import dto.MainNewsDto;
import dto.QaDto;

public class QaDao {
	
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
	public QaDto getQaDetailDto(int bno)throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM qa WHERE bno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		
		ResultSet rs = pstmt.executeQuery();
		QaDto dto = null;
		if(rs.next()) {
			String category = rs.getString("category");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String w_date = rs.getString("w_date");
			String open = rs.getString("open");
			String answer = rs.getString("answer");
			String content = rs.getString("content");
			String a_content = rs.getString("a_content");
			
			dto = new QaDto( bno,  category,  title,  content,  writer,  w_date,  open, answer, a_content);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	
	public ArrayList<QaDto> getQaAll(int pageNum,String searchKeyword,String selectOption) {
		ArrayList<QaDto> Qalist = new ArrayList<>();
		try {
			Connection conn = getConnection();
			
			
			String sql =  " SELECT b2.bno, b2.category, b2.title, b2.content, b2.writer, TO_CHAR(b2.w_date, 'YYYY-MM-DD') AS wd, b2.open, b2.answer, b2.a_content, m.name"
						+ " FROM (SELECT b1.*, rownum AS rnum FROM (SELECT * FROM QA ORDER BY bno DESC) b1) b2, QA q, MEMBER m"
						+ " WHERE (b2.rnum >= ? AND b2.rnum <= ?) AND (q.writer = m.id) AND (b2.bno = q.bno)";
			
			
			
			if (searchKeyword != null && !searchKeyword.isEmpty()) {
			    if (selectOption.equals("title")) {
			      sql += " AND b2.title LIKE '%" + searchKeyword + "%'";
			    } else if (selectOption.equals("content")) {
			      sql += " AND b2.content LIKE '%" + searchKeyword + "%'";
			    }
			  }
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int endPage = pageNum*10;
			int startPage = endPage -9;
			
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, endPage);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String w_date = rs.getString("wd");
				String open = rs.getString("open");
				String answer = rs.getString("answer");
				String a_content = rs.getString("a_content");
				String name = rs.getString("name");	
				
				QaDto qdto = new QaDto(bno, category, title, content, writer, w_date, open, answer, a_content, name);
			
				Qalist.add(qdto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return Qalist;
	}
	public QaDto myid(String id) {
		QaDto qdto = null;
		try {
			Connection conn = getConnection();

			String sql =  " SELECT id,name"
						+ " FROM member"
						+ " WHERE id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String myid = rs.getString("id");
				String name = rs.getString("name");
				System.out.println(myid);
				System.out.println(name);
				qdto = new QaDto(myid,name);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return qdto;
		
	}
	public void Qadelete(int bno) {
		
		try {
			Connection conn = getConnection();
			String sql = "DELETE FROM qa WHERE bno = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public QaDto getUpdate(String id) {
		QaDto qdto =null;
		try {
			Connection conn = getConnection();
			String sql = "SELECT * FROM qa WHERE writer = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);  			// 아이디 값넣어주기
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String w_date = rs.getString("wd");
				String open = rs.getString("open");
				String answer = rs.getString("answer");
				String a_content = rs.getString("a_content");
				String name = rs.getString("name");	
				
				qdto = new QaDto(bno, category, title, content, writer, w_date, open, answer, a_content, name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qdto;
	}
	
	public void insertQa(QaDto qdto,String id) {
		
		try {
			Connection conn = getConnection();
			String sql = " INSERT INTO qa(bno, category, title, content, writer, w_date, open, answer)"
					   + " VALUES(QABNO.nextval, ?, ?, ?,?,sysdate, ?, '답변대기')";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,qdto.getCategory());
			pstmt.setString(2,qdto.getTitle());
			pstmt.setString(3,qdto.getContent());
			pstmt.setString(4,id);
			pstmt.setString(5, qdto.getOpen());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void updateanswer(QaDto qdto) {
		try {
			Connection conn = getConnection();
			String sql = " UPDATE QA SET a_content = ?, answer ='답변완료' WHERE bno = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,qdto.getA_content());
			pstmt.setInt(2,qdto.getBno());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public QaDto getmyqa(int bno) {
		QaDto qdto =null;
		try {
			Connection conn = getConnection();
			String sql =  " SELECT q.bno,q.category,q.title,q.content,q.writer,q.w_date,q.open,m.name"
						+ " FROM qa q, member m "
						+ " WHERE q.writer = m.id and bno =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int bno1 = rs.getInt("bno");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String w_date = rs.getString("w_date");
				String open = rs.getString("open");
				String name = rs.getString("name");
				qdto = new QaDto(bno1, category, title, content, writer, w_date, open,name);
				pstmt.close();
				conn.close();
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qdto;
	}
	public void qacor(QaDto qdto) {
		try {
			Connection conn = getConnection();
			String sql = "UPDATE qa SET category = ?,title = ?,open=?,content=?,w_date = sysdate WHERE bno =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qdto.getCategory());
			pstmt.setString(2, qdto.getTitle());
			pstmt.setString(3, qdto.getOpen());
			pstmt.setString(4, qdto.getContent());
			pstmt.setInt(5, qdto.getBno());
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int countqa() {
		int cnt = 0;
		try {
			Connection conn = getConnection();
			String sql = "SELECT count(*) FROM qa";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count(*)");
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int searchcountqa(String searchKeyword,String selectOption) {
		int cnt = 0;
		try {
			Connection conn = getConnection();
			String sql = "";
			if(selectOption.equals("title")) {
				sql = "SELECT count(*) FROM qa WHERE title LIKE?";
			} else {
				sql = "SELECT count(*) FROM qa WHERE content LIKE?";
			}
			PreparedStatement pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchKeyword + "%");
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
