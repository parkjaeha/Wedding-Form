package com.weddingform.eung.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.extra.ExtraDAO;
import com.weddingform.eung.extra.ExtraDTO;
import com.weddingform.util.MakeRow;
import com.weddingform.util.WeddingSearch;

public class SearchCompareService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		WeddingSearch weddingSearch = this.getWeddingSearch();
		ExtraDAO extraDAO = new ExtraDAO();
		
		String sort = request.getParameter("sort");
		if(sort == null) {
			sort = "hall_name asc";
		}
		
		MakeRow makeRow = new MakeRow();
		try {
			makeRow.setStartRow(1);
			makeRow.setLastRow(extraDAO.getTotal(weddingSearch));
			ArrayList<ExtraDTO> ar = extraDAO.searchList(weddingSearch, makeRow, sort);
			
			request.setAttribute("list", ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchCompare.jsp");
		
		return actionForward;
	}
	
	private WeddingSearch getWeddingSearch() {
		WeddingSearch weddingSearch = new WeddingSearch();
		
		weddingSearch.setHall_name("|");
		weddingSearch.setMeal_cost("|");
		weddingSearch.setMeal_menu("|");
		weddingSearch.setRegion("|");
		weddingSearch.setSubway("|");
		weddingSearch.setType("|");
		weddingSearch.setVisitor("|");
		
		return weddingSearch;
	}

}
