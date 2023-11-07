package kr.co.dondog.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.member.vo.MemberVO;

@Repository("MemberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	//로그인
	@Override
	public MemberVO login(MemberVO member) {
		System.out.println("MemberDaoImpl.login()");
		MemberVO result = sqlSession.selectOne("mapper.member.login", member);
		System.out.println("MemberVO" + result.toString());
		return result;
	}

}