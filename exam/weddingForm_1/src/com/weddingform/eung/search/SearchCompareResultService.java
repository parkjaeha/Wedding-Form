package com.weddingform.eung.search;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.extra.ExtraDAO;
import com.weddingform.eung.extra.ExtraDTO;

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
		
		String[] compare = ((String[])map.get("compare[]"));
		
		
		String str = "";
		
		try {
			for(int i = 0; i < compare.length; i++) {
				str += "id='";
				str += compare[i];
				str += "'";
				if(i != compare.length -1) {
					str += " or ";
				}
			}
		} catch (Exception e) { str = "1=2"; }
		
		try {
			ArrayList<ExtraDTO> ar = extraDAO.compareList(str);
			
			if(ar.size() > 0) {
				request.setAttribute("compare", ar);
			} else {
				request.setAttribute("compare", null);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchCompareResult.jsp");
		
		return actionForward;
	}

}
