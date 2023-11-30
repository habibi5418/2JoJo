package kr.co.dondog.admin.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("emailService")
public class EmailService {

    private final JavaMailSender mailSender;
    private final SimpleMailMessage preConfiguredMessage;

    public EmailService(JavaMailSender mailSender, SimpleMailMessage preConfiguredMessage) {
        this.mailSender = mailSender;
        this.preConfiguredMessage = preConfiguredMessage;
    }

    @Async
    public void sendMail(String to, String subject, String body) {
        SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(body);
        mailSender.send(mailMessage);
    }

    @Async
    public void sendPreConfiguredMail(String to, String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
        mailMessage.setTo(to);
        mailMessage.setText(message);
        mailSender.send(mailMessage);
    }
}