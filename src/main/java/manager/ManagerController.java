package manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ma")
public class ManagerController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerInterface command = null;
		String viewPage = "WEB-INF/manager";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/ManagerMain")) {
			viewPage += "/managerMain.jsp";
		}
		else if(com.equals("/ManagerLeft")) {
			viewPage += "/managerLeft.jsp";
		}
		else if(com.equals("/ManagerContent")) {
			command = new ManagerContentCommand();
			command.execute(request, response);
			viewPage += "/managerContent.jsp";
		}
		else if(com.equals("/ManagerEventInput")) {
			viewPage += "/managerEventInput.jsp";
		}
		else if(com.equals("/ManagerEventInputOk")) {
			command = new ManagerEventInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ManagerEventList")) {
			command = new ManagerEventListCommand();
			command.execute(request, response);
			viewPage += "/managerEventList.jsp";
		}
		else if(com.equals("/ManagerEventContent")) {
			viewPage += "/managerEventContent.jsp";
		}
		else if(com.equals("/ManagerEventDelete")) {
			command = new ManagerEventDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ManagerMemberList")) {
			command = new ManagerMemberListCommand();
			command.execute(request, response);
			viewPage += "/managerMemberList.jsp";
		}
		else if(com.equals("/ManagerMemeberLevelChange")) {
			command = new ManagerMemeberLevelChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ManagerMemeberLevelTotalChange")) {
			command = new ManagerMemeberLevelTotalChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ManagerMemberDelete")) {
			command = new ManagerMemberDeleteCommand();
			command.execute(request, response);
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
