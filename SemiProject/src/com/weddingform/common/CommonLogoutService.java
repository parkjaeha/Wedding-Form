package com.weddingform.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonLogoutService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		if(method.equals("GET")) {
			HttpSession session = request.getSession();
			System.out.println("session: " + session);
			session.invalidate();//session time -> 0 
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../index.jsp");

		}else {
			
				actionFoward.setCheck(true);
				actionFoward.setPath("../index.jsp");
			
		}
		return actionFoward;
	}

}
