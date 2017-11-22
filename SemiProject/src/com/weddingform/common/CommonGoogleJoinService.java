package com.weddingform.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonGoogleJoinService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();
		System.out.println("googlelogin service");
		if(method.equals("GET")) {
			
			String type = request.getParameter("type");
			CommonDAO commonDAO = new CommonDAO();
			boolean result = false;
			String id = request.getParameter("id");
			System.out.println("id: " +id);
			
			if(type.equals("google_signup")) {
				System.out.println("google_signup");
				try {
				 result = commonDAO.idCheck(id);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("result", result);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
				
			}
			
		}else {
			HttpSession session = request.getSession();
			CommonDAO commonDAO= new CommonDAO();
			CommonDTO commonDTO= new CommonDTO();
			commonDTO.setId(request.getParameter("id"));
			commonDTO.setPw(request.getParameter("password"));
			commonDTO.setJob(request.getParameter("job"));
			System.out.println(commonDTO.getId() + commonDTO.getPw());

			try {
				commonDTO=commonDAO.selectOne(commonDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				commonDTO = null;
				e.printStackTrace();
			}
			
			System.out.println("login dto" + commonDTO );
			if(commonDTO != null) {
				session.setAttribute("common", commonDTO);
				actionFoward.setCheck(true);
				actionFoward.setPath("../main.jsp");
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
