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
		String sNick = (String) session.getAttribute("sNick");
		
		String name = request.getParameter("name")== null ? "" : request.getParameter("name");
		String nick = request.getParameter("nick") == null ? "" : request.getParameter("nick");
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday");
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		
		// 백엔드 체크
		
		// 아이디, 닉네임 중복 체크
		MemberDAO dao = new MemberDAO();
		
		if(!nick.equals(sNick)) {
			String tempNick = dao.getMemberNickCheck(nick).getNick();
			if(tempNick != null) {
				request.setAttribute("msg", "이미 사용중인 닉네임입니다.");
				request.setAttribute("url", request.getContextPath()+"/MemberUpdate.me");
				return;
			}
		}
		
		// 모든 확인이 완료되면 vo에 담아서 DB(DAO객체)로 넘겨준다.
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setMid(mid);
		vo.setNick(nick);
		vo.setBirthday(birthday);
		vo.setAddress(address);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setGender(gender);
		
		int res = dao.getMemberUpdateOk(vo);
		
		if(res == 1) {
			session.setAttribute("sNick", nick);
			request.setAttribute("msg", "회원정보가 수정되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/memberMypageMain.me");
		}
		else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다!");
			request.setAttribute("url", request.getContextPath()+"/memberUpdate.me");
		}
	}
}
