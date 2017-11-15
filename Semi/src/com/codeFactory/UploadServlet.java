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
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.weddingform.action.ActionForward;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String UPLOAD_DIRECTORY = "E:\\workspace_park\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Semi\\uploads";
	
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
		
		if(ServletFileUpload.isMultipartContent(request)) {
			//String saveDirectory = request.getServletContext().getRealPath("upload");
			//System.out.println(saveDirectory);
			//UPLOAD_DIRECTORY = saveDirectory;
			/*int maxsize = 1024*1024*10;
			
			//아래 객체가 만들어지는 순간 파일 저장은 끝이났다.
			MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxsize, "UTF-8", new DefaultFileRenamePolicy());	
			*/
			try {
				List<FileItem> multiparts = new ServletFileUpload(new org.apache.commons.fileupload.disk.DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts){
					
					System.out.println("file item: "+ item);
					System.out.println("file name: " + item.getName());
					System.out.println("field name: " + item.getFieldName());
					if(!item.isFormField()) {
						String name = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
					
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
