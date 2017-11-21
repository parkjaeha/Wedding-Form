package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalAddService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_add");

		String method = request.getMethod();

		
		if(method.equals("GET")) {
			
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			int result = 0;
			
			CalendarDAO calendarDAO = new CalendarDAO();
			CalendarDTO calendarDTO = new CalendarDTO();
			
			calendarDTO.setTitle(title);
			calendarDTO.setContents(contents);
			calendarDTO.setDate_start(start);
			calendarDTO.setDate_end(end);
			calendarDTO.setClassName("Disponible");
			calendarDTO.setUrl("#");
			calendarDTO.setEditable("false");
			
			try {
				result = calendarDAO.insert(calendarDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			boolean check = false;
			if(result>0) {
				check = true;
			}
			
			request.setAttribute("result", check);
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");

		}else {
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar.jsp");
		}

		return actionForward;
		
	
	}

}
