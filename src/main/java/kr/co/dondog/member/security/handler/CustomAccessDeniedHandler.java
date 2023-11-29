package kr.co.dondog.member.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import kr.co.dondog.member.dao.MemberDAO;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j

public class CustomAccessDeniedHandler extends AccessDeniedHandlerImpl {
	
//	@Autowired
//	private MemberDAO memberDAO;
//
//	//로그인 실패시 로직
//	@Override
//	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
//		
//		String msg = "";
//		
//		// exception 관련 메세지 처리
//	    if (exception instanceof LockedException) {
//        	msg = "계정이 잠겼습니다";
//	    } else if (exception instanceof DisabledException) {
//        	msg = "DisabledException account";
//        } else if(exception instanceof CredentialsExpiredException) {
//        	msg = "CredentialsExpiredException account";
//        } else if(exception instanceof BadCredentialsException ) {
//        	msg = "BadCredentialsException account";
//        }
//	
//	    setDefaultFailureUrl("/auth/loginForm.do?error=true&exception=" + msg);
//        
//  	super.onAuthenticationFailure(request, response, exception);
//        
//	}
  
}