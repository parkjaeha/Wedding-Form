package com.codeFactory;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.weddingform.action.ActionForward;
import com.weddingform.upload.UploadDAO;
import com.weddingform.upload.UploadDTO;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String UPLOAD_DIRECTORY = "E:\\workspaceJSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Semi\\uploads";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UploadDAO uploadDAO = new UploadDAO();
		UploadDTO uploadDTO = new UploadDTO();
		if(ServletFileUpload.isMultipartContent(request)) {
			String saveDirectory = request.getServletContext().getRealPath("uploads");
			System.out.println(saveDirectory);
		
			//UPLOAD_DIRECTORY = saveDirectory;
			//int maxsize = 1024*1024*10;
			/*
			//�븘�옒 媛앹껜媛� 留뚮뱾�뼱吏��뒗 �닚媛� �뙆�씪 ���옣�� �걹�씠�궗�떎.
			MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxsize, "UTF-8", new DefaultFileRenamePolicy());	
			*/
			int i =1;
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
						String name = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
						uploadDTO.setFname(name);
						uploadDTO.setId("iu");
						uploadDTO.setNum(i);
						
						try {
						System.out.println("upload..");
						result = uploadDAO.insert(uploadDTO);
						System.out.println("upload success");
						}catch (Exception e) {
							// TODO: handle exception	
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
		actionForward.setPath("../progressbar3.jsp");
		
		//request.getRequestDispatcher("/result.jsp").forward(request, response);
		
		
	}

}
