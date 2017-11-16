package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.common.CommonDTO;
import com.weddingform.util.PageMaker;

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
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) { }
		
		ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
		try {
			PageMaker pageMaker = new PageMaker(curPage, 6, reservMemberDAO.getTotal());
			ArrayList<ReservMemberDTO> ar = reservMemberDAO.selectList(commonDTO.getId(), pageMaker.getMakeRow());
			
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

}
