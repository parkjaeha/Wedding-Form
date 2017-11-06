package com.weddingform.eung.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.common.CommonDAO;
import com.weddingform.eung.common.CommonDTO;

public class SearchTotalMapService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		CommonDAO commonDAO = new CommonDAO();
		try {
			ArrayList<CommonDTO> ar =  commonDAO.selectList();
			
			request.setAttribute("list", ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchTotalMap.jsp");
		
		return actionForward;
	}

}
