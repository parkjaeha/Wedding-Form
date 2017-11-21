package com.weddingform.function;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CalendarGetDataService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward  = new ActionForward();

		System.out.println("Calendar_Getdata");
		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			actionForward.setCheck(true);
			
			CalendarDAO calendarDAO = new CalendarDAO();
			List<CalendarDTO> ar = null;
			try {
				ar = calendarDAO.selectALL("%2017%");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			String js = "[";
			for(int i=0;i<ar.size();i++) {
				String str = "{\"id\":\""+ar.get(i).getId()+"\",";
				str=str+"\"title\":\""+ar.get(i).getTitle()+"\",";
				str=str+"\"start\":\""+ar.get(i).getDate_start()+"\",";
				str=str+"\"end\":\""+ar.get(i).getDate_end()+"\",";
				str=str+"\"url\":\""+ar.get(i).getUrl()+"\",";
				str=str+"\"className\":\""+ar.get(i).getClassName()+"\",";
				str=str+"\"editable\":\""+ar.get(i).getEditable()+"\"}";
				
				if(i==ar.size()-1) {
					js=js+str+"]";
				}else {
					js=js+str+",";
				}
			}
			
			
			
			System.out.println("DTO: " +js);
			request.setAttribute("dto",js);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_get.jsp");

		}else {
			
			
			System.out.println("POST");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/function/calendar_result.jsp");
			//../WEB-INF/view/function/calendar_result.jsp
		}

		return actionForward;
	
	}

}
