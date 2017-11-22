package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_update");

		String method = request.getMethod();

		if(method.equals("GET")) {
			CalendarDTO calendarDTO  = new CalendarDTO();
			CalendarDAO calendarDAO  = new CalendarDAO();
			int num= 0; 
			String id = "";
			int result=0;
			try {
				num = Integer.parseInt(request.getParameter("num"));				
			System.out.println("num: "+num);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			id = request.getParameter("id");
			String data = request.getParameter("data");
			
		/*	String[] context  = update.split("/");
			System.out.println("context: "+context);
			int num = Integer.parseInt(context[0]);
			String data = context[1];
			System.out.println(id+"/" +" /" +num + " /"+data);
			*/
			calendarDTO.setId(id);
			calendarDTO.setNum(num);
			calendarDTO.setData(data);
			
			try {
				result =calendarDAO.update(calendarDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0) {
				System.out.println("update success");
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
