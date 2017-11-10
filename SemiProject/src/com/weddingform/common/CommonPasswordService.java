package com.weddingform.common;

import java.sql.Connection;

import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.choa.sms.SendSMS;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.function.SendEmail;
import com.weddingform.util.DBConnector;
import com.weddingform.common.*;

public class CommonPasswordService implements Action {

	int random = 0;
	
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		System.out.println("password");
		
		if(method.equals("GET")) {
			System.out.println("GET");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonPassword.jsp");

		}else {

			String type = request.getParameter("type");
			
			if(type.equals("email")) {
			
			System.out.println("POST");
			boolean check = false;
			
			String email = request.getParameter("email");
			CommonDAO commonDAO = new CommonDAO();
			
			try {
				check =commonDAO.emailCheck(email);
			System.out.println("email 등록 확인 : "+ check);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("check: " + check);
			if(check == true) {
				
				String from = "qkrwogk110@gmail.com"; 
				String to= "";
				String cc = "cc@daum.net"; 
				String subject = "WeddingForm 인증번호 발송";
				String content = "인증번호 : ";
				String result ="fail";
				
				random =  generateNumber(6);
				content = content + Integer.toString(random);	
				
				try {
					
					to= request.getParameter("email");
					System.out.println("data:" + to + subject + content);

					if(from.trim().equals("")) {
						System.out.println("보내는 사람을 입력하지 않았습니다.");
					}
					else if(to.trim().equals("")) {
						System.out.println("받는 사람을 입력하지 않았습니다.");
					}else {

						 try {
							   // 메일보내기
							   SendEmail sendEmail = new SendEmail();
							   sendEmail.sendEmail(from, to, cc, subject, content);
							   System.out.println("메일 전송에 성공하였습니다.");
							   result ="success";
							  }
							  catch(MessagingException me) {
							   System.out.println("메일 전송에 실패하였습니다.");
							   System.out.println("실패 이유 : " + me.getMessage());
							  }
							  catch(Exception e) {
							   System.out.println("메일 전송에 실패하였습니다.");
							   System.out.println("실패 이유 : " + e.getMessage());
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
				
				System.out.println("인증번호 발송");
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
					System.out.println("인증성공");
					request.setAttribute("result", true);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("success");
					
				}else {
					System.out.println("인증실패");
					request.setAttribute("result", false);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					System.out.println("fail");
				}
				
			}else if(type.equals("pass")) {
				
				String id = request.getParameter("id");
				String pw = request.getParameter("pass");
				boolean id_check = true;
				int pw_update = 0;
				CommonDAO commonDAO = new CommonDAO();
				CommonDTO commonDTO = new CommonDTO();
				
					try {
						id_check = commonDAO.idCheck(id);
						System.out.println("id check: "  +id_check +" == 존재하는 id");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
					if(id_check == false) {
				
						commonDTO.setId(id);
						commonDTO.setPw(pw);
						System.out.println("update");
						try {
							System.out.println("id: "+id+"pw: "+pw+" update 성공" + "pw_num: "+ pw_update);
							pw_update = commonDAO.update(commonDTO);
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							System.out.println("update fail");
						}
						
						if(pw_update > 0) {
							System.out.println("변경성공");
							request.setAttribute("result", true);
							actionFoward.setCheck(true);
							actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
							System.out.println("pw 변경 success");
						}else {
							System.out.println("변경실패");
							request.setAttribute("result", false);
							actionFoward.setCheck(true);
							actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
							System.out.println("pw 변경 fail");
							}
						
					
					}else {
					System.out.println("ID가 틀렸으");
					request.setAttribute("result", false);
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/commonAuthResponse.jsp");
					
					}
			}
			
		}
		return actionFoward;
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
