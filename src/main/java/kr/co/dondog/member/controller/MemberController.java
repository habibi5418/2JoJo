package kr.co.dondog.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.dondog.member.dao.MemberDAO;
import kr.co.dondog.member.exception.ExistMemberException;
import kr.co.dondog.member.security.auth.PrincipalDetails;
import kr.co.dondog.member.service.MemberService;
import kr.co.dondog.member.vo.KakaoProfile;
import kr.co.dondog.member.vo.MemberVO;
import kr.co.dondog.member.vo.OAuthToken;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {


	@Autowired
	private MemberService memberService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberDAO memberDAO;

	// 로그인페이지이동
//	@RequestMapping(value = "/login", method=RequestMethod.GET, produces = "application/json; charset=UTF-8")
//    public String loginForm(Locale locale, Model model) {
//        return "member/loginForm";
//    }

	//로그인기능
//	@RequestMapping(value="/login" , method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
//	@ResponseBody
//	public String login(@RequestBody MemberVO member, HttpSession session) throws Exception {
//		System.out.println("MemberController.login()");
//		System.out.println("멤버확인"+member);
//		// 아이디와 비밀번호 값을 로그로 출력
//		
//		JSONObject result = new JSONObject();
//		
//		 MemberVO loggedInMember = memberService.login(member);
//		 if (loggedInMember != null && loggedInMember.getPwd().equals(member.getPwd())) {
//			 session.setAttribute("loggedInMember", loggedInMember);
//			 result.put("status", true);
//			 result.put("message", "로그인 성공");
//			 return result.toString();
//		 } else {
//			 result.put("status", false);
//			 result.put("message", "로그인 실패");
//			 return result.toString();
//		 }
//	}

	// 로그아웃
	@GetMapping("/logout")
	   public String logout(HttpServletRequest request, HttpServletResponse response, Authentication auth) {
	      if (auth != null) {
	         new SecurityContextLogoutHandler().logout(request, response, auth);
	      }
	      return "loginForm";
	   }

	
	// 로그인 폼 이동( /login은 자체 매핑 )
	@GetMapping("/loginForm")
	public String loginInput(String error, String logout, Model model) {
//		log.info("error : [" + error.toString() + "]");
		log.info("logout : " + logout);
		System.out.println("membercontroller.loginform");
		if(error != null) {
			model.addAttribute("error", "로그인 실패 아이디비밀번호를 확인하세요");
			// 이부분에 로그인 실패시 갈 로직 넣기
//			int loginCountInc = memberDAO.loginCountInc(MemberVO member);

	        // 다른 데이터를 model에 추가할 수 있음
//	        model.addAttribute("loginCountInc", loginCountInc);
	    }
		
		return "member/loginForm";
	}

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : "+ auth);
		model.addAttribute("msg", "접근권한이 없습니다.");
	}

	//카카오 로그인 및 회원가입
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code) { // Data를 리턴해주는 컨트롤러 함수

		System.out.println("kakaoCallback() code : " + code);

		// POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		// Retrofit2
		// OkHttp
		// RestTemplate
		RestTemplate restTemplate = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "c7759f219be1e858049e1cbce919f4fe");
//		params.add("redirect_uri", "http://localhost:8090/auth/kakao/callback");
		params.add("redirect_uri", "https://www.dondog.site/auth/kakao/callback");
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = restTemplate.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// 응답 결과 body 출력
		System.out.println("https://kauth.kakao.com/oauth/token의 body = " + response.getBody());

		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);
		System.out.println(response2.getBody());

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// User 오브젝트 : username, password, email
		System.out.println("카카오 아이디(번호) : " + kakaoProfile.getId());
		System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail());

		MemberVO kakaoMember = MemberVO.builder().email(kakaoProfile.getKakao_account().getEmail()).roles("USER")
				.oauth("kakao").pwd("").build();

		// 가입자 혹은 비가입자 체크 해서 처리
		try {
			memberService.insertMember(kakaoMember);
			System.out.println("기존 회원이 아니기에 자동 회원가입을 진행함");
		} catch (ExistMemberException e) {
			System.out.println("기존에 회원 가입된 경우 다음으로 진행함");
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("자동 로그인을 진행합니다.");

		// 로그인 처리
		PrincipalDetails principalDetails = new PrincipalDetails(kakaoMember);
		Authentication authentication = new UsernamePasswordAuthenticationToken(principalDetails, // 나중에 컨트롤러에서 DI해서 쓸 때
																									// 사용하기 편함.
				null, // 토큰 인증시 패스워드는 알수 없어 null 값을 전달하는 것임
				principalDetails.getAuthorities()); // 사용자가 소유한 역할 권한을 전달한다

		// 강제로 시큐리티의 세션에 접근하여 값 저장
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

}
