package com.weddingform.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.upload.UploadDAO;
import com.weddingform.upload.UploadDTO;

public class MemberUploadResultService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {

		ActionForward actionForward  = new ActionForward();
		
		System.out.println("Upload RESULT");

		
		String method = request.getMethod();

		if(method.equals("GET")) {
			
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberUploadResult.jsp");

		}else {
			
			String saveDirectory = request.getServletContext().getRealPath("./WEB-INF/view/upload");
			System.out.println(saveDirectory);
			int maxsize = 1024*1024*10;
			
			//아래 객체가 만들어지는 순간 파일 저장은 끝이났다.
			MultipartRequest multi=null;
			try {
				multi = new MultipartRequest(request, saveDirectory, maxsize, "UTF-8", new DefaultFileRenamePolicy());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
			//파일의 파라미터 이름 
			String fileSytemName = multi.getFilesystemName("f1"); //실제 저장된 파일네임
			String orginalName = multi.getOriginalFileName("f1"); //원래 저장된 파일 네임
			
			//db 에는 filesystem이 무조건 저장되어 있어야하고 orginal 은 옵션이다. 
			
			UploadDAO uploadDAO = new UploadDAO();
			UploadDTO uploadDTO = new UploadDTO();
			
			
			uploadDTO.setFname(fileSytemName);
			uploadDTO.setOname(orginalName);
			
			int result= 0;
			try {
				result = uploadDAO.insert(uploadDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String message = "fail";
			if(result>0){
				message = "success";
				System.out.println("성공");
			}
			
			request.setAttribute("message", message);
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberUploadResult.jsp");

		}

		return actionForward;
	}

}
