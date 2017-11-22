package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;


public class CommonIdCheckService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		if(method.equals("POST")) {
			CommonDAO commonDAO = new CommonDAO();
			boolean result = false;
			String id = request.getParameter("id");
			
			try {
			 result = commonDAO.idCheck(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("result", result);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");

		}else {
			
		}
		return actionFoward;
	}

}
