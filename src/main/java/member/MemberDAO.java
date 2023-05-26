package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;
import manager.ManagerVO;


public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberVO vo = null;
	String sql = "";
	

	public long getHashTableSearch(int randomKey) {
		return 0;
	}

	// 로그인 시 아이디가 있는지 체크 후 있으면 vo에 모두 담는다.
	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setPwd(rs.getString("pwd"));
				vo.setSalt(rs.getString("salt"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setLevel(rs.getInt("level"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	
	// 회원가입 처리
	public int setLoginJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql="insert into member values (default,?,?,?,?,?,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getNick());
			pstmt.setString(4, vo.getPwd());
			pstmt.setString(5, vo.getSalt());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getAddress());
			pstmt.setString(8, vo.getTel());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getGender());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public MemberVO getMemberNickCheck(String nick) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where nick = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setPwd(rs.getString("pwd"));
				vo.setSalt(rs.getString("salt"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setUserDel(rs.getString("userDel"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return vo;
	}

	// 아이디 찾기
	public MemberVO getMemberFindMidOk(String name, String nick) {
		MemberVO vo = new MemberVO();
		try {
			sql = "selecet mid,name,nick from member where name=? and nick=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, nick);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 회원정보 수정 처리
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set name=?, birthday=?, address=?,"
					+ "tel=?, email=?, gender=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getBirthday());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getMid());
			pstmt.executeLargeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 비밀번호 수정 저장 처리
	public int setMemberPwdUpdateOk(String mid, String newPwd) {
		int res = 0;
		try {
			sql = "update member set pwd = ? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberPwdUpdateOk) : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 회원이 보는 행사 상세정보에 출력할 정보 가져가기
	public ManagerVO getMemberEventContent(int idx) {
		ManagerVO vo = new ManagerVO();
		try {
			sql = "select ei.*, ed.eDate from eventInput ei, eventDate ed where ei.idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setEventName(rs.getString("eventName"));
				vo.seteTime(rs.getString("eTime"));
				vo.setPeople(rs.getString("people"));
				vo.setPlace(rs.getString("place"));
				vo.setTarget(rs.getString("target"));
				vo.setMoney(rs.getString("money"));
				vo.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberEventContent) : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}


	
	
}
