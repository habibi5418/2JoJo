package kr.co.dondog.mypage.contoller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.dog.service.DogService;
import kr.co.dondog.member.security.auth.PrincipalDetails;
import kr.co.dondog.member.service.MemberService;
import kr.co.dondog.member.vo.MemberVO;

@RequestMapping("/profile")
@Controller
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DogService dogService;
	
	@GetMapping("/myInfo")
	public String myProfilePage(Model model, Authentication authentication) throws Exception {
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
	        PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
	        MemberVO member= (MemberVO) userDetails.getUser();
	        System.out.println(member);
	        model.addAttribute("boardCnt", boardService.getCountByMember(member));
	        model.addAttribute("dogList", dogService.getList(member.getEmail()));
	        model.addAttribute("loggedInMember", member);
		}
		return "mypage/myProfilePage";
	}
	
}
