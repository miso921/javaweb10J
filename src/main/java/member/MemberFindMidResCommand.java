package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindMidResCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String nick = request.getParameter("nick")==null ? "" : request.getParameter("nick");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberFindMidOk(name, nick);
		
		request.setAttribute("name", vo.getName());
		request.setAttribute("nick", vo.getNick());
		request.setAttribute("mid", vo.getMid());
	}
}
