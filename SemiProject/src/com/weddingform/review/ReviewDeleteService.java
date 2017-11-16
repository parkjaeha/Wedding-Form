package com.weddingform.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//후기 삭제 서비스

public class ReviewDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		ReviewDAO reviewDAO=new ReviewDAO();
		
		int num=0;
		String type="";
		try {
			num=Integer.parseInt(request.getParameter("num"));
			type=request.getParameter("type");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		int result=0;
		
		try {
			result=reviewDAO.delete(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result>0) {
			request.setAttribute("message", "삭제 성공");
			
		}else {
			request.setAttribute("message", "삭제 실패");
		}
		request.setAttribute("path", "./reviewList.review?type="+type+"&&curPage=1");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		return actionForward;
	}

}
