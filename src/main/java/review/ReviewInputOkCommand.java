package review;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.MemberInterface;

public class ReviewInputOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/review");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장할 최대용량을 30MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드처리(객체가 생성되면서 파일이 업로드처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		int fileSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
		String mid = multipartRequest.getParameter("mid") == null ? "" : multipartRequest.getParameter("mid");
		String email = multipartRequest.getParameter("email") == null ? "" : multipartRequest.getParameter("email");
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp") == null ? "" : multipartRequest.getParameter("hostIp");
		String fName1 = multipartRequest.getParameter("fName1") == null ? "" : multipartRequest.getParameter("fName1");
		
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 업로드된 파일의 정보 추출
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			//if(multipartRequest.getFilesystemName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";
				filesystemName += multipartRequest.getFilesystemName(file) + "/";
			//}
			}
			originalFileName = originalFileName.substring(0, originalFileName.length()-1);
			filesystemName = filesystemName.substring(0, filesystemName.length()-1);
			
			ReviewVO vo = new ReviewVO();
			vo.setMid(mid);
			vo.setEmail(email);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setHostIp(hostIp);
			vo.setPhoto(filesystemName);
			
			ReviewDAO dao = new ReviewDAO();
			int res = dao.setReviewInputOk(vo);
			
			if(res == 1) {
				request.setAttribute("msg", "후기가 등록되었습니다!");
				request.setAttribute("url", request.getContextPath()+"${ctp}/ReviewList.re?pag="+pag+"&pageSize="+pageSize);
				request.setAttribute("vo", vo);
			}
			else {
				request.setAttribute("msg", "후기 등록이 불가합니다!\\n다시 한번 확인해주세요.");
				request.setAttribute("url", request.getContextPath()+"${ctp}/ReviewInput.re");
			}
	}
}
