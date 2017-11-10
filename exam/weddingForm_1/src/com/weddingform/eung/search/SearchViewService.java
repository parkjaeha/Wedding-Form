package com.weddingform.eung.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.company.CompanyDAO;
import com.weddingform.eung.company.CompanyDTO;
import com.weddingform.eung.reservation.ReservationDAO;
import com.weddingform.eung.reservation.ReservationDTO;

public class SearchViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		if(request.getMethod().equals("GET")) { // GET
			ExtraDTO extraDTO = new ExtraDTO();
			extraDTO.setId(request.getParameter("id"));
			CompanyDTO companyDTO = new CompanyDTO();
			companyDTO.setId(request.getParameter("id"));
			
			ExtraDAO extraDAO = new ExtraDAO();
			CompanyDAO companyDAO = new CompanyDAO();
			try {
				extraDTO = extraDAO.searchOne(extraDTO);
				companyDTO = companyDAO.selectOne(companyDTO);

				if(extraDTO != null && companyDTO != null) {
					request.setAttribute("view", extraDTO);
					request.setAttribute("company", companyDTO);
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/search/searchView.jsp");
				} else {
					request.setAttribute("message", "잘못된 접근입니다.");
					request.setAttribute("path", "./searchMain.search");
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // POST
			ReservationDAO reservationDAO = new ReservationDAO();
			ReservationDTO reservationDTO = this.reservationGet(request);
			
			int result = 0;
			try {
				result = reservationDAO.insert(reservationDTO);
				
				if(result > 0) {
					ExtraDTO extraDTO = new ExtraDTO();
					extraDTO.setId(reservationDTO.getCompany_id());
					extraDTO = new ExtraDAO().searchOne(extraDTO);
					
					request.setAttribute("view", extraDTO);
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/search/searchView.jsp");
				} else {
					request.setAttribute("message", "서비스 이용에 불편을 끼쳐드려서 죄송합니다.");
					request.setAttribute("path", "./searchMain.search");
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		return actionForward;
	}
	
	private ReservationDTO reservationGet(HttpServletRequest request) {
		ReservationDTO reservationDTO = new ReservationDTO();
		
		reservationDTO.setCompany_id(request.getParameter("company_id"));
		reservationDTO.setContents(request.getParameter("contents"));
		reservationDTO.setHall_name(request.getParameter("hall_name"));
		reservationDTO.setId(request.getParameter("id"));
		reservationDTO.setName(request.getParameter("name"));
		reservationDTO.setReserv_date(request.getParameter("reserv_date"));
		
		return reservationDTO;
	}
}
