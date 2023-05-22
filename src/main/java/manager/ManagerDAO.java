package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

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
			sql = "insert into eventInput values (default,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEventName());
			pstmt.setString(2, vo.geteTime());
			pstmt.setInt(3, vo.getTicketNum());
			pstmt.setString(4, vo.getPlace());
			pstmt.setString(5, vo.getTarget());
			pstmt.setInt(6, vo.getPeople());
			pstmt.setInt(7, vo.getMoney());
			pstmt.setString(8, vo.getPart());
			pstmt.setString(9, vo.getThumbnail());
			pstmt.setString(10, vo.getDetail());
			pstmt.setString(11, vo.getRoad());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	
	
}
