package kr.co.dondog.admin.dao;

import java.util.List;

import kr.co.dondog.admin.vo.SearchVO;

import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.vo.MemberVO;

public interface AdminDAO {

	// 일일 가입자 확인
	int dayJoinMemberCount();
	
	// 일일 게시글 
	int dayRegBoerdCount();
	
//	int dtypeCount();
	
	// 강아지탑4+기타
	List<DogVO> topDogCounts();
	
	// 전체 강아지 등록수
	int totalDogCounts();
	
	// 전체회원리스트(회원관리)
	List<MemberVO> getMemberAllList();
	
	// 블랙회원 비율
	int blackCounts();
	
	// 누적 채팅방
	int chatRoomCount();
	
	// 회원관리
	int updateMember(String email, String field, String value);
	
	// 블랙회원 변경
	int reportCountInc();
	
//	int sendEmail();

//	=======================메인 페이지 출력부분=========================
	
	// 누적 가입자수 
	int getmemberCount();

	List<MemberVO> sleepMember();


	
//	======================== 페이징 기타 등등 ==================================
	     
	List<MemberVO> searchMemberList(SearchVO searchVO);

	int getSearchMemberTotalCount(SearchVO searchVO);

	

	
	}
