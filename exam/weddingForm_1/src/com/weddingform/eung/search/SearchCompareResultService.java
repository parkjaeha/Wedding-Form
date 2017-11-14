package com.weddingform.eung.search;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class SearchCompareResultService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ExtraDAO extraDAO = new ExtraDAO();
		HashMap<String, Object> map = new HashMap<>();
		
		Enumeration<String> em = request.getParameterNames();
		while(em.hasMoreElements()) {
			String name = em.nextElement();
			String[] values = request.getParameterValues(name);
			map.put(name, values);
		}
		
		String str = "";

		String[] compare = ((String[])map.get("compare[]"));
		
		if(compare != null) {
			for(int i = 0; i < compare.length; i++) {
				str += "id='";
				str += compare[i];
				str += "'";
				if(i != compare.length -1) {
					str += " or ";
				}
			}
		}
		
		
		try {
			ArrayList<ExtraDTO> ar = extraDAO.compareList(str);
			
			request.setAttribute("compare", ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchCompareResult.jsp");
		
		return actionForward;
	}

}
