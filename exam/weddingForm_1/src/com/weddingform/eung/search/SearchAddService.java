package com.weddingform.eung.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.WeddingSearch;

public class SearchAddService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int curPage;
		try {
			System.out.println(request.getParameter("curPage"));
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			curPage = 1;
		}
		
		WeddingSearch weddingSearch = this.getWeddingParameter(request);
		ExtraDAO extraDAO = new ExtraDAO();
		try {
			PageMaker pageMaker = new PageMaker(1, curPage*6, extraDAO.getTotal(weddingSearch));
			ArrayList<ExtraDTO> ar = extraDAO.searchList(weddingSearch, pageMaker.getMakeRow());
			
			request.setAttribute("list", ar);
			request.setAttribute("search", weddingSearch);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchTable.jsp");
		
		return actionForward;
	}
	
	private WeddingSearch getWeddingParameter(HttpServletRequest request) {
		WeddingSearch weddingSearch = new WeddingSearch();
		
		String type = request.getParameter("type");
		String region = request.getParameter("region");
		String subway = request.getParameter("subway");
		String meal_cost = request.getParameter("meal_cost");
		String meal_menu = request.getParameter("meal_menu");
		String visitor = request.getParameter("visitor");
		String hall_name = request.getParameter("hall_name");
		
		weddingSearch.setHall_name(hall_name);
		weddingSearch.setMeal_cost(meal_cost);
		weddingSearch.setMeal_menu(meal_menu);
		weddingSearch.setRegion(region);
		weddingSearch.setSubway(subway);
		weddingSearch.setType(type);
		weddingSearch.setVisitor(visitor);
				
		return weddingSearch;
	}

}
