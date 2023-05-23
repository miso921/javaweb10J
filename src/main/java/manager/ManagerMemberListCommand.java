package manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerMemberListCommand implements ManagerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = new ManagerDAO();
		
		//페이징 처리
		int pag = request.getParameter("pag")== null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")== null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = request.getParameter("totRecCnt")== null ? 0 : Integer.parseInt(request.getParameter("totRecCnt"));
		int totPage = request.getParameter("totPage")== null ? 0 : Integer.parseInt(request.getParameter("totPage"));
		int statrIndexNo = request.getParameter("statrIndexNo")== null ? 0 : Integer.parseInt(request.getParameter("statrIndexNo"));
		int curScrStartNo = request.getParameter("curScrStartNo")== null ? 0 : Integer.parseInt(request.getParameter("curScrStartNo"));
		
		//블록 페이징 처리
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		// 지정된 페이지의 자료를 요청한 한 페이지 분량만큼 가져온다!
		ArrayList<ManagerVO> vos = dao.getEventList(statrIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}
}
