package com.weddingform.member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
    public SMTPAuthenticator() {
        super();
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "qkrwogk110@gmail.com";
        String password = "doslzhf142";
        return new PasswordAuthentication(username, password);
    }
    
}