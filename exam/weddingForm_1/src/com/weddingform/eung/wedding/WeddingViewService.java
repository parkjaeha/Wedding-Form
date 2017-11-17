package com.weddingform.eung.wedding;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.extra.ExtraDAO;
import com.weddingform.eung.extra.ExtraDTO;

public class WeddingViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String type = request.getParameter("type");
		if(type == null) {
			type="hotel";
		}
		
		ExtraDAO extraDAO = new ExtraDAO();
		ExtraDTO extraDTO = new ExtraDTO();
		extraDTO.setType(type);
		
		try {
			ArrayList<ExtraDTO> ar = extraDAO.selectList(extraDTO);
			
			if(ar.size() > 0) {
				request.setAttribute("list", ar);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);

		if(request.getMethod().equals("GET")) {
			actionForward.setPath("../WEB-INF/view/wedding/weddingView.jsp");
			
		} else {
			actionForward.setPath("../WEB-INF/view/wedding/weddingHouse.jsp");
		}
		
		return actionForward;
	}
}
