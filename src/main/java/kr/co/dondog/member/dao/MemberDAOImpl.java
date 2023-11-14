package kr.co.dondog.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	//로그인
//	@Override
//	public MemberVO login(MemberVO memberVO) {
//		System.out.println("MemberDaoImpl.login()");
//		return sqlSession.selectOne("mapper.member.login", memberVO);
//	}

	@Override
	public int updateMemberLastLogin(String email) {
		System.out.println("DAOlmpl.updateMemberLastLogin");
		return sqlSession.update("mapper.member.updateMemberLastLogin", email);
	
	}

	@Override
	public MemberVO findByEmail(String email) {
		System.out.println("DAOlmpl.findByEmail");
		return sqlSession.selectOne("mapper.member.findByEmail", email);
	
	}

	@Override
	public int insert(MemberVO memberVO) {
		System.out.println("DAOlmpl.insert");
		return sqlSession.insert("mapper.member.insert", memberVO);
		
	}

	@Override
	public int loginCountInc(MemberVO memberVO) {
		System.out.println("DAOlmpl.loginCountInc");
		return sqlSession.update("mapper.member.loginCountInc", memberVO);		
	
	}

	@Override
	public int loginCountClear(String email) {
		System.out.println("DAOlmpl.loginCountClear");
		return sqlSession.update("mapper.member.loginCountClear", email);		
		
	}

	@Override
	public int insertMember(MemberVO memberVO) {
		System.out.println("MemberDaoImpl.insertMember()");
		return sqlSession.insert("mapper.member.insertMember", memberVO);
		
	}

	@Override
	public int updateMember(MemberVO memberVO) {
		System.out.println("DAOlmpl.updateMember");
		return sqlSession.update("mapper.member.updateMember", memberVO);		

	}

	

}