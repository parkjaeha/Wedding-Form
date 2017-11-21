package com.weddingform.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.company.CompanyDAO;
import com.weddingform.eung.company.CompanyDTO;

public class ReportViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String ids = request.getParameter("ids");
		
		String[] idArr = ids.split("/");
		String member_id = idArr[0];
		String company_name = idArr[1];
		
		ReportDAO reportDAO = new ReportDAO();
		ReportDTO reportDTO = new ReportDTO();
		reportDTO.setId(member_id);
		
		CompanyDAO companyDAO = new CompanyDAO();
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompany_name(company_name);
		
		try {
			reportDTO = reportDAO.selectOne(reportDTO);
			companyDTO = companyDAO.selectOne(companyDTO);
			
			//////////////////////jsp 확인///////////////////
			request.setAttribute("report", reportDTO);
			request.setAttribute("company", companyDTO);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/report/reportView.jsp");
		
		return actionForward;
	}

}
