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
			
			//�븘�옒 媛앹껜媛� 留뚮뱾�뼱吏��뒗 �닚媛� �뙆�씪 ���옣�� �걹�씠�궗�떎.
			MultipartRequest multi=null;
			try {
				multi = new MultipartRequest(request, saveDirectory, maxsize, "UTF-8", new DefaultFileRenamePolicy());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
			//�뙆�씪�쓽 �뙆�씪誘명꽣 �씠由� 
			String fileSytemName = multi.getFilesystemName("f1"); //�떎�젣 ���옣�맂 �뙆�씪�꽕�엫
			String orginalName = multi.getOriginalFileName("f1"); //�썝�옒 ���옣�맂 �뙆�씪 �꽕�엫
			
			//db �뿉�뒗 filesystem�씠 臾댁“嫄� ���옣�릺�뼱 �엳�뼱�빞�븯怨� orginal �� �샃�뀡�씠�떎. 
			
			UploadDAO uploadDAO = new UploadDAO();
			UploadDTO uploadDTO = new UploadDTO();
			
			
			uploadDTO.setFname(fileSytemName);
			//uploadDTO.setOname(orginalName);
			
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
				System.out.println("�꽦怨�");
			}
			
			request.setAttribute("message", message);
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberUploadResult.jsp");

		}

		return actionForward;
	}

}
