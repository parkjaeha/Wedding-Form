package com.weddingform.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReportBlackUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReportDAO reportDAO = new ReportDAO();
		
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {	}
		
		String black = "F";
		try {
			black = request.getParameter("black");
		} catch (Exception e) {	}
		
		int result = 0;
		try {
			result = reportDAO.blackUpdate(num, black);
			
			if (result > 0) {
				if(black.equals("T")) {
					request.setAttribute("message", "해당 업체가 블랙리스트에 추가되었습니다.");
				} else {
					request.setAttribute("message", "해당 업체가 블랙리스트에 삭제되었습니다.");
				}
			} else {
				if(black.equals("T")) {
					request.setAttribute("message", "블랙리스트에 등록하는데 실패하였습니다.");
				} else {
					request.setAttribute("message", "블랙리스트에 삭제하는데 실패하였습니다.");
				}
			}
			request.setAttribute("path", "./reportList.report");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionForward;
	}

}
