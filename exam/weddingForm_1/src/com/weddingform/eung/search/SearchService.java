package com.weddingform.eung.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.WeddingSearch;

public class SearchService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ArrayList<ExtraDTO> ar = new ArrayList<>();
		WeddingSearch weddingSearch = this.getSearch(request);
		ExtraDAO extraDAO = new ExtraDAO();

		int curPage;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			curPage = 1;
		}
		
		String sort = request.getParameter("sort");
		if(sort == null) {
			sort = "hall_name asc";
		}
		
		int perNumber =  6;
		try {
			perNumber = Integer.parseInt(request.getParameter("perNumber"));
		} catch (Exception e) {	}
		
		try {
			PageMaker pageMaker = new PageMaker(curPage, perNumber, extraDAO.getTotal(weddingSearch));
			ar = extraDAO.searchList(weddingSearch, pageMaker.getMakeRow(), sort);
			
			request.setAttribute("total", (extraDAO.getTotal(weddingSearch)/6)+1);
			request.setAttribute("curPage", curPage);
			request.setAttribute("list", ar);
			request.setAttribute("search", weddingSearch);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchMain.jsp");
		
		return actionForward;
	}
	
	private WeddingSearch getSearch(HttpServletRequest request) {
		WeddingSearch ws = new WeddingSearch();
		
		ws.setRegion(request.getParameter("region01 " + "region02"));
		ws.setSubway(request.getParameter("subway01 " + "subway02"));
		ws.setType(request.getParameter("type"));
		ws.setMeal_menu(request.getParameter("meal_menu"));
		ws.setHall_name(request.getParameter("hall_name"));
		ws.setMeal_cost(request.getParameter("meal_cost"));
		ws.setVisitor(request.getParameter("visitor"));
		
		return ws;
	}
	
}
