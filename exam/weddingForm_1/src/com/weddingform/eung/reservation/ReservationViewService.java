package com.weddingform.eung.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReservationViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/reservation/reservationView.jsp");
		
		return actionForward;
	}

}
