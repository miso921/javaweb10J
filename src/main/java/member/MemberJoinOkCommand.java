package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		String nick = request.getParameter("nick") == null ? "" : request.getParameter("nick"); 
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday"); 
		String address = request.getParameter("address") == null ? "" : request.getParameter("address"); 
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel"); 
		String email = request.getParameter("email") == null ? "" : request.getParameter("email"); 
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender"); 
		String userDel = request.getParameter("userDel") == null ? "" : request.getParameter("userDel");
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("msg", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.lo");
			return;
		}
		
		// 비밀번호 암호화
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 모두 체크되었으면 회원정보를 vo에 담아서 DB에 저장한다.
		vo = new MemberVO();
		vo.setName(name);
		vo.setMid(mid);
		vo.setNick(nick);
		vo.setPwd(pwd);
		vo.setSalt(salt);
		vo.setBirthday(birthday);
		vo.setAddress(address);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setGender(gender);
		vo.setUserDel(userDel);
		
		int res = dao.setLoginJoinOk(vo);
		
		
		if(res == 1) {
			request.setAttribute("msg", "회원가입되었습니다!");
			request.setAttribute("url", request.getContextPath()+"/");
		}
		else {
			request.setAttribute("msg", "NO");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.me");
		}
	}
}
