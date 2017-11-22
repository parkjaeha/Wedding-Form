package com.weddingform.common;

import java.util.Random;


import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.choa.sms.SendSMS;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.function.SendEmail;

public class CommonIdService implements Action {

	int random = 0;
	
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();
		String result1 = "";
		CommonDAO commonDAO = new CommonDAO();
		CommonDTO commonDTO = null;
		
		if(method.equals("GET")) {
			
				System.out.println("GET");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonId.jsp");	
				
			
		}else {
	
			String type = request.getParameter("type");
			
			if(type.equals("email")) {
			
			System.out.println("POST");
			boolean check = false;
		
			
			String email = request.getParameter("email");
			//CommonDAO commonDAO = new CommonDAO();
			
			try {
				check =commonDAO.emailCheck(email);
			System.out.println("check result : "+ check);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("check: " + check);
			if(check == true) {
				
				String from = "qkrwogk110@gmail.com"; 
				String to= "";
				String cc = "cc@daum.net"; 
				String subject = "WeddingForm";
				String content = "auth number : ";
				String result ="fail";
				
				random =  generateNumber(6);
				content = content + Integer.toString(random);	
				
				try {
					
					to= email;
					System.out.println("data:" + to + subject + content);

					if(from.trim().equals("")) {
				//		System.out.println("蹂대궡�뒗 �궗�엺�쓣 �엯�젰�븯吏� �븡�븯�뒿�땲�떎.");
					}
					else if(to.trim().equals("")) {
				//		System.out.println("諛쏅뒗 �궗�엺�쓣 �엯�젰�븯吏� �븡�븯�뒿�땲�떎.");
					}else {

						 try {
							   // 硫붿씪蹂대궡湲�
							   SendEmail sendEmail = new SendEmail();
							   sendEmail.sendEmail(from, to, cc, subject, content);
							   System.out.println("email send success");
							   result ="success";
							  }
							  catch(MessagingException me) {
							 //  System.out.println("硫붿씪 �쟾�넚�뿉 �떎�뙣�븯���뒿�땲�떎.");
							   System.out.println("�떎�뙣 �씠�쑀 : " + me.getMessage());
							  }
							  catch(Exception e) {
							   //System.out.println("硫붿씪 �쟾�넚�뿉 �떎�뙣�븯���뒿�땲�떎.");
							   System.out.println("�떎�뙣 �씠�쑀 : " + e.getMessage());
							  }
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			/*	try {
					Thread.sleep(3000);
				}catch (Exception e) {
					System.out.println(e.getMessage());
					// TODO: handle exception
				}
				*/
				
				
				if(result.equals("success")){
					request.setAttribute("result", check);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("success");
				}
				
				
			}else {
				request.setAttribute("result", check);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
				System.out.println("fail");
				}
			
			}else if(type.equals("auth")) {
				String auth = request.getParameter("auth");
				if(auth.equals(Integer.toString(random))) {
				
					request.setAttribute("result", true);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("success");
					
				}else {
			
					request.setAttribute("result", false);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("fail");
				}
				
			}else if(type.equals("pauth")) {
				String auth = request.getParameter("phone_auth");
				if(auth.equals(Integer.toString(random))) {
					
					request.setAttribute("result", true);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("success");
					
				}else {
	
					request.setAttribute("result", false);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("fail");
				}
				
			}else if(type.equals("sms")) {
				
				SendSMS sendSMS  = new SendSMS();
				random =generateNumber(4);
				String phone = "";	
				boolean result = false ;
				try {
				phone = request.getParameter("phone");
				}catch (Exception e) {
					// TODO: handle exception
				}
				System.out.println("phone number: "  + phone);
				System.out.println("random: " + random);
				if(isStringDouble(phone)) {
					result = true;
					//sendSMS.Send(random,phone);
				}	
			
				request.setAttribute("result", result);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
				
			}else if(type.equals("auth_phone")) {
				
				
				String phone = request.getParameter("phone");
				try {
					commonDTO =	commonDAO.selectCheck(phone,"phone");
					result1 =commonDTO.getId();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				result1 = commonDTO.getId();
				System.out.println("result id : " + result1);
				//result1 = result1.substring(0, result1.length()-3)+"xxx";
				request.setAttribute("result", result1);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonauth_result.jsp");	
				
			}else if(type.equals("auth_email")) {
				String email = request.getParameter("email");
				try {
					commonDTO = commonDAO.selectCheck(email,"email");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				result1 = commonDTO.getId();
				//result1 = result1.substring(0, result1.length()-3)+"xxx";
				request.setAttribute("result", result1);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonauth_result.jsp");	
				
			}
			
		}
		return actionFoward;
	}

	
	//占쎌읈占쎌넅甕곕뜇�깈 占쎈떭占쎌쁽 占쎌넇占쎌뵥
	 public static boolean isStringDouble(String s) {
		 System.out.println("string double: " +s);
		    try {
		        Double.parseDouble(s);
		        return true;
		    } catch (NumberFormatException e) {
		        return false;
		    }
		  }

	
	//占쎄텆占쎈땾 占쎄문占쎄쉐 占쎈맙占쎈땾 
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
