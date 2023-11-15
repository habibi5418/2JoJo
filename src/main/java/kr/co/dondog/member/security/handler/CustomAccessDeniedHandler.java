package kr.co.dondog.member.security.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.stereotype.Component;

import kr.co.dondog.member.dao.MemberDAO;
import kr.co.dondog.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j

public class CustomAccessDeniedHandler extends AccessDeniedHandlerImpl {
  
}