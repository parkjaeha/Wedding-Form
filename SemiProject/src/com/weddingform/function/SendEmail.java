package com.weddingform.function;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.weddingform.member.SMTPAuthenticator;

public class SendEmail {

	
	public void sendEmail(String from, String to, String cc, String subject, String content)
			  throws Exception {
			  
			  // Properties
			  Properties props = new Properties();
			  
			  // G-Mail SMTP
			  props.put("mail.transport.protocol", "smtp");// �봽濡쒗넗肄� �꽕�젙
			  props.put("mail.smtp.host", "smtp.gmail.com");// gmail SMTP �꽌鍮꾩뒪 二쇱냼(�샇�뒪�듃)
			  props.put("mail.smtp.port", "465");// gmail SMTP �꽌鍮꾩뒪 �룷�듃 �꽕�젙
			
			        props.put("mail.smtp.starttls.enable","true");
			 
			        props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			        // props.put("mail.smtp.user", from);
			        props.put("mail.smtp.auth", "true");// SMTP �씤利앹쓣 �꽕�젙
			       
			  Authenticator auth = new SMTPAuthenticator();
			  Session mailSession = Session.getDefaultInstance(props, auth);
			  
			  // create a message
			  Message msg = new MimeMessage(mailSession);
			  
			  // set the from and to address
			  msg.setFrom(new InternetAddress(from));//蹂대궡�뒗 �궗�엺 �꽕�젙
			  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));//諛쏅뒗 �궗�엺�꽕�젙
			  
			  if(!cc.trim().equals("")) {
			   msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(cc, false));
			  }
			  
			  // Setting the Subject and Content Type
			  msg.setSubject(subject); // �젣紐� �꽕�젙
			  msg.setText(content);  // �궡�슜 �꽕�젙
			  msg.setSentDate(new Date());// 蹂대궡�뒗 �궇吏� �꽕�젙
			  
			  Transport.send(msg);  // 硫붿씪 蹂대궡湲�
			 }

	
}
