package com.weddingform.eung.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReservationViewService implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		///////////////////테스트/////////////////////
		String id = "ID 01";
		///////////////////테스트/////////////////////
		
		try {
			id = request.getParameter("id");
		} catch (Exception e) {}
		
		
		if(request.getMethod().equals("POST")) {
			ReservCompanyDAO reservCompanyDAO = new ReservCompanyDAO();
			try {
				ArrayList<ReservCompanyDTO> ar = reservCompanyDAO.selectOne(id);
				
				if(ar.size() > 0) {
					// [{},{}]
					JSONArray jar = new JSONArray();				// []
					for (ReservCompanyDTO reservCompanyDTO : ar) {
						JSONObject obj = new JSONObject(); 			// {}
						obj.put("start", reservCompanyDTO.getReserv_date());
						obj.put("title", reservCompanyDTO.getTitle());
						jar.add(obj);
					}
					request.setAttribute("array", jar);

					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/reservation/reservationCompany.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // GET
			request.setAttribute("id", id);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/reservation/reservationView.jsp");
		}

		
		return actionForward;
	}

}
