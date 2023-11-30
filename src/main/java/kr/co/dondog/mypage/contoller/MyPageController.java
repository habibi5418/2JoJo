package kr.co.dondog.mypage.contoller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.dondog.member.service.MemberService;

@RequestMapping("/profile")
@Controller
public class MyPageController {
	
//	@Autowired
//	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;

	
	
@GetMapping("/myInfo")
public String myProfilePage() {
	return "mypage/myProfilePage";
}
	
	
	
}
