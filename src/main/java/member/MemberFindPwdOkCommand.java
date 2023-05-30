package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberFindPwdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
//		비밀번호 찾기는 나중에 만들어보자
//		MemberVO vo = dao.getMemberFindPwdOk();
		
//		SecurityUtil security = new SecurityUtil();
//		pwd = security.encryptSHA256(vo.getSalt() + pwd);
//		
//		if(!pwd.equals(vo.getPwd())) {
//			request.setAttribute("msg", "비밀번호를 확인하세요!");
//			request.setAttribute("url", request.getContextPath()+"${ctp}/MemberFindPwd.me");
//		}
//		else {
//			request.setAttribute("msg", "비밀번호를 변경하세요!");
//			request.setAttribute("url", request.getContextPath()+"${ctp}/MemberFindPwd.me");
//		}
		
	}

}
