package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("*.me")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "WEB-INF/member";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")== null ? 99 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/MemberLogin")) {
			command = new MemberLoginCommand();
			command.execute(request, response);
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			viewPage += "/memberIdCheck.jsp";
		}	
		else if(com.equals("/MemberNickCheck")) {
			command = new MemberNickCheckCommand();
			command.execute(request, response);
			viewPage += "/memberNickCheck.jsp";
		}	
		else if(com.equals("/MemberFindMid")) {
			viewPage += "/memberFindMid.jsp";
		}	
		else if(com.equals("/MemberFindMidOk.me")) {
			command = new MemberFindMidOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberFindMidRes.me")) {
			command = new MemberFindMidResCommand();
			command.execute(request, response);
			viewPage = "/memberFindMidRes.jsp";
		}	
//		else if(com.equals("/MemberFindPwd")) {
//			viewPage += "/memberFindPwdOk.jsp";
//		}	
//		else if(com.equals("/MemberFindPwdOk.me")) {
//			command = new MemberFindPwdOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}	
		// 비회원(세션에 저장된 level이 1보다 클 경우) 초기화면으로 보내버린다.
		else if (level > 1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/MemberMypageMain")) {
			viewPage += "/memberMypageMain.jsp";
		}	
		else if(com.equals("/MemberMypageLeft")) {
			viewPage += "/memberMypageLeft.jsp";
		}	
		else if(com.equals("/MemberMypageContent")) {
			command = new MemberMypageContentCommand();
			command.execute(request, response);
			viewPage += "/memberMypageContent.jsp";
		}	
		else if(com.equals("/MemberMypageInfo")) {
			viewPage += "/memberMypageInfo.jsp";
		}	
		else if(com.equals("/MemberMypageInfoOk")) {
			command = new MemberMypageInfoOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberPwdCheckForm")) {
			viewPage += "/memberPwdCheckForm.jsp";
		}	
		else if(com.equals("/MemberPwdCheckOk")) {
			command = new MemberPwdCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberUpdate")) {
			command = new MemberUpdateCommand(); 
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";
		}	
		else if(com.equals("/MemberUpdateOk")) {
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberPwdUpdate")) {
			viewPage += "/memberPwdUpdate.jsp";
		}	
		else if(com.equals("/MemberPwdUpdateOk")) {
			command = new MemberPwdUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}	
		else if(com.equals("/MemberEventContent")) {
			command = new MemberEventContentCommand();
			command.execute(request, response);
			viewPage += "/memberEventContent.jsp";
		}	
		else if(com.equals("/MemberEventAll")) {
			command = new MemberEventAllCommand(); 
			command.execute(request, response);
			viewPage += "/memberEventAll.jsp";
		}	
		else if(com.equals("/MemberEventRezList")) {
			command = new MemberEventRezListCommand();
			command.execute(request, response);
			viewPage += "/memberEventRezList.jsp";
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
		else if(com.equals("/MemberEventRezCancle")) {
			command = new MemberEventRezCancleCommand();
			command.execute(request, response);
			return;
		}	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
