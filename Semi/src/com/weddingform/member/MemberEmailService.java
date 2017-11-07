package com.weddingform.member;


import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class MemberEmailService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		ActionForward actionForward  = new ActionForward();

		System.out.println("email");

		String method = request.getMethod();

		if(method.equals("GET")) {
			System.out.println("GET");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberEmail.jsp");

		}else {
			String from = "qkrwogk110@gmail.com"; 
			String to= "";
			String cc = "cc@daum.net"; 
			String subject = "";
			String content = "";
			String result ="fail";

			try {
				System.out.println("POST");
				to= request.getParameter("to");
				subject = request.getParameter("subject");
				content = request.getParameter("content");
				System.out.println("data:" + to + subject + content);

				if(from.trim().equals("")) {
					System.out.println("보내는 사람을 입력하지 않았습니다.");
				}
				else if(to.trim().equals("")) {
					System.out.println("받는 사람을 입력하지 않았습니다.");
				}else {

					 try {
						
						   // 메일보내기
						   sendEmail(from, to, cc, subject, content);
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

			request.setAttribute("result", result);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/member/memberEmail.jsp");

		}


		return actionForward;
	}

	public void sendEmail(String from, String to, String cc, String subject, String content)
			  throws Exception {
			  
			  // Properties 설정
			  // 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
			  Properties props = new Properties();
			  
			  // G-Mail SMTP 사용시
			  props.put("mail.transport.protocol", "smtp");// 프로토콜 설정
			  props.put("mail.smtp.host", "smtp.gmail.com");// gmail SMTP 서비스 주소(호스트)
			  props.put("mail.smtp.port", "465");// gmail SMTP 서비스 포트 설정
			  // 로그인 할때 Transport Layer Security(TLS)를 사용할 것인지 설정
			  // gmail 에선 tls가 필수가 아니므로 해도 그만 안해도 그만
			        props.put("mail.smtp.starttls.enable","true");
			        // gmail 인증용 Secure Socket Layer(SSL) 설정
			        // gmail 에서 인증때 사용해주므로 요건 안해주면 안됨
			        props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			        // props.put("mail.smtp.user", from);
			        props.put("mail.smtp.auth", "true");// SMTP 인증을 설정
			        /**
			         * SMTP 인증이 필요한 경우 반드시 Properties 에 SMTP 인증을 사용한다고 설정하여야 한다.
			         * 그렇지 않으면 인증을 시도조차 하지 않는다.
			         * 그리고 Authenticator 클래스를 상속받은 SMTPAuthenticator 클래스를 생성한다.
			         * getPasswordAuthentication() 메소드만 override 하면 된다.
			         * 머 사실 다른 메소드는 final 메소드여서 override 할 수 조차 없다. -ㅅ-;
			         */
			  Authenticator auth = new SMTPAuthenticator();
			  Session mailSession = Session.getDefaultInstance(props, auth);
			  
			  // create a message
			  Message msg = new MimeMessage(mailSession);
			  
			  // set the from and to address
			  msg.setFrom(new InternetAddress(from));//보내는 사람 설정
			  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));//받는 사람설정
			  
			  if(!cc.trim().equals("")) {
			   msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(cc, false));
			  }
			  
			  // Setting the Subject and Content Type
			  msg.setSubject(subject); // 제목 설정
			  msg.setText(content);  // 내용 설정
			  msg.setSentDate(new Date());// 보내는 날짜 설정
			  
			  Transport.send(msg);  // 메일 보내기
			 }



}
