package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalAddEventService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_add_event");

		String method = request.getMethod();

		if(method.equals("GET")) {
			
			String id = request.getParameter("id");
			String data = request.getParameter("data");
			
			CalendarDTO calendarDTO = new CalendarDTO();
			CalendarDAO calendarDAO  = new CalendarDAO();
			
			//calendarDTO.setId(id);
			calendarDTO.setData(data);
			int result=0;
			String message = "fail";
			try {
				result = calendarDAO.insert(calendarDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 if(result>0) {
				 message = "success";
			 }
			 
			
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_open.jsp");

		}else {
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_open.jsp");
		}

		return actionForward;
		
	
	}
}
