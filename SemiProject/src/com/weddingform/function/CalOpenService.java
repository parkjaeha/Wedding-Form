package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalOpenService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_Open");

		String method = request.getMethod();

		
		if(method.equals("GET")) {
			
			String id = request.getParameter("id");
			String data =  request.getParameter("data");
			String year ="",month= "",day="";
			
			System.out.println("data: "+data+"id: "+id);
		
			
			year = id.substring(0,4);
			month = id.substring(4,6);
			if(id.length() == 8) {
			day = id.substring(6,8);
			}else {
			day = id.substring(6);
			}
			
			System.out.println(year+"년"+month+"월"+day+"일");
		
			request.setAttribute("id", id);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("day", day);
			request.setAttribute("data", data);
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
