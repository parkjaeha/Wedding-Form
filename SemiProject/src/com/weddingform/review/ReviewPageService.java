package com.weddingform.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReviewPageService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/reviewPage.jsp");
		
		return actionForward;
	}

}
