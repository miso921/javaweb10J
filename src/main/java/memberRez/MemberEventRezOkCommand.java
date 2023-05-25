package memberRez;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberEventRezOkCommand implements MemberRezInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		int idx = (request.getParameter("idx") == null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx")); 
		String eventName = request.getParameter("eventName");
		String rDate = request.getParameter("rDate") == null ?  "" : request.getParameter("rDate");
		String eTime = request.getParameter("eTime");
		int rPeopleNum = request.getParameter("rPeopleNum") == null ? 0 : Integer.parseInt(request.getParameter("rPeopleNum")); 
		
		MemberRezDAO dao = new MemberRezDAO();
		
		MemberRezVO vo = new MemberRezVO();
		
		vo.setEventName(eventName);
		vo.setMid(mid);
		vo.setrDate(rDate);
		vo.setrTime(eTime);
		vo.setrPeopleNum(rPeopleNum);
//		System.out.println("vo :" + vo);
		int res = dao.setMemberRezOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "예약이 완료되었습니다 ^__^");
			request.setAttribute("url", request.getContextPath()+"/MemberEventContent.me?idx="+idx);
		}
		else {
			request.setAttribute("msg", "예약에 실패했습니다!");
			request.setAttribute("url", request.getContextPath()+"/MemberEventRez.mer?idx="+idx);
		}
		
		
	}

}
