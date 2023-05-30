package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;


public class MemberRezDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberRezVO vo = null;
	String sql = "";
	
	// 예약 정보 저장 처리
	public int setMemberRezOk(MemberRezVO vo) {
		int res = 0;
		try {
			sql = "insert into reservation values (default,?,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEventName());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getrDate());
			pstmt.setString(4, vo.getrTime());
			pstmt.setInt(5, vo.getrPeopleNum());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberRezOk) : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 행사 예약 건 취소 처리
	public int setMemberRezCancle(int idx) {
		int res = 0;
		try {
//			sql = "delete from reservation re  where idx = ?";
			sql = "delete from reservation where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberRezCancle) : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 전체 레코드 건수 구하기
	public int getTotRecCnt(String mid) {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from reservation where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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

	// 개별 예약 현황 가져오기
	public ArrayList<MemberRezVO> getMemberEventRezList(int startIndexNo, int pageSize, String mid) {
		ArrayList<MemberRezVO> vos = new ArrayList<>();
		try {
			sql = "select * from reservation where mid = ? order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberRezVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setEventName(rs.getString("eventName"));
				vo.setMid(rs.getString("mid"));
				vo.setrDate(rs.getString("rDate"));
				vo.setrTime(rs.getString("rTime"));
				vo.setrPeopleNum(rs.getInt("rPeopleNum"));
				vo.setAplDate(rs.getString("aplDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getMemberEventRezList) : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 전체 예약 건수 가져오기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from reservation";
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

	// 전체 예약자 정보 가져오기
	public ArrayList<MemberRezVO> getMemberEventRezList(int startIndexNo, int pageSize) {
		ArrayList<MemberRezVO> vos = new ArrayList<>();
		try {
			sql = "select * from reservation order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberRezVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setEventName(rs.getString("eventName"));
				vo.setMid(rs.getString("mid"));
				vo.setrDate(rs.getString("rDate"));
				vo.setrTime(rs.getString("rTime"));
				vo.setrPeopleNum(rs.getInt("rPeopleNum"));
				vo.setAplDate(rs.getString("aplDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getMemberEventRezList) : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
}
