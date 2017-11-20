package com.weddingform.eung.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.common.CommonDTO;

public class ReservationMemberViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		HttpSession session = request.getSession();
		CommonDTO commonDTO = (CommonDTO)session.getAttribute("common");
		
		/////////////////////테스트/////////////////////
		if(commonDTO == null) {
			commonDTO = new CommonDTO();
			commonDTO.setId("MEMBER_ID 01");
		}
		System.out.println(commonDTO.getId());
		///////////////////////////////////////////
		
		
		ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
		try {
			ReservMemberDTO reservMemberDTO = reservMemberDAO.selectOne(commonDTO.getId());
			request.setAttribute("view", reservMemberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/reservation/reservationMemberView.jsp");
		
		return actionForward;
	}

}
