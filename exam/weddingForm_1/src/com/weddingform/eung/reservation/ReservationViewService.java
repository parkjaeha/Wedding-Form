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
		
		if(request.getMethod().equals("POST")) {
			
			String id = request.getParameter("id");
			
			////////////////////테스트//////////////////////////////
			if(id == null) {
				id = "ID 01";
			}
			//////////////////////////////////////////////////////
			
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
			String id = request.getParameter("id");
			
			request.setAttribute("id", id);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/reservation/reservationView.jsp");
		}

		
		return actionForward;
	}

}
