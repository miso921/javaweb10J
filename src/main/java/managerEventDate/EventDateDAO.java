package managerEventDate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class EventDateDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	EventDateVO vo = null;


//	 등록된 행사에 날짜 등록 처리
	public int setEventDateInputOk(EventDateVO vo) {
		System.out.println("vo:"+vo);
		int res = 0;
		try {
			sql = "INSERT INTO eventDate values (default, ?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEventName());
			pstmt.setString(2, vo.geteDate());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SQL 오류(setEventDateInputOk) : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	
	
}
