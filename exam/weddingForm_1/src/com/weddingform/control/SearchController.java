package com.weddingform.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Object> map;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	map = new HashMap<>();
    	
    	//1. 파일명 구하기
    	String filename = config.getInitParameter("property");
    	//2. 실제경로 구하기
    	String realPath = config.getServletContext().getRealPath("WEB-INF/property");
    	
    	File file = new File(realPath, filename);
    	
    	//3. 파싱 준비
    	FileInputStream fi = null;
    	Properties properties = new Properties();
    	
    	try {
    	// 4. 파일 파싱하기
			fi = new FileInputStream(file);
			properties.load(fi);
			
			Iterator<Object> it = properties.keySet().iterator();
			while(it.hasNext()) {
				String key = (String)it.next();
				String value = (String)properties.get(key);
				
		// 6. value를 이용해 객체 생성
				Class obj = Class.forName(value);
				Object instance = obj.newInstance();
				
				map.put(key, instance);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int startIndex = request.getContextPath().length();
		int lastIndex = request.getRequestURI().lastIndexOf('.');
		uri = uri.substring(startIndex, lastIndex);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
