package kr.co.dondog.mypage.contoller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dondog.member.service.MemberService;
import kr.co.dondog.member.vo.MemberVO;
import kr.co.dondog.mypage.dao.MyPageDAOImpl;
import kr.co.dondog.mypage.service.MyPageService;
import kr.co.dondog.mypage.vo.MyPageVO;

@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;

//	private Object userDatails;
	
	
@GetMapping("/myInfo")
public String myInfoIndex(HttpServletRequest request, Model model) {
	HttpSession session = request.getSession();
	MemberVO loggedInMember = (MemberVO) session.getAttribute("loggedInMember");
	
	String email = (loggedInMember != null ) ? loggedInMember.getEmail() : "" ;
	String nickname = (loggedInMember != null ) ? loggedInMember.getNickname() : "" ;
	String birth =  (loggedInMember != null ) ? loggedInMember.getBirth() : "" ;
	String gender =  (loggedInMember != null ) ? loggedInMember.getGender() : "" ;
	String address =  (loggedInMember != null ) ? loggedInMember.getAddress() : "" ;
	String grade =  (loggedInMember != null ) ? loggedInMember.getGrade() : "" ;
//	LocalDateTime updateTime =  (loggedInMember != null ) ? loggedInMember.getUpdateTime() ;
	System.out.println(email + nickname + loggedInMember + "[loggedIn]");
	
	model.addAttribute("nickname", nickname);
	model.addAttribute("email", email);
	model.addAttribute("birth", birth);
	model.addAttribute("gender",gender);
	model.addAttribute("address",address);
	model.addAttribute("grade",grade);
	
	return "mypage/myInfo";
}
	
	
//	@GetMapping("/myInfo")
//	public MyPageVO myInfo(MyPageDAOImpl myPageDAOImpl) {
//		return myPageService.getMyInfo(myPageDAOImpl.getUser());
//	}

	
}
