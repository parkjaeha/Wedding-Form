package com.weddingform.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_delete");

		String method = request.getMethod();

		if(method.equals("GET")) {
			
			CalendarDAO calendarDAO  = new CalendarDAO();
			int num= 0; 
			int result=0;
			try {
				num = Integer.parseInt(request.getParameter("num"));				
			System.out.println("num: "+num);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			 try {
				result = calendarDAO.delete(num);
				System.out.println("result: "+result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String message ="fail";
			 if(result>0) {
				 message="success";
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
