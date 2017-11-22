package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonEmailCheckService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();
		
		System.out.println("email check");
		
		if(method.equals("GET")) {
		
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
			

		}else {
			boolean result = false;
			String email = request.getParameter("email");
			
			CommonDAO commonDAO = new CommonDAO();
			try {
				result = commonDAO.emailCheck(email);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("result", result);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");

		}
		
	
		
		return actionFoward;
	}





}
