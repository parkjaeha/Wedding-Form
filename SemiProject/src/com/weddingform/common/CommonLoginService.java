package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonLoginService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		if(method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonLogin.jsp");

		}else {
			HttpSession session = request.getSession();
			CommonDAO commonDAO= new CommonDAO();
			CommonDTO commonDTO= new CommonDTO();
			commonDTO.setId(request.getParameter("id"));
			commonDTO.setPw(request.getParameter("pw"));
			commonDTO.setJob(request.getParameter("job"));

			try {
				commonDTO=commonDAO.selectOne(commonDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				commonDTO = null;
				e.printStackTrace();
			}

			if(commonDTO != null) {
				session.setAttribute("common", commonDTO);
				actionFoward.setCheck(false);
				actionFoward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "로그인 실패");
				request.setAttribute("path", "../index.jsp");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}
		return actionFoward;
	}

}
