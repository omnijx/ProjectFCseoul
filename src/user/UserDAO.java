package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDAO {
	
	private Connection conn;
	
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
	
	public UserDAO() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "project";
			String dbpw = "p1234";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int registerCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; //이미 존재하는 아이디
			} else {
				return 1; // 가입 가능한 아이디
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
	
	public int registerNickCheck(String nick_name) {
		if(nick_name == "") return 2;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE nick_name=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; //이미 존재하는 아이디
			} else {
				return 1; // 가입 가능한 아이디
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
	
	public int register2(String id, String pw, String name, String email, String phone, String address,
			String nick_name, String birth, String postal_code, String phone_owner, String sms_receive,
			String email_receive, String gender) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO member VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setString(6, address);
			pstmt.setString(7, nick_name);
			pstmt.setString(8, birth);
			pstmt.setString(9, postal_code);
			pstmt.setString(10, phone_owner);
			pstmt.setString(11, sms_receive);
			pstmt.setString(12, email_receive);
			pstmt.setString(13, gender);
			return pstmt.executeUpdate();   // 회원가입이 성공적으로 이뤄지면 1값이 리턴
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
	
	public UserDTO loginDAO(String id, String pw) { 
		UserDTO dto = new UserDTO();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id")); 
				dto.setName(rs.getString("name")); 
				dto.setNick_name(rs.getString("nick_name")); 
				dto.setNumber_of_login(rs.getInt("number_of_login")); 
			}
			String sql2 = "UPDATE member SET number_of_login=? WHERE id=?";
			num = dto.getNumber_of_login();
			num += 1;
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, id);
			pstmt2.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(pstmt2 != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public int LoginNaver(String token, String id, String email, String nickname, String name, String gender) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		
		String sql = "SELECT * FROM member WHERE id=?";
		String sql2 = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if((rs.getString("id").equals(id))) {
					if(!(rs.getString("ntoken").equals(token))) {
						sql2 = "UPDATE member SET ntoken=? WHERE id=?";
						pstmt2 = conn.prepareStatement(sql2);
						pstmt2.setString(1, token);
						pstmt2.setString(2, id);
						pstmt.executeUpdate();
						return 1;
					}else {
						return 1;
					}
					
				} 
			} else if(!rs.next()){
				sql2 = "INSERT INTO member(ntoken, id, email, name, nick_name, gender) VALUES(?,?,?,?,?,?)";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, token);
				pstmt2.setString(2, id);
				pstmt2.setString(3, email);
				pstmt2.setString(4, name);
				pstmt2.setString(5, nickname);
				pstmt2.setString(6, gender);
				pstmt2.executeUpdate();
				return 1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public void SmsOtp(String otp, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "INSERT INTO member(id, phone) VALUES(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, otp);
			pstmt.setString(2, phone);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
			
	}

	public int OtpCheck(String phone, String otp) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    String sql = "SELECT id FROM member WHERE phone=?";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, phone);

	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            String id = rs.getString("id");
	            if (id.equals(otp)) {
	                return 1;
	            } else {
	                return 0;
	            }
	        } else {
	            return 0; // 검색된 회원 ID가 없는 경우
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return -1;
	}
	
	public int register(String pass, String id, String name, String email, String phone, String address, String nick_name, String birth, String postal_code, String phone_owner, String sms_receive, String email_receive, String gender) {
		PreparedStatement pstmt = null;
		int ref = 0;	
		try {
			String sql = "INSERT INTO member(id, pass, name, email, phone, address, nick_name, birth, postal_code, phone_owner, sms_receive, email_receive, gender, secession)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setString(6, address);
			pstmt.setString(7, nick_name);
			pstmt.setString(8, birth);
			pstmt.setString(9, postal_code);
			pstmt.setString(10, phone_owner);
			pstmt.setString(11, sms_receive);
			pstmt.setString(12, email_receive);
			pstmt.setString(13, gender);
			
			ref = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ref;
	}
	
	public int passCheck(String id, String pass) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ref = 0;
		try {
			String sql = "SELECT * FROM member WHERE id=? AND pass=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ref = 1;
			} 
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ref;
	}
	
	public UserDTO select(String id) {
		UserDTO dto = new UserDTO();
	    PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setNick_name(rs.getString("nick_name"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setPostal_code(rs.getString("postal_code"));
				dto.setAddress(rs.getString("address"));
				dto.setNumber_of_login(rs.getInt("number_of_login"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int update(String id, String pass, String nick_name, String phone, String postal_code, String address) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ref = 0;
		try {
			String sql = "UPDATE member SET pass=?, nick_name=?, phone=?, postal_code=?, address=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, nick_name);
			pstmt.setString(3, phone);
			pstmt.setString(4, postal_code);
			pstmt.setString(5, address);
			pstmt.setString(6, id);
			
			ref = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ref;
	}
	
	public int secession(String id) {
		PreparedStatement pstmt = null;
		int ref = 0;
		try {
			String sql = "UPDATE member SET id=?, name=?, pass=?, email=?, phone=?, address=?, nick_name=?,"
					+ " birth=?, postal_code=?, phone_owner=?, sms_receive=?, email_receive=?, gender=?, secession=?,"
					+ " number_of_login=?, ntoken=?, otp=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "탈퇴회원");
			pstmt.setString(3, "");
			pstmt.setString(4, "");
			pstmt.setString(5, "");
			pstmt.setString(6, "");
			pstmt.setString(7, "탈퇴회원");
			pstmt.setString(8, "");
			pstmt.setString(9, "");
			pstmt.setString(10, "");
			pstmt.setString(11, "");
			pstmt.setString(12, "");
			pstmt.setString(13, "");
			pstmt.setString(14, "Y");
			pstmt.setInt(15, 0);
			pstmt.setString(16, "");
			pstmt.setString(17, "");
			pstmt.setString(18, id);
			
			ref = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ref;
	}
	
	public int secessionCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ref = 0;
		try {
			String sql = "SELECT * FROM member WHERE id=? AND secession='Y'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = 1;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ref;
	}

	public UserDTO myname(String id) {
		UserDTO udto = null;
		try {
			Connection conn = getConnection();
			String sql = "SELECT id,name FROM member WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs  = pstmt.executeQuery();
			while(rs.next()) {
				String myid = rs.getString("id");
				String name = rs.getString("name");
				udto = new UserDTO(myid, name);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return udto;
	}


}







