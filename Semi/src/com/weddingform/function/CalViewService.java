package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_View");
		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			String type = request.getParameter("type");
			
			if(type.equals("view")) {
			
			int id=  0;
			try {
			id =  Integer.parseInt(request.getParameter("id"));
			System.out.println("id:" + id);
			}catch (Exception e) { }
			
			CalendarDAO calendarDAO = new CalendarDAO();
			CalendarDTO calendarDTO = null;
			try {
				calendarDTO = calendarDAO.selectOne(id);
				System.out.println("dto:" + calendarDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("view: " +calendarDTO);
			request.setAttribute("addview",false);
			request.setAttribute("view",calendarDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../calendar_view.jsp");	
			
			}else if(type.equals("addview")){
				request.setAttribute("addview",true);
				actionForward.setCheck(true);
				actionForward.setPath("../calendar_view.jsp");	
			}
		
			
		}else {
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_result.jsp");
		}

		return actionForward;
	}

}
