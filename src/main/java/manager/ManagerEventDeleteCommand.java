package manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerEventDeleteCommand implements ManagerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sw = request.getParameter("sw")== null ? 0 : Integer.parseInt(request.getParameter("sw"));
		ManagerDAO dao = new ManagerDAO();
		
		// 선택 삭제
		if(sw == 1) {
			String changeItem = request.getParameter("changeItems")==null ? "" : request.getParameter("changeItems");
			
			String[] changeItems = changeItem.split("/");
			
			for(String item : changeItems) {
				dao.setEventSelectedDel(Integer.parseInt(item));
			}
		}
		else {
			int idx = request.getParameter("idx")== null ? 0 : Integer.parseInt(request.getParameter("idx"));
			
			dao.setEventSelectedDel(idx);
		
			
		}
	}
}
