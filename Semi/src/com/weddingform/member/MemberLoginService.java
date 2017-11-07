package com.weddingform.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//사용자 정보 로그인 서비스

public class MemberLoginService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		System.out.println("Login");

		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberLogin.jsp");

		}else {
			
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberLogin.jsp");

		}
		
		return actionForward;
	}

}
