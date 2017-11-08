package com.weddingform.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//질문 게시판 삭제 서비스

public class QnaDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		QnaDAO qnaDAO=new QnaDAO();
		int ref=0;
	
		try {
			ref=Integer.parseInt(request.getParameter("ref"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int result=0;
		
		try {
			result=qnaDAO.delete(ref);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0) {
			request.setAttribute("message", "success");
			
		}else {
			request.setAttribute("message", "fail");
		}
		
		
		request.setAttribute("path", "./qnaList.qna");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionForward;
	}

}
