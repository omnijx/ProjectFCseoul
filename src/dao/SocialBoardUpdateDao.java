package dao;

import java.sql.*;

public class SocialBoardUpdateDao {
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
	
	public boolean socialWrite(String id, String title, String content) {
		Connection conn = null;
		try {
			conn = getConnection();
			
			String sql = "INSERT INTO social_board(bno, writer, title, content)VALUES(seq_social.nextval, ?, ?, ?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean commentWrite(String id, int bno, String content) {
		Connection conn = null;
		int ref = 0;
		try {
			conn = getConnection();
			 String sql = "INSERT INTO social_comment(rno,bno,content,writer,step,r_order,w_date,ref) VALUES(seq_social_r.nextval,?,?,?,0,?,sysdate,seq_social_r.currval)";
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, bno);
             pstmt.setString(2, content);
             pstmt.setString(3, id);
             pstmt.setInt(4, commentNumCheck(bno)+1);
             ref = pstmt.executeUpdate();
             rNumUpdate(bno,commentNumCheck(bno)+1);
             pstmt.close();
             conn.close();
			 
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(ref==1) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public boolean nestedComment(String id, int bno, String content, int answerNum) {
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO social_comment(rno,bno,content,writer,step,r_order,w_date,ref) VALUES(seq_social_r.nextval,?,?,?,?,?,sysdate,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
            pstmt.setString(2, content);
            pstmt.setString(3, id);
            pstmt.setInt(4,stepCheck(answerNum));
            pstmt.setInt(5,orderNumCheck(answerNum));
            pstmt.setInt(6, answerNum);
            rOrderUpdate(bno,orderNumCheck(answerNum));
            pstmt.executeUpdate();
            rNumUpdate(bno,commentNumCheck(bno)+1);
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public int commentNumCheck(int bno) {
		Connection conn = null;
		int rNum = 0;
		try {
			conn = getConnection();
			String sql = "SELECT r_num FROM social_board WHERE bno = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                    rNum = rs.getInt("r_num");
            }
            rs.close();
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return rNum;
	}
	
	public boolean rNumUpdate(int bno, int rNum) {
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = "UPDATE social_board SET r_num = ? WHERE bno = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, rNum);
            pstmt.setInt(2, bno);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean rOrderUpdate(int bno, int orderNum) {
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = "UPDATE social_comment SET r_order = r_order + 1 WHERE r_order >= ? AND bno = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderNum);
            pstmt.setInt(2, bno);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public int stepCheck(int answerNum) {
		Connection conn = null;
		int step = 0;
		try {
			conn = getConnection();
			String sql = "SELECT step FROM social_comment WHERE rno = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, answerNum);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                    step = rs.getInt("step")+1;
            }
            rs.close();
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return step;
	}
	
	public int orderNumCheck(int answerNum) {
		Connection conn = null;
		int orderNum = 0;
		try {
			conn = getConnection();
			String sql = "SELECT MAX(r_order) FROM social_comment WHERE ref = ?";
            String sql1 = "SELECT r_order FROM social_comment WHERE rno = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            PreparedStatement pstmt1 = conn.prepareStatement(sql1);
            pstmt.setInt(1, answerNum);
            pstmt1.setInt(1, answerNum);
            ResultSet rs = pstmt.executeQuery();
            ResultSet rs1 = pstmt1.executeQuery();
            if(rs.next()) {
                    orderNum = rs.getInt("MAX(r_order)")+1;
                    }
            if(orderNum == 1){
                    if(rs1.next()) {
                        orderNum = rs1.getInt("r_order")+1;
                    }
            }
            rs1.close();
            rs.close();
            pstmt1.close();
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return orderNum;
	}
	
	public boolean commentDelete(String id, int bno, int rno) {
		Connection conn = null;
		try {
			conn = getConnection();
			int rnum = commentNumCheck(bno);
			
			String sql = "SELECT count(*), ref FROM social_comment WHERE ref=? GROUP BY ref";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, rno);
            int refCount = 0;
            int ref = 0;
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                refCount = rs.getInt("count(*)");
                ref = rs.getInt("ref");
            }
            
            if(ref < 1 || (refCount==1 && rno==ref)) {
                    ref1(refCount, rno, bno);
                    rNumUpdate(bno,rnum);
            }else if(refCount > 1) {
                    ref2(rno);
            }
            
            rs.close();        
            pstmt.close();
            rNumDeleteUpdate(bno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean ref1(int refCount, int rno, int bno) {
		Connection conn = null;
		try {
			conn = getConnection();
			String sqll = "SELECT r_order FROM social_comment WHERE rno=?";
            PreparedStatement pstmtt = conn.prepareStatement(sqll);
            pstmtt.setInt(1, rno);
            ResultSet rss = pstmtt.executeQuery();
            int r_order = 0;
            if(rss.next()) {
                    r_order = rss.getInt("r_order");
            }
            pstmtt.close();
            rss.close();
            String sql1 = "SELECT * FROM social_comment WHERE rno=?";
            PreparedStatement pstmt1 = conn.prepareStatement(sql1);
            pstmt1.setInt(1, rno);
            ResultSet rs = pstmt1.executeQuery();
            int ref = 0;
            if(rs.next()) {
            	ref = rs.getInt("ref");
            }
            rs.close();
            pstmt1.close();
            int refCnt = 0;
            String refDe = "";
            refCnt = refCount(rno);
            refDe = refDelState(rno);
            String sql = "";
            if(refCnt<=2 && refDe.equals("Y")) {
            	sql = "DELETE FROM social_comment WHERE ref=? ";
            } else {
            	sql = "DELETE FROM social_comment WHERE rno=? ";
            }
            
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            if(refCnt<=2 && refDe.equals("Y")) {
            	pstmt.setInt(1, ref);
            } else {
            	pstmt.setInt(1, rno);
            }
//            System.out.println(sql);
//            System.out.println(rno);
            
            pstmt.executeUpdate();
            pstmt.close();
            
            String sql2 = "UPDATE social_comment SET r_order = r_order - 1 WHERE r_order >= ? AND bno = ?";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setInt(1, r_order);
            pstmt2.setInt(2, bno);
            pstmt2.executeUpdate();
            pstmt2.close();
            
            
            
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	public boolean ref2(int rno) {
		Connection conn = null;
		try {
			conn = getConnection();
			String writer = "*****";
            String content = "삭제된 댓글입니다.";
            
            
            String sql = "UPDATE social_comment SET writer=?, content=?, deleted='Y' WHERE rno=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, writer);
            pstmt.setString(2, content);
            pstmt.setInt(3, rno);
            
            pstmt.executeUpdate();
            pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	public boolean rNumDeleteUpdate(int bno) {
		Connection conn = null;
		try {
			conn = getConnection();
			
			String sql1 = "SELECT count(*) FROM social_comment WHERE bno=?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, bno);
			ResultSet rs = pstmt1.executeQuery();
			int rNum = 0;
			if(rs.next()) {
				rNum = rs.getInt("count(*)");
			}
			rs.close();
			pstmt1.close();
			
			
			String sql2 = "UPDATE social_board SET r_num=? WHERE bno=?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, rNum);
			pstmt2.setInt(2, bno);
			pstmt2.executeUpdate();
			pstmt2.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		 return true;
		
	}
	public int refCount(int rno) {
		Connection conn = null;
		int refCnt = 0;
		try {
			conn = getConnection();
			int ref = 0;
			String sql1 = "SELECT * FROM social_comment WHERE rno=?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, rno);
			ResultSet rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				ref = rs1.getInt("ref");
			}
			rs1.close();
			pstmt1.close();
			String sql2 = "SELECT count(*) FROM social_comment WHERE ref=?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, ref);
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				refCnt = rs2.getInt("count(*)");
			}
			rs2.close();
			pstmt2.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return refCnt;
	}
	public String refDelState(int rno) {
		Connection conn = null;
		String refDe = "";
		try {
			conn = getConnection();
			int ref = 0;
			String sql1 = "SELECT * FROM social_comment WHERE rno=?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, rno);
			ResultSet rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				ref = rs1.getInt("ref");
			}
			rs1.close();
			pstmt1.close();
			String sql2 = "SELECT * FROM social_comment WHERE ref=?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, ref);
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				refDe = rs2.getString("deleted");
			}
			rs2.close();
			pstmt2.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return refDe;
	}
	
	public boolean commentChange(int rno, String rContent) {
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = "UPDATE social_comment SET content=? WHERE rno=?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, rContent);
	        pstmt.setInt(2, rno);
	        pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean socialUpdate(String id, int bno, String title, String content) {
		Connection conn = null;
		boolean b = false;
		try {
			conn = getConnection();
			String sql = "UPDATE social_board SET title=?, content=? WHERE writer=? AND bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			pstmt.setInt(4, bno);
			
			int ref = pstmt.executeUpdate();
			if(ref == 1) {
				b = true;
			}
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public boolean socialDelete(int bno) {
		Connection conn = null;
		boolean b = false;
		try {
			conn = getConnection();
			String sql = "DELETE FROM social_board WHERE bno=?";
			String sql2 = "DELETE FROM social_comment WHERE bno=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, bno);
			int ref2 = pstmt2.executeUpdate();
			int ref = pstmt.executeUpdate();
			if(ref == 1 && ref2 == 1) {
				b = true;
			}
			pstmt2.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
}
