package com.weddingform.function;

import java.io.File;
import java.io.UnsupportedEncodingException;
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

public class UploadViewService implements Action {
	private String UPLOAD_DIRECTORY = "E:\\eungjin\\workspace\\workspace_jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\weddingForm_1\\uploads";
	
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Upload View");
		
		String method = request.getMethod();

		
		if(method.equals("GET")) {
			
			System.out.println("GET");
			
			UploadDAO uploadDAO = new UploadDAO();
			UploadDTO uploadDTO = new UploadDTO();
			uploadDTO.setId("ID 03");
			List<UploadDTO> ar = new ArrayList<>();
			
			try {
				ar =  uploadDAO.selectALL(uploadDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//String saveDirectory = request.getServletContext().getRealPath("uploads");
			
			request.setAttribute("result", ar);
			actionForward.setCheck(true);
			actionForward.setPath("../uploadView.jsp");

		}else {
			
			System.out.println("POST");

			
			UploadDAO uploadDAO = new UploadDAO();
			UploadDTO uploadDTO = new UploadDTO();
			UploadDTO uploadDTO2 = null;
			try {
				uploadDTO2 =  uploadDAO.selectOne("ID 03");
				//System.out.println("desc : " + uploadDTO2.getNum());
			} catch (Exception e1) {				
				// TODO Auto-generated catch block
				e1.printStackTrace();
				uploadDTO2 = null;
			}
			int i =0;
			if(ServletFileUpload.isMultipartContent(request)) {
				String saveDirectory = request.getServletContext().getRealPath("uploads");
				System.out.println(saveDirectory);
				//UPLOAD_DIRECTORY = saveDirectory;
				//int maxsize = 1024*1024*10;
				/*
				//�븘�옒 媛앹껜媛� 留뚮뱾�뼱吏��뒗 �닚媛� �뙆�씪 ���옣�� �걹�씠�궗�떎.
				MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxsize, "UTF-8", new DefaultFileRenamePolicy());	
				*/
				if(uploadDTO2 != null) {
					i = i+uploadDTO2.getNum();
				}
				
				int result =0 ;
				try {
					List<FileItem> multiparts = new ServletFileUpload(new org.apache.commons.fileupload.disk.DiskFileItemFactory()).parseRequest(request);
					for(FileItem item : multiparts){
						//System.out.println("test: "  + new MultipartRequest(request,saveDirectory,maxsize,"UTF-8",new DefaultFileRenamePolicy()));
						//System.out.println("itme: " + ((MultipartRequest) item).getFilesystemName(item.getName()));
						System.out.println("file item: "+ item);
						System.out.println("file name: " + item.getName());
						System.out.println("field name: " + item.getFieldName() + "file separator : "+ File.separator);
						if(!item.isFormField()) {
							i=i+1;
							String name = new File(item.getName()).getName();
							item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
							uploadDTO.setFname(name);
							uploadDTO.setId("ID 03");
							uploadDTO.setNum(i);
						
							try {
							System.out.println("upload.." + i);
							result = uploadDAO.insert(uploadDTO);

							System.out.println("upload success");
							}catch (Exception e) {
								// TODO: handle exception	
								e.printStackTrace();
							}
							
						}
						
						if(result > 0) {
							System.out.println("success");
						}else {
							System.out.println("fail");
						}
						
					}
					
					request.setAttribute("message", "File Uploaded SuccessFully.");
				
				}catch (Exception e) {
					// TODO: handle exception
					request.setAttribute("message", "File Upload Failed due to: "+ e);
				}
				
			}else {
				request.setAttribute("message", "Sorry this servlet only handles file upload reqest.");
			}
			
			actionForward.setCheck(true);
			actionForward.setPath("../dragable.jsp");
			

			
		}

		return actionForward;
	}

}
