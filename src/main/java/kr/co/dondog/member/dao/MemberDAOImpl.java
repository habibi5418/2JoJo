package kr.co.dondog.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.member.vo.MemberReportVO;
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
		System.out.println("임플에서확인"+ memberVO);
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

	@Override
	public int update(MemberVO memberVO) {
		return sqlSession.update("mapper.member.update", memberVO);		

	}

	@Override
	public MemberVO getProfile(String email) {
		return sqlSession.selectOne("mapper.member.getProfile", email);
	}

	@Override
	public int setTown(MemberVO member) {
		return sqlSession.update("mapper.member.setTown", member);
	}

	@Override
	public boolean getReportStatus(MemberReportVO memberReport) {
		MemberReportVO result = sqlSession.selectOne("mapper.member.getReportStatus", memberReport);
		return result != null ? true : false;
	}

	@Override
	public int plusReport(MemberReportVO memberReort) {
		return sqlSession.update("mapper.member.plusReport", memberReort);
	}

	@Override
	public int insertReport(MemberReportVO memberReort) {
		return sqlSession.insert("mapper.member.insertReport", memberReort);
	}

	@Override
	public void plusManner(MemberVO member) {
		sqlSession.update("mapper.member.plusManner", member);
	}

	@Override
	public void minusManner(MemberVO member) {
		sqlSession.update("mapper.member.minusManner", member);
	}

	@Override
	public int getManner(BoardVO board) {
		MemberVO result = sqlSession.selectOne("mapper.member.getManner", board);
		return result != null ? result.getManner() : 0;
	}

}