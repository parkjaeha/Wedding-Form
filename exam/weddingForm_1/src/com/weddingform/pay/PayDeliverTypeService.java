package com.weddingform.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class PayDeliverTypeService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		System.out.println("pay deliver type service");
		
		String type = "Basic";
		try {
			type = request.getParameter("type");
		} catch (Exception e) {	}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/pay/pay"+type+"Deliver.jsp");
		
		return actionForward;
	}

}
