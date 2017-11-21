package com.weddingform.report;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;

public class ReportListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		/*
		*	필터 혹은 관리자를 구분하여 블랙리스트 페이지를 관리한다. (필터 사용 권장!)
		*	HttpSession session = request.getSession();
		*	CommonDTO commonDTO = (CommonDTO)session.getAttribute("common");
		*/
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {	}
		
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {	}
		
		String black = request.getParameter("black");
		
		
		ReportDAO reportDAO = new ReportDAO();
		try {
			PageMaker pageMaker = new PageMaker(curPage, reportDAO.getTotal());
			ArrayList<ReportDTO> ar = reportDAO.selectList(pageMaker.getMakeRow());
			
			request.setAttribute("num", num);
			request.setAttribute("black", black);
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/report/reportList.jsp");
		
		return actionForward;
	}

}
