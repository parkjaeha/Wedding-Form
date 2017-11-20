package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;

public class ReservationCompanyInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ReservCompanyDTO reservCompanyDTO = this.getReservCompany(request);
		ReservCompanyDAO reservCompanyDAO = new ReservCompanyDAO();
		ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) { }
		
		int result = 0;
		try {
			boolean check = reservCompanyDAO.dateCheck(reservCompanyDTO);
			
			if(check) {
				result = reservCompanyDAO.insert(reservCompanyDTO);
				if(result > 0) {
					result = reservMemberDAO.confirmUpdate(reservCompanyDTO.getMember_id(), reservCompanyDTO.getId(), "true");
				}
			} else {
				request.setAttribute("message", "중복된 날짜입니다.");
				
			}
			PageMaker pageMaker = new PageMaker(curPage, 6, reservMemberDAO.getTotal());
			ArrayList<ReservMemberDTO> ar = reservMemberDAO.selectList(reservCompanyDTO.getId(), pageMaker.getMakeRow());
			
			request.setAttribute("curPage", curPage);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("reservMember", ar);
			
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
		reservCompanyDTO.setTitle(female + "♥" + male);
		
		return reservCompanyDTO;
	}

}
