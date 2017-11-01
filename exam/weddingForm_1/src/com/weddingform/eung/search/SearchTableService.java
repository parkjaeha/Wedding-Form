package com.weddingform.eung.search;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class SearchTableService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		HashMap<String, String[]> map = new HashMap<>();
		String[] values = null;
		String name = "";
		
		Enumeration<String> em = request.getParameterNames();
		while(em.hasMoreElements()) {
			name = em.nextElement();
			values = request.getParameterValues(name);
			System.out.println(values);
			map.put(name, values);
		}
		
		System.out.println("=====================================");
		System.out.println("type :" +map.get("type"));
		System.out.println("meal_cost :" +map.get("meal_cost"));
		System.out.println("meal_menu :" +map.get("meal_menu"));
		System.out.println("visitor :" +map.get("visitor"));
		System.out.println("region :" +map.get("region"));
		System.out.println("subway :" +map.get("subway"));
		System.out.println("hall_name :" +map.get("hall_name"));
		
		
		/*System.out.println("==============================================");
		System.out.println("region: " + request.getParameter("region"));
		System.out.println("subway: " + request.getParameter("subway"));
		System.out.println("type: " + type);
		System.out.println("meal_cost: " + request.getParameter("meal_cost"));
		System.out.println("meal_menu: " + request.getParameter("meal_menu"));
		System.out.println("visitor: " + request.getParameter("visitor"));
		System.out.println("hall_name: " + request.getParameter("hall_name"));*/
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchTable.jsp");
		
		return actionForward;
	}

}
