package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindMidOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String nick = request.getParameter("nick")== null ? "" : request.getParameter("nick");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberFindMidOk(name,nick);
		
		if(vo.getName() == null) {
			request.setAttribute("msg","존재하지 않는 회원입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberFindMid.me");
		}
		else {
			request.setAttribute("msg", "NO");
			request.setAttribute("url", request.getContextPath()+"/MemberFindMidOk.me?name="+name+"&nick="+nick);
		}
		return;
	}
}
