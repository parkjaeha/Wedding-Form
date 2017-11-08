package com.weddingform.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReportWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		ReportDAO reportDAO=new ReportDAO();
		ReportDTO reportDTO=new ReportDTO();
		
		
		if(method.equals("POST")) {
	    reportDTO.setId(request.getParameter("id"));
		reportDTO.setTitle(request.getParameter("title"));
		reportDTO.setPw(request.getParameter("password"));
		reportDTO.setContents(request.getParameter("contents"));
		reportDTO.setCompany_name(request.getParameter("company_name"));
		
		try {
			int result=reportDAO.insert(reportDTO);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		request.setAttribute("message", "신고가 완료되었습니다.");
		request.setAttribute("path", "../index.jsp");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		
		}else {
			
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/reportWrite.jsp");
		}
		
		
		return actionForward;
	}

}