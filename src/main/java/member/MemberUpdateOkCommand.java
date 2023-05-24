package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday");
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		
		// 백엔드 체크
		
		MemberDAO dao = new MemberDAO();
		// 모든 확인이 완료되면 vo에 담아서 DB(DAO객체)로 넘겨준다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setName(name);
		vo.setBirthday(birthday);
		vo.setAddress(address);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setGender(gender);
		
		int res = dao.setMemberUpdateOk(vo);
		System.out.println("vo : " + vo);
		if(res == 1) {
			request.setAttribute("msg", "회원정보가 수정되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMypageContent.me");
		}
		else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다!");
			request.setAttribute("url", request.getContextPath()+"/MemberUpdate.me");
		}
	}
}
