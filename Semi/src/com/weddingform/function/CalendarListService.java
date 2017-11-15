package com.weddingform.function;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;


public class CalendarListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_List");
		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			String date  = "%";
			date = date  + request.getParameter("date") +"%";
			
			CalendarDAO calendarDAO = new CalendarDAO();
			List<CalendarDTO> ar = null;
			try {
				ar = calendarDAO.selectALL(date);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
			System.out.println("list: " +ar);
			request.setAttribute("list",ar);
			
			actionForward.setCheck(true);
			actionForward.setPath("../calendar_list.jsp");

		}else {
			
			
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_result.jsp");
			//../WEB-INF/view/function/calendar_result.jsp
		}

		return actionForward;
	}

}
