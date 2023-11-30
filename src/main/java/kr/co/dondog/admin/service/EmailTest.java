package kr.co.dondog.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class EmailTest {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("path/to/your/spring-config.xml");

        EmailService emailService = (EmailService) context.getBean("emailService");

        // 테스트 이메일 전송
        String to = "soojin9412@naver.com";
        String subject = "테스트 메일";
        String text =  "돈독한 우리사이 돈독입니다.\n" +
                "고객님에게 5번의 신고가 들어와 돈독 서비스 이용이 중지되었습니다.\n" +
                "관련하여 문의사항이 있는 경우 해당 계정으로 문의 부탁드립니다.\n\n";

        emailService.sendMail(to, subject, text);
    }
}