package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave") == null ? "" : request.getParameter("idSave");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(vo.getSalt() == null || vo.getUserDel().equals("OK")) {
			request.setAttribute("msg", "회원정보가 없습니다.\\n다시 입력하세요.");
			request.setAttribute("url", request.getContextPath()+"/Login.lo");
			return;
		}
		
		String salt = vo.getSalt();
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!pwd.equals(vo.getPwd())) {
//			request.setAttribute("msg", "비밀번호를 확인하세요!");
//			request.setAttribute("url", request.getContextPath()+"/Login.lo");
			response.getWriter().write("0");
			return;
		}
		
		// 로그인 성공시에 처리할 내용(1.주요 필드를 세션에 저장!  2.쿠키에 아이디 저장 유무)
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNick", vo.getNick());
		session.setAttribute("sLevel", vo.getLevel());
		
		// 2번
		Cookie cMid = new Cookie("cMid", mid);
		if(idSave.equals("on")) {
			cMid.setMaxAge(60*60*24*7);
		}
		else {
			cMid.setMaxAge(0);
		}
		response.addCookie(cMid);
		
		response.getWriter().write("1");
		
		
		request.setAttribute("vo", vo);
//		request.setAttribute("msg", vo.getMid() + (vo.getNick()) + "님 로그인 되었습니다!");
//		request.setAttribute("url", request.getContextPath()+"/");
		
//		JSONObject json = new JSONObject();
//		json.put("jMid",vo.getMid());
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(json.toString());
		
	}
	
	
}
