package kr.co.dondog.member.security.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.dondog.member.dao.MemberDAO;
import kr.co.dondog.member.vo.MemberVO;

@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("PrincipalDetailsService : 진입");
		// 이메일 확인해서 로그인!
		MemberVO member = memberDAO.findByEmail(username);
		
		System.out.println("PrincipalDetailsService : member -> " + member);
		return new PrincipalDetails(member);
	}
}
