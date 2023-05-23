package manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerEventDeleteCommand implements ManagerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")== null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")== null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")== null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		ManagerDAO dao = new ManagerDAO();
		
		int res = dao.setManagerEventDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "선택한 행사정보가 삭제되었습니다!");
			request.setAttribute("url", request.getContextPath()+"/ManagerEventList.ma?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "행사정보 삭제에 실패했습니다!");
			request.setAttribute("url", request.getContextPath()+"/ManagerEventContent.ma?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}
}
