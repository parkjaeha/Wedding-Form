package com.weddingform.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReportPageService implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/reportPage.jsp");
		
		return actionForward;
	}

}
