package kr.co.dondog.member.dao;

import kr.co.dondog.member.vo.MemberVO;

public interface MemberDao {
	MemberVO login(MemberVO member) throws Exception;


}