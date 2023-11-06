package kr.co.dondog.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dondog.member.service.MemberService;
import kr.co.dondog.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value = "/login", method=RequestMethod.GET, produces = "application/json; charset=UTF-8")
    public String loginForm(Locale locale, Model model) {
        return "member/loginForm";
    }

	

	@RequestMapping(value="/login" , method = RequestMethod.POST)
	public String login(MemberVO member, HttpSession session) throws Exception {
		System.out.println("MemberController.login()");
		System.out.println("멤버확인"+member);
		// 아이디와 비밀번호 값을 로그로 출력

		 MemberVO loggedInMember = memberService.login(member);
		 if (loggedInMember != null && loggedInMember.getPwd().equals(member.getPwd())) {
			 session.setAttribute("loggedInMember", loggedInMember);
			 return "redirect:/home";
		 } else {
			 return "redirect:/login";
		 }
	}
	
	
	
}



