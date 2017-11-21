package com.weddingform.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReportDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {}
		
		try {
			int result =  new ReportDAO().delete(num);
			
			if(result > 0) {
				request.setAttribute("message", "성공적으로 삭제되었습니다.");
			} else {
				request.setAttribute("message", "삭제하는데 실패하였습니다.");
			}
			
			request.setAttribute("path", "../report/reportList.report");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionForward;
	}

}
