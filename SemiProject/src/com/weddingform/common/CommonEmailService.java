package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonEmailService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonLogin.jsp");

		}else {
				
				String id = request.getParameter("id");
				String email = request.getParameter("email");
				boolean result = false;
				CommonDAO commonDAO =  new CommonDAO();
				try {
					//result = commonDAO.idCheck(id, email);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				if(result ==true) {
					request.setAttribute("message", "email의 임시비밀번호를 확인해주세요.");
					request.setAttribute("path", "../WEB-INF/view/common/commonLogin.jsp");
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				}else {
					request.setAttribute("message", "존재하지 않는 id or email 입니다.");
					request.setAttribute("path", "../WEB-INF/view/common/commonPassword.jsp");
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				}
		}
		return actionFoward;
	}

}
