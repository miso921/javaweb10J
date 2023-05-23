package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import member.MemberVO;

public class ManagerDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ManagerVO vo = null;

	// 행사 DB 저장처리
	public int setManagerEventInputOk(ManagerVO vo) {
		int res = 0;
		try {
			sql = "insert into eventInput values (default,?,?,?,?,default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setString(2, vo.getEventName());
			pstmt.setString(3, vo.geteTime());
			pstmt.setInt(4, vo.getPeople());
			pstmt.setString(5, vo.getPlace());
			pstmt.setString(6, vo.getTarget());
			pstmt.setInt(7, vo.getMoney());
			pstmt.setString(8, vo.getPhoto());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류(setManagerEventInputOk) : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 전체 레코드 건수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류(getTotRecCnt) : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 행사 전체 조회 처리
	public ArrayList<ManagerVO> getEventList(int startIndexNo, int pageSize) {
		ArrayList<ManagerVO> vos = new ArrayList<>();
		try {
			sql = "select * from eventInput order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ManagerVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setEventName(rs.getString("eventName"));
				vo.seteTime(rs.getString("eTime"));
				vo.setPeople(rs.getInt("people"));
				vo.setPlace(rs.getString("place"));
				vo.setTarget(rs.getString("target"));
				vo.setMoney(rs.getInt("money"));
				vo.setPhoto(rs.getString("photo"));
				vos.add(vo); // vos에 데이터 추가!
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getEventList) : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 행사정보 삭제 처리
	public int setManagerEventDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from eventInput where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류(setManagerEventDelete) : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 회원 전체 조회 처리
	public ArrayList<MemberVO> getManagerMemberList(int statrIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<>();
		try {
			sql = "select * from member order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statrIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
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
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getManagerMemberList) : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
	
}
