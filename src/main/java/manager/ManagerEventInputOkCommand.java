package manager;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ManagerEventInputOkCommand implements ManagerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/event");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장할 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드처리(객체가 생성되면서 파일이 업로드처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보 추출
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";
				filesystemName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
		originalFileName = originalFileName.substring(0, originalFileName.length()-1);
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		// 전송된 폼의 값들을 모두 받아온다.
		int fileSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String eventName = multipartRequest.getParameter("eventName")==null ? "" : multipartRequest.getParameter("eventName");
		String eTime = multipartRequest.getParameter("eTime")==null ? "" : multipartRequest.getParameter("eTime");
		int ticketNum = multipartRequest.getParameter("ticketNum")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("ticketNum"));
		String place = multipartRequest.getParameter("place")==null ? "" : multipartRequest.getParameter("place");
		String target = multipartRequest.getParameter("target")==null ? "" : multipartRequest.getParameter("target");
		int people = multipartRequest.getParameter("people")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("people"));
		int money = multipartRequest.getParameter("money")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("money"));
		String part = multipartRequest.getParameter("part")==null ? "" : multipartRequest.getParameter("part");
		String thumbnail = multipartRequest.getParameter("thumbnail")==null ? "" : multipartRequest.getParameter("thumbnail");
		String detail = multipartRequest.getParameter("detail")==null ? "" : multipartRequest.getParameter("detail");
		String road = multipartRequest.getParameter("road")==null ? "" : multipartRequest.getParameter("road");
		
		ManagerVO vo = new ManagerVO();
		vo.setEventName(eventName);
		vo.seteTime(eTime);
		vo.setTicketNum(ticketNum);
		vo.setPlace(place);
		vo.setTarget(target);
		vo.setPeople(people);
		vo.setMoney(money);
		vo.setPart(part);
		vo.setThumbnail(filesystemName);
		vo.setDetail(filesystemName);
		vo.setRoad(filesystemName);
		
		ManagerDAO dao = new ManagerDAO();
		int res = dao.setManagerEventInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "행사가 등록되었습니다!");
			request.setAttribute("url", request.getContextPath()+"ManagerEventList.ma");
		}
		else {
			request.setAttribute("msg", "등록이 불가합니다.\\n다시 확인해주세요!");
			request.setAttribute("url", request.getContextPath()+"ManagerEventInput.ma");
		}
	}
}
