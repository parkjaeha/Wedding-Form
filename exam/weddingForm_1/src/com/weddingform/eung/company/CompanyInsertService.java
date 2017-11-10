package com.weddingform.eung.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CompanyInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		if(request.getMethod().equals("POST")) {
			int result = this.doPost(request);
			
			if(result > 0) {
				
			}
		} else {
			// GET METHOD
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("./company_join.jsp");
		
		return actionForward;
	}
	
	private int doPost(HttpServletRequest request) {
		CompanyDAO companyDAO = new CompanyDAO();
		CompanyDTO companyDTO = new CompanyDTO();
		
		companyDTO.setCompany_addr(request.getParameter("company_addr"));
		companyDTO.setCompany_name(request.getParameter("company_name"));
		companyDTO.setCompany_number(request.getParameter("company_number"));
		companyDTO.setCompany_tel(request.getParameter("company_tel"));
		companyDTO.setId(request.getParameter("id"));
		companyDTO.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		companyDTO.setLongitude(Double.parseDouble(request.getParameter("longitude")));
		
		int result = 0;
		try {
			result = companyDAO.insert(companyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
