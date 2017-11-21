package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonForgotService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		if(method.equals("POST")) {
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");

		}else {
			
			String type =  request.getParameter("type");
			
			if(type.equals("id")) {
				request.setAttribute("result","id");
				System.out.println("enter id form");
			}else {
				request.setAttribute("result","pass");
				System.out.println("enter pass form");
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonForgot.jsp");
		}
		return actionFoward;
	}

}
