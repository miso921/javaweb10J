package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("nick") == null ? "" : request.getParameter("nick");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberNickCheck(nick);
		
		if(vo.getNick() == null) {
			request.setAttribute("res", 1);
		}
		else {
			request.setAttribute("res", 0);
		}
		request.setAttribute("nick", nick);
	}

}
