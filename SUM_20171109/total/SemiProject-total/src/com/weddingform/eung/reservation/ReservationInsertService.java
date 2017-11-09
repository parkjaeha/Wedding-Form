package com.weddingform.eung.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.search.ExtraDAO;
import com.weddingform.eung.search.ExtraDTO;

public class ReservationInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReservationDAO reservationDAO = new ReservationDAO();
		ReservationDTO reservationDTO = this.reservationGet(request);
		
		try {
			int result = reservationDAO.insert(reservationDTO);
			
			if(result > 0) {
				ExtraDTO extraDTO = new ExtraDTO();
				extraDTO.setId(reservationDTO.getCompany_id());
				extraDTO = new ExtraDAO().searchOne(extraDTO);
				
				request.setAttribute("view", extraDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/search/searchView.jsp");
		
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
		
		/*System.out.println(reservationDTO.getCompany_id());
		System.out.println(reservationDTO.getContents());
		System.out.println(reservationDTO.getHall_name());
		System.out.println(reservationDTO.getId());
		System.out.println(reservationDTO.getName());
		System.out.println(reservationDTO.getReserv_date());*/
		
		return reservationDTO;
	}
}
