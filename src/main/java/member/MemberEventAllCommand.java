package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.ManagerDAO;
import manager.ManagerVO;

public class MemberEventAllCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = new ManagerDAO();
		
		ArrayList<ManagerVO> vos = dao.getEventList(0, 12);
		
		int totRecCnt = dao.getTotRecCnt(3);
		
		request.setAttribute("vos", vos);
		request.setAttribute("totRecCnt", totRecCnt);
	}
}