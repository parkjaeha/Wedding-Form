package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonCustomerService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		System.out.println("Customer");
		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonCustomer.jsp");

		}else {
			
		}
		return actionFoward;
	}

}
