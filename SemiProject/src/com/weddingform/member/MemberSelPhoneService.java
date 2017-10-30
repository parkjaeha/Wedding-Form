package com.weddingform.member;


import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class MemberSelPhoneService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		ActionForward actionForward  = new ActionForward();

		System.out.println("SelPhone");

		
		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberSelPhone.jsp");

		}else {
			
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberSelPhone.jsp");

		}

		return actionForward;
	}

}
