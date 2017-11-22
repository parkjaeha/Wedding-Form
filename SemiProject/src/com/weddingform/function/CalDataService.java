package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalDataService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_data");
		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_result.jsp");

		}else {
			
			CalendarDTO calendarDTO = null;
			CalendarDAO calendarDAO =  new CalendarDAO();
			
			String id = "2017111";
			try {
				id = request.getParameter("id");	
				System.out.println("date: " +id);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				calendarDTO =  calendarDAO.selectOne(id);
			if(calendarDTO == null) {
				calendarDTO = new CalendarDTO();
				calendarDTO.setId(id);
				calendarDTO.setData("등록된 정보가 없습니다.");
			}
				System.out.println("data2: "+calendarDTO.getData());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("dto", calendarDTO);
			
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_result.jsp");
			//../WEB-INF/view/function/calendar_result.jsp
		}

		return actionForward;
	}

}
