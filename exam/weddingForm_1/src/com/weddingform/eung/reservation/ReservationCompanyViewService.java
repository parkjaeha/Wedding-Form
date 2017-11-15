package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.common.CommonDTO;

public class ReservationCompanyViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		HttpSession session = request.getSession();
		CommonDTO commonDTO = (CommonDTO)session.getAttribute("common");
		
		///////////////////////////테스트//////////////////////////////////
		if(commonDTO == null) {
			commonDTO = new CommonDTO();
			commonDTO.setId("ID 01");
		}
		/////////////////////////////////////////////////////////////////
		
		ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
		try {
			ArrayList<ReservMemberDTO> ar = reservMemberDAO.selectList(commonDTO.getId());
			
			request.setAttribute("reservMember", ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/reservation/reservationCompanyView.jsp");
		
		return actionForward;
	}

}
