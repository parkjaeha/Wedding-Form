package com.weddingform.eung.search;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.WeddingSearch;

public class SearchTableService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		HashMap<String, Object> map = new HashMap<>();
		ExtraDAO extraDAO = new ExtraDAO();
		
		Enumeration<String> em = request.getParameterNames();
		while(em.hasMoreElements()) {
			String name = em.nextElement();
			String[] values = request.getParameterValues(name);
			map.put(name, values);
		}
		
		WeddingSearch weddingSearch = this.searchParse(map);
		String sort = ((String[])map.get("sort"))[0];
		
		try {
			PageMaker pageMaker = new PageMaker(1, 6, extraDAO.getTotal(weddingSearch));
			ArrayList<ExtraDTO> ar = extraDAO.searchList(weddingSearch, pageMaker.getMakeRow(), sort);

			request.setAttribute("list", ar);
			request.setAttribute("search", weddingSearch);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchTable.jsp");
		
		return actionForward;
	}
	
	private WeddingSearch searchParse(HashMap<String, Object> map) {
		WeddingSearch weddingSearch = new WeddingSearch();
		String temp="";
		
		if(map.get("type[]") == null || ((String[])map.get("type[]"))[0].equals("All")) {
			weddingSearch.setType("|");
			
		} else {
			if( ((String[])map.get("type[]")).length > 1 ) {
				temp="";
				for(int i = 0; i < ((String[])map.get("type[]")).length; i++) {
					temp += (((String[])map.get("type[]"))[i]).toUpperCase();
					if( i != ((String[])map.get("type[]")).length - 1) {
						temp += "|";
					}
				}
				weddingSearch.setType(temp);
				
				
			} else {
				weddingSearch.setType((((String[])map.get("type[]"))[0]).toUpperCase());
			}
		}
		// END Type
		
		if(map.get("meal_menu[]") == null || ((String[])map.get("meal_menu[]"))[0].equals("All") ) {
			weddingSearch.setMeal_menu("|");
			
		} else {
			if( ((String[])map.get("meal_menu[]")).length > 1 ) {
				temp="";
				for(int i = 0; i < ((String[])map.get("meal_menu[]")).length; i++) {
					temp += (((String[])map.get("meal_menu[]"))[i]).toUpperCase();
					if( i != ((String[])map.get("meal_menu[]")).length - 1) {
						temp += "|";
					}
				}
				weddingSearch.setMeal_menu(temp);
				
				
			} else {
				weddingSearch.setMeal_menu(((String[])map.get("meal_menu[]"))[0].toUpperCase());
			}
		}
		//End meal_menu
		
		
		if(map.get("meal_cost[]") == null || ((String[])map.get("meal_cost[]"))[0].equals("All") ) {
			weddingSearch.setMeal_cost("|");
			
		} else {
			if( ((String[])map.get("meal_cost[]")).length > 1 ) {
				temp="";
				for(int i = 0; i < ((String[])map.get("meal_cost[]")).length; i++) {
					temp += ((String[])map.get("meal_cost[]"))[i].toUpperCase();
					if( i != ((String[])map.get("meal_cost[]")).length - 1) {
						temp += "|";
					}
				}
				weddingSearch.setMeal_cost(temp);
				
				
			} else {
				weddingSearch.setMeal_cost(((String[])map.get("meal_cost[]"))[0].toUpperCase());
			}
		}
		// End meal_cost
		
		
		if(map.get("visitor[]") == null || ((String[])map.get("visitor[]"))[0].equals("All") ) {
			weddingSearch.setVisitor("|");
			
		} else {
			if( ((String[])map.get("visitor[]")).length > 1 ) {
				temp="";
				for(int i = 0; i < ((String[])map.get("visitor[]")).length; i++) {
					temp += ((String[])map.get("visitor[]"))[i].toUpperCase();
					if( i != ((String[])map.get("visitor[]")).length - 1) {
						temp += "|";
					}
				}
				weddingSearch.setVisitor(temp);
				
				
			} else {
				weddingSearch.setVisitor(((String[])map.get("visitor[]"))[0].toUpperCase());
			}
		}
		//End visitor
		
		if(((String[])map.get("region"))[0].trim().equals("")) {
			weddingSearch.setRegion("|");
		} else {
			weddingSearch.setRegion(((String[])map.get("region"))[0].trim().toUpperCase());
		} // End region
		
		
		if(((String[])map.get("subway"))[0].trim().equals("")) {
			weddingSearch.setSubway("|");
		} else {
			weddingSearch.setSubway(((String[])map.get("subway"))[0].trim().toUpperCase());
		} // End subway
		
		System.out.println(((String[])map.get("subway"))[0]);
		System.out.println(weddingSearch.getSubway());
		
		if(((String[])map.get("hall_name"))[0].equals("")) {
			weddingSearch.setHall_name("|");
		} else {
			weddingSearch.setHall_name(((String[])map.get("hall_name"))[0].toUpperCase());
		} // End hall_name
		
		return weddingSearch;
	}
	
}
