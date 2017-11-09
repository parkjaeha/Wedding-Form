package com.weddingform.common;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.choa.sms.SendSMS;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class CommonAuthService implements Action {
	public int random = 0;
	

	@SuppressWarnings({ "unlikely-arg-type" })
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();
		
		System.out.println("Auth");
		
		if(method.equals("GET")) {
		
			SendSMS sendSMS  = new SendSMS();
			random =generateNumber(4);
			String phone = "";	
			boolean result = false ;
			try {
			phone = request.getParameter("phone");
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			// 전화번호 형식이 맞는지    -- 문자가 들어가지 않은 숫자만으로된 형식이어야 함 
			if(isStringDouble(phone)) {
				result = true;
				//sendSMS.Send(random,phone);
			}
			
			
			request.setAttribute("result", result);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
			

		}else {
			boolean result = false;
			int auth =0;
		
			try {
			auth = Integer.parseInt(request.getParameter("auth"));
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			System.out.println("auth:" + auth);
			
			if(auth == random) {
				result=true;
			}

			request.setAttribute("result", result);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonAuth.jsp");

		}
		
		System.out.println("random: " +random);
		
		return actionFoward;
	}

	//전화번호 숫자 확인
	 public static boolean isStringDouble(String s) {
		    try {
		        Double.parseDouble(s);
		        return true;
		    } catch (NumberFormatException e) {
		        return false;
		    }
		  }

	
	//난수 생성 함수 
	public static int generateNumber(int length) {
		 
	    String numStr = "1";
	    String plusNumStr = "1";
	 
	    for (int i = 0; i < length; i++) {
	        numStr += "0";
	 
	        if (i != length - 1) {
	            plusNumStr += "0";
	        }
	    }
	 
	    Random random = new Random();
	    int result = random.nextInt(Integer.parseInt(numStr)) + Integer.parseInt(plusNumStr);
	 
	    if (result > Integer.parseInt(numStr)) {
	        result = result - Integer.parseInt(plusNumStr);
	    }
	 
	    return result;
	}

	
}
