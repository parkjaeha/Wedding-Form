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
			
			String data =  request.getParameter("data");
			String[] context =null;
			String year ="",month= "",day="";
			
			System.out.println("data: "+data);
			if(data !=null || data.contains("/")) {
			
			context = data.split("/");
			year = context[0].substring(0,4);
			month = context[0].substring(4,6);
			if(context[0].length() == 8) {
			day = context[0].substring(6,8);
			}else {
			day = context[0].substring(6);
			}
			
			System.out.println(year+"년"+month+"월"+day+"일");
			
			System.out.println(context[0]+"  "+context[1]);
			
			}
			request.setAttribute("num", context[0]);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("day", day);
			request.setAttribute("data", context[1]);
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
