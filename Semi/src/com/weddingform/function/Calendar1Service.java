package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class Calendar1Service implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar");

		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar1.jsp");

		}else {
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar1.jsp");
		}

		return actionForward;
		
	
	}

}
