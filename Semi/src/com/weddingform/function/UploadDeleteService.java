package com.weddingform.function;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.upload.UploadDAO;
import com.weddingform.upload.UploadDTO;

public class UploadDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Upload Delete");
		
		String method = request.getMethod();

		
		if(method.equals("GET")) {
			
			System.out.println("GET");
			UploadDAO uploadDAO = new UploadDAO();
			
			int num  = 0 ; 
			int result = 0;
			try {
			num = Integer.parseInt(request.getParameter("num"));
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			try {
				result =  uploadDAO.delete(num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result>0) {
				System.out.println("success");
			}
			
			actionForward.setCheck(true);
			actionForward.setPath("../uploadView.jsp");

		}else {
			
			System.out.println("POST");
			
			actionForward.setCheck(true);
			actionForward.setPath("../progressbar3.jsp");
			

			
		}

		return actionForward;
	}

}
