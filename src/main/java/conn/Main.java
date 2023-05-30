package conn;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.ManagerDAO;
import manager.ManagerVO;

@WebServlet("/Main")
public class Main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/main/main.jsp";
		
		ManagerDAO dao = new ManagerDAO();
		
		ArrayList<ManagerVO> vos = dao.getEventList(0, 15);
		
		
		request.setAttribute("vos", vos);
		System.out.println("vos:" +vos);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response); 
		// 컨트롤러가 없기 때문에 command객체에서 바로 dispatcher로 경로이동!!!
	}
}
