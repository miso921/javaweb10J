package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;


public class ReviewDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private ReviewVO vo = null;
	String sql = "";
	
		// 전체 레코드 건수 구하기
		public int getTotRecCnt() {
			int totRecCnt = 0;
			try {
				sql = "select count(idx) as cnt from review order by wDate desc";
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

		// 후기 전체 조회 처리
		public ArrayList<ReviewVO> getReviewList(int startIndexNo, int pageSize) {
			ArrayList<ReviewVO> vos = new ArrayList<>();
			try {
				sql = "select * from review order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReviewVO vo = new ReviewVO();
					
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setEmail(rs.getString("email"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setwDate(rs.getString("wDate"));
					vo.setPhoto(rs.getString("photo"));
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL 오류(getReviewList) : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return vos;
		}

		// 후기 삭제 처리
		public int setReviewDel(int idx) {
			int res = 0;
			try {
				sql = "delete from review where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.executeUpdate();
				res = 1;
			} catch (SQLException e) {
				System.out.println("SQL 오류(setReviewDel) : " + e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
			return res;
		}

		// 후기 저장 처리
		public int setReviewInputOk(ReviewVO vo) {
			int res = 0;
			try {
				sql = "insert into review values (default,?,?,?,?,?,default,?,default)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getEmail());
				pstmt.setString(3, vo.getTitle());
				pstmt.setString(4, vo.getContent());
				pstmt.setString(5, vo.getHostIp());
				pstmt.setString(6, vo.getPhoto());
				pstmt.executeUpdate();
				res = 1;
			} catch (SQLException e) {
				System.out.println("SQL 오류(setReviewInputOk) : " + e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
			return res;
		}

		// reviewInput에서 값 가져오기 (review 값 모두 가져오기)
		public ReviewVO getReviewContent() {
			ReviewVO vo = new ReviewVO();
			try {
				sql = "select * from review order by idx desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setEmail(rs.getString("email"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setwDate(rs.getString("wDate"));
					vo.setPhoto(rs.getString("photo"));
				}
			} catch (SQLException e) {
				System.out.println("SQL 오류(getReviewContent) : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return vo;
		}
}
