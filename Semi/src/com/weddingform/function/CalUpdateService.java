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
			
			CalendarDAO calendarDAO  = new CalendarDAO();
			CalendarDTO calendarDTO = new CalendarDTO();
			int id= 0; 
			int result=0;
			
			try {
				id = Integer.parseInt(request.getParameter("id"));			
			System.out.println("id: "+id);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			calendarDTO.setId(id);
			calendarDTO.setTitle(request.getParameter("title"));
			calendarDTO.setClassName(request.getParameter("className"));
			calendarDTO.setContents(request.getParameter("contents"));
			calendarDTO.setDate_start(request.getParameter("date_start"));
			calendarDTO.setDate_end(request.getParameter("date_end"));
			calendarDTO.setUrl(request.getParameter("url"));
			calendarDTO.setEditable(request.getParameter("editable"));
			
			 try {
				result = calendarDAO.update(calendarDTO);
				System.out.println("result: "+result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			boolean message =false;
			 if(result>0) {
				 message=true;
			 }
			
			System.out.println("GET");
			request.setAttribute("result", message);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");

		}else {
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_open.jsp");
		}

		return actionForward;
	}

}
