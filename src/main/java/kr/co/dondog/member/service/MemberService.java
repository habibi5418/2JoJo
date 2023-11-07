package kr.co.dondog.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.member.dao.MemberDao;
import kr.co.dondog.member.vo.MemberVO;

@Service
public class MemberService {

	 @Autowired
	 private MemberDao memberDAO;

	 // 로그인
	public MemberVO login(MemberVO member) throws Exception {
		System.out.println("MemberService.login()");
		return memberDAO.login(member);
	}




	
}
