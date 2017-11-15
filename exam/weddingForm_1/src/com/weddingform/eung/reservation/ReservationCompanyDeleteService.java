package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReservationCompanyDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		String member_id = request.getParameter("id");
		String company_id = request.getParameter("company_id");
		
		ReservCompanyDAO reservCompanyDAO = new ReservCompanyDAO();
		try {
			int result = reservCompanyDAO.delete(member_id, company_id);
			
			if(result > 0) {
				ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
				result = reservMemberDAO.confirmUpdate(member_id, company_id, "false");
				
				if(result > 0) {
					ArrayList<ReservMemberDTO> ar = reservMemberDAO.selectList(company_id);
					request.setAttribute("reservMember", ar);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/reservation/reservationCompanyView.jsp");
		
		return actionForward;
	}

}
