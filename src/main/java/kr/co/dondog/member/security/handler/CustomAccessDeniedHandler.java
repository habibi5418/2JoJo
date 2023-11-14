package kr.co.dondog.member.security.handler;

import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class CustomAccessDeniedHandler extends AccessDeniedHandlerImpl {
	// AccessDeniedHandlerImpl 안에 기본적으로 실패시 안내가 들어있음

}
