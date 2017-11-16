package com.weddingform.review;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.report.ReportDAO;
import com.weddingform.report.ReportDTO;

//후기 쓰기 서비스

public class ReviewWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
	   String method=request.getMethod();
	  
	   if(method.equals("POST")) {
		 ReviewDAO reviewDAO=new ReviewDAO();
		 ReviewDTO reviewDTO=new ReviewDTO();
		 reviewDTO.setTitle(request.getParameter("title"));
		 reviewDTO.setContents(request.getParameter("smarteditor"));
		 System.out.println("contents : "+reviewDTO.getContents());
		 reviewDTO.setWriter(request.getParameter("writer"));
		 reviewDTO.setType(request.getParameter("type"));
		 reviewDTO.setStar_score(Integer.parseInt(request.getParameter("starscore")));
		   
		 try {
			int result=reviewDAO.insert(reviewDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 

		 actionForward.setCheck(false);
		 actionForward.setPath("./reviewList.review?type="+reviewDTO.getType()+"&&curPage=1");
	   }else {
		   actionForward.setCheck(true);
		   actionForward.setPath("../WEB-INF/view/board/reviewWrite.jsp");
	   }
		
		
		
		return actionForward;
	}

}
