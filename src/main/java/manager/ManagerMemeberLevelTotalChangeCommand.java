package manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerMemeberLevelTotalChangeCommand implements ManagerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level") == null ? 1 : Integer.parseInt(request.getParameter("level"));
		String changeItem = request.getParameter("changeItems") == null ? "" : request.getParameter("changeItems");
		
		String[] changeItems = changeItem.split("/");
		
		ManagerDAO dao = new ManagerDAO();
		
		for(String item : changeItems) {
			dao.setMemberLevelChange(level, Integer.parseInt(item));
			
			System.out.println(level+item);
		}
	}
}
