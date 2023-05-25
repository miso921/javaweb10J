package memberRez;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberEventRezCancleCommand implements MemberRezInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		MemberRezDAO dao = new MemberRezDAO();
		
		int res = dao.setMemberRezCancle(idx);
		
		response.getWriter().write(res);
	}

}
