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
		PageMaker pageMaker = new PageMaker(1, 6, 20);
		try {
			ar = extraDAO.searchList(weddingSearch, pageMaker.getMakeRow());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", ar);
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
		
		/*System.out.println("hall_name: "+ws.getHall_name());
		System.out.println("meal_cost: "+ws.getMeal_cost());
		System.out.println("meal_menu: " +ws.getMeal_menu());
		System.out.println("region: " +ws.getRegion());
		System.out.println("subway: " +ws.getSubway());
		System.out.println("type :" +ws.getType());
		System.out.println("visitor: "+ws.getVisitor());*/
		
		return ws;
	}
	
}
