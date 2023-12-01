package kr.co.dondog.admin.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dondog.admin.service.AdminService;
import kr.co.dondog.admin.service.MailService;
import kr.co.dondog.member.vo.MemberVO;

@Controller
@EnableAsync //�񵿱����
public class MailController {
    @Autowired
    private  AdminService adminservice;
    private  MailService mailService;


    @RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
    public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) 
                                                          throws Exception{
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        List<MemberVO> members = adminservice.sleepMember();
        for (MemberVO member : members) {
        mailService.sendMail("member.getEmail()","돈독서비스이용안내","안녕하세요  고객님");
        //mailService.sendPreConfiguredMail("�׽�Ʈ �����Դϴ�.");
        System.out.println("휴먼계정 메일 발송");
        }
    }
}

