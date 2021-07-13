package kimkwangsoo.hotel.user.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import kimkwangsoo.hotel.user.domain.User;

@Service
public class MailServiceImpl implements MailService{
	@Autowired private JavaMailSender mailSender;
	
	public void send(User user,String userEmail) {
		MimeMessage message = mailSender.createMimeMessage();
		
		String text= "<div style='background-color:#efefef; width:500px; padding: 20px;'>"
				+ "<div style='background-color:#fff; padding:20px 0'>"
				+ "<h3 style='text-align:center;font-weight:bold;'><span style='color:#f5bf25; font-size:48px;'></span><br><br> <span style='font-size:25px;color:#1bb1bb'>트래블하우스 입니다.</span></h3>"
				+ "<p style='text-align:center; margin-top:-5px;'>"+user.getUserName()+"님 의 비밀번호입니다.</p>"
				+ "<div style='margin: 50px 0px 30px 0px; text-align:center;'>"
				+ "<li style='list-style:none;'><p style='font-size:large; margin:0; font-weight:bold;'>비밀번호:"
				+ "<span style='color:#3589A2; font-weight:bold;'>" + user.getUserPwd() + "</span></p></li>" + "</div>";
		
	try {
		message.addRecipient(RecipientType.TO,new InternetAddress(userEmail));
		message.setSubject("트래블 하우스");
		message.setText(text,"UTF-8","HTML");
	}catch(Exception e) {}
	
	mailSender.send(message);
	}
}
