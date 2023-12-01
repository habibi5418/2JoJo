package kr.co.dondog.member.dao;

import kr.co.dondog.member.vo.MemberVO;

public interface MemberDAO {
	
	//자사몰기준로그인
//	MemberVO login(MemberVO member) throws Exception;
	
	
	public int updateMemberLastLogin(String email);
	public MemberVO findByEmail(String email);
	public int insert(MemberVO member);
	public int loginCountInc(MemberVO memberVO);
	public int loginCountClear(String email);
	public int insertMember(MemberVO memberVO);
	public int updateMember(MemberVO memberVO);
	public int update(MemberVO memberVO);
	MemberVO getProfile(String email);


}