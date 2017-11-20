package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;

public class ReservationCompanyDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) { }

		String member_id = request.getParameter("id");
		String company_id = request.getParameter("company_id");
		
		ReservCompanyDAO reservCompanyDAO = new ReservCompanyDAO();
		ReservMemberDAO reservMemberDAO = new ReservMemberDAO();
		try {
			int result = reservCompanyDAO.delete(member_id, company_id);
			
			if(result > 0) {
				result = reservMemberDAO.confirmUpdate(member_id, company_id, "false");
					
			} else {
				request.setAttribute("message", "예약취소하는데 실패하였습니다.");
			}
			
			PageMaker pageMaker = new PageMaker(curPage, 6, reservMemberDAO.getTotal());
			ArrayList<ReservMemberDTO> ar = reservMemberDAO.selectList(company_id, pageMaker.getMakeRow());
			
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
