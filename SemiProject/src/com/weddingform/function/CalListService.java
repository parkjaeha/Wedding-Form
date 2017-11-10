package com.weddingform.function;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_List");

		String method = request.getMethod();

		if(method.equals("GET")) {
			
			List<CalendarDTO> ar = null;
			
			CalendarDAO calendarDAO =  new CalendarDAO();
			
			String id = "2017111" ;
			try {
				id = request.getParameter("id");	
				System.out.println("id: " +id);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				ar = calendarDAO.selectList(id);
				System.out.println("ar: "+ar);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			System.out.println("GET");
			request.setAttribute("list", ar);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_list.jsp");

		}else {
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_list.jsp");
		}

		return actionForward;
	}

}
