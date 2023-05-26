package memberRez;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mer")
public class MemberRezController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberRezInterface command = null;
		String viewPage = "WEB-INF/memberRez";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")== null ? 99 : (int) session.getAttribute("sLevel");
		
		// 비회원(세션에 저장된 level이 1보다 클 경우) 초기화면으로 보내버린다.
		if (level > 1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/MemberEventRez")) {
			command = new MemberEventRezCommand();
			command.execute(request, response);
			viewPage += "/memberEventRez.jsp";
		}
		else if(com.equals("/MemberEventRezOk")) {
			command = new MemberEventRezOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberEventRezList")) {
			command = new MemberEventRezListCommand();
			command.execute(request, response);
			viewPage += "/memberEventRezList.jsp";
		}
		else if(com.equals("/MemberEventRezCancle")) {
			command = new MemberEventRezCancleCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ManagerEventTotalList")) {
			command = new ManagerEventTotalListCommand();
			command.execute(request, response);
			viewPage += "/memberEventRezList.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
