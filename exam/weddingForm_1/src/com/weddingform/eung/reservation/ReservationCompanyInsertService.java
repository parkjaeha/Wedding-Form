package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReservationCompanyInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReservCompanyDTO reservCompanyDTO = this.getReservCompany(request);
		
		ReservCompanyDAO reservCompanyDAO = new ReservCompanyDAO();
		try {
			int result = reservCompanyDAO.insert(reservCompanyDTO);
			
			if(result > 0) {
				ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
				ArrayList<ReservMemberDTO> ar = reservMemberDAO.selectList(reservCompanyDTO.getId());
				
				request.setAttribute("reservMember", ar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/reservation/reservationCompanyView.jsp");
		
		return actionForward;
	}
	
	private ReservCompanyDTO getReservCompany(HttpServletRequest request) {
		ReservCompanyDTO reservCompanyDTO = new ReservCompanyDTO();
		
		String id = request.getParameter("id");
		String company_id = request.getParameter("company_id");
		String reserv_date = request.getParameter("reserv_date");
		String reserv_time = request.getParameter("reserv_time");
		String female = request.getParameter("female");
		String male = request.getParameter("male");
		
		reservCompanyDTO.setId(company_id);
		reservCompanyDTO.setMember_id(id);
		reservCompanyDTO.setReserv_date(reserv_date+ " " + reserv_time);
		reservCompanyDTO.setTitle(female + " ♥ " + male);
		
		return null;
	}

}
