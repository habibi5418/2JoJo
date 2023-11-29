package kr.co.dondog.member.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import kr.co.dondog.member.dao.MemberDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	private MemberDAO memberDAO;

	//로그인 성공시 메인페이지 진입
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		memberDAO.updateMemberLastLogin(authentication.getName());
		memberDAO.loginCountClear(authentication.getName());
		
		System.out.println("authentication ->" + authentication);
		
		String url = "";
	      
	      for (GrantedAuthority role : authentication.getAuthorities()) {
	           if (role.getAuthority().contains("ADMIN")) {
	              url = "/admin/mainDashBoard";
	           } else if (role.getAuthority().contains("USER")){
	              url = "/";
	           }
	        }
		setDefaultTargetUrl(url);
        
  	super.onAuthenticationSuccess(request, response, authentication);
        
	}

}