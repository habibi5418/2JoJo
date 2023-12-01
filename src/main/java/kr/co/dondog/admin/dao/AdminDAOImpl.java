package kr.co.dondog.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.admin.vo.SearchVO;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.vo.MemberVO;

@Repository("AdminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSession sqlSession;

	// 일일 가입자 확인
	@Override
	public int dayJoinMemberCount() {
		System.out.println("AdminDAOImpl.dayJoinMemberCount");
		return sqlSession.selectOne("mapper.admin.dayJoinMemberCount");
	}

	// 일일 게시글 	
	@Override
	public int dayRegBoerdCount() {
		System.out.println("AdminDAOImpl.dayRegBoerdCount");
		return sqlSession.selectOne("mapper.admin.dayRegBoerdCount");
	}

//	@Override
//	public int dtypeCount() {
//		System.out.println("AdminDAOImpl.dtypeCount");
//		return sqlSession.selectOne("mapper.admin.dtypeCount");
//	}

	// 강아지 탑4+기타
	@Override
	public List<DogVO> topDogCounts() {
		System.out.println("AdminDAOImpl.topDogCounts");
		return sqlSession.selectList("mapper.admin.topDogCounts");

	}

	// 전체 강아지 등록수
	@Override
	public int totalDogCounts() {
		System.out.println("AdminDAOImpl.totalDogCounts");
		return sqlSession.selectOne("mapper.admin.totalDogCounts");
	}

	// 전체 회원 리스트(회원관리)
	@Override
	public List<MemberVO> getMemberAllList() {
		System.out.println("AdminDAOImpl.getMemberAllList");
		return sqlSession.selectList("mapper.admin.getMemberAllList");
	}

	// 블랙회원 비율
	@Override
	public int blackCounts() {
		System.out.println("AdminDAOImpl.blackCounts");
		return sqlSession.selectOne("mapper.admin.blackCounts");
	}

	// 누적 채팅방
	@Override
	public int chatRoomCount() {
		System.out.println("AdminDAOImpl.chatRoomCount");
		return sqlSession.selectOne("mapper.admin.chatRoomCount");
	}

	//회원관리
	@Override
	public int updateMember(String email, String field, String value) {
	    Map<String, String> params = new HashMap<>();
	    params.put("email", email);
	    params.put("field", field);
	    params.put("value", value);

	    System.out.println("AdminDAOImpl.updateMember");
	    System.out.println(params.get("email"));
	    System.out.println(params.get("field"));
	    System.out.println(params.get("value"));

	    // 기존의 쿼리를 실행하고 업데이트된 행 수를 반환받음
	    int updatedRows = sqlSession.update("mapper.admin.updateMember", params);

	    // 회원의 신고 횟수를 조회
	    int reports = sqlSession.selectOne("mapper.admin.getReportsCount", email);

	    // 블랙회원 여부 확인 및 필요 시 블랙회원으로 업데이트
	    if (reports >= 5) {
	        sqlSession.update("mapper.admin.reportCountInc", email);
	    }

	    return updatedRows;
	}

	@Override
	public int getmemberCount() {
		System.out.println("AdminDAOImpl.getmemberCount");
		return sqlSession.selectOne("mapper.admin.getmemberCount");
	}
	
	@Override
	public int reportCountInc() {
		System.out.println("AdminDAOImpl.reportCountInc");
		return sqlSession.selectOne("mapper.admin.reportCountInc");
	}

	@Override
	public List<MemberVO> sleepMember() {
		System.out.println("AdminDAOImpl.sleepMember");
		return sqlSession.selectList("mapper.admin.sleepMember");
	}




//	===================페이징, 기타 등등============================

	@Override
	public List<MemberVO> searchMemberList(SearchVO searchVO) {
		System.out.println("AdminDAOImpl.searchMemberList");
		List<MemberVO> result = sqlSession.selectList("mapper.admin.searchMemberList", searchVO);
		return result;
	}

	@Override
	public int getSearchMemberTotalCount(SearchVO searchVO) {
		System.out.println("AdminDAOImpl.getSearchMemberTotalCount");
		return sqlSession.selectOne("mapper.admin.getSearchMemberTotalCount", searchVO);
	}



}
