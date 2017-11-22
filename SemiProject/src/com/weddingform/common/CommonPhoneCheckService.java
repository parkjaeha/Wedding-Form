package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonPhoneCheckService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();
		
		System.out.println("phone check");
		
		if(method.equals("GET")) {
		
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
			

		}else {
			boolean result = false;
			String phone = request.getParameter("phone");
			
			CommonDAO commonDAO = new CommonDAO();
			try {
				result = commonDAO.phoneCheck(phone);
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
