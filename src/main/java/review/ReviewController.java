package review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberInterface;

@SuppressWarnings("serial")
@WebServlet("*.re")
public class ReviewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "WEB-INF/review";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")== null ? 99 : (int) session.getAttribute("sLevel");
		
		// 비회원(세션에 저장된 level이 1보다 클 경우) 초기화면으로 보내버린다.
		if (level > 1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/ReviewInput")) {
			command = new ReviewInputCommand();
			command.execute(request, response);
			viewPage += "/reviewInput.jsp";
		}	
		else if(com.equals("/ReviewList")) {
			command = new ReviewListCommand();
			command.execute(request, response);
			viewPage += "/reviewList.jsp";
		}	
		else if(com.equals("/ReviewDel")) {
			command = new ReviewDelCommand();
			command.execute(request, response);
			return;
		}	
		else if(com.equals("/ReviewInputOk")) {
			command = new ReviewInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
