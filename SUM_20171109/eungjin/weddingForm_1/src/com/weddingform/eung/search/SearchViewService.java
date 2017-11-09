package com.weddingform.eung.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class SearchViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		ExtraDTO extraDTO = new ExtraDTO();
		extraDTO.setId(request.getParameter("id"));
		
		ExtraDAO extraDAO = new ExtraDAO();
		try {
			extraDTO = extraDAO.searchOne(extraDTO);
			
			request.setAttribute("view", extraDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchView.jsp");
		
		return actionForward;
	}
}
