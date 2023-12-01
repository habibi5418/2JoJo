package kr.co.dondog.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


import kr.co.dondog.admin.vo.SearchVO;
import kr.co.dondog.admin.dao.AdminDAO;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.vo.MemberVO;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	// 일일 가입자 확인
	public int dayJoinMemberCount() {
		System.out.println("AdminService.dayJoinMemberCount");
		return adminDAO.dayJoinMemberCount();
	}
	
	// 일일 게시글
	public int dayRegBoerdCount() {
		System.out.println("AdminService.dayRegBoerdCount");
		return adminDAO.dayRegBoerdCount();
	}
	
	
//	public int dtypeCount() {
//		System.out.println("AdminService.dtypeCount");
//		return adminDAO.dtypeCount();
//	}
	
	// 강아지 탑4+기타
	public List<DogVO> topDogCounts() {
		System.out.println("AdminService.topDogCounts");
		return adminDAO.topDogCounts();
	}

	
	// 전체 강아지 등록수
	public int totalDogCounts() {
		System.out.println("AdminService.totalDogCounts");
		return adminDAO.totalDogCounts();
	}
	
	
	// 전체 회원 리스트(회원관리)
	public List<MemberVO> getMemberAllList() throws Exception {
		System.out.println("AdminService.getMemberAllList");
		return adminDAO.getMemberAllList();
	}

	
	// 블랙회원 비율
	public int blackCounts() {
		System.out.println("AdminService.blackCounts");
		return adminDAO.blackCounts();
	}

	
	// 누적 채팅방
	public int chatRoomCount() {
		System.out.println("AdminService.chatRoomCount");
		return adminDAO.chatRoomCount();
	}

	
	//회원관리
	public int updateMember(String email, String field, String value) {
		System.out.println("AdminService.updateMember");
		return adminDAO.updateMember(email, field, value);
	}

	//전체회원수
	public int getmemberCount() {
		System.out.println("AdminService.getmemberCount");
		return adminDAO.getmemberCount();
	}
	
	//누적신고수
	public int reportCountInc() {
		System.out.println("AdminService.reportCountInc");
		return adminDAO.reportCountInc();
	}

	// 
	public List<MemberVO> sleepMember() {
		System.out.println("AdminService.sleepMember");
		return adminDAO.sleepMember();
	}
	
	
//	===========================페이징, 검색 , 건수 부분==============================
	public Map<String, Object> searchMemberList(SearchVO searchVO) {
	    System.out.println("AdminService.searchMemberList");
	    // 결과를 저장할 List<List<Object>> 배열
	    List<List<Object>> array = new ArrayList<>();

	    // 현재 페이지의 첫 번째 행 인덱스
	    int start = searchVO.getStart();

	    // adminDAO를 통해 회원 목록을 가져옴
	    for (MemberVO item : adminDAO.searchMemberList(searchVO)) {
	        // 각 회원 정보를 List<Object> 형태로 변환하여 배열에 추가
	        List<Object> data = new ArrayList<>();
	        data.add(String.valueOf(++start));  // 일련번호 (페이징에서 사용)
	        data.add(item.getEmail());
	        data.add(item.getMname());
	        data.add(item.getAddress());
	        data.add(item.getBirth());
	        data.add(item.getGender());
	        data.add(item.getGrade());
	        data.add(formatDate(item.getJoinDate()));
	        data.add(formatDate(item.getRecentLog()));
	        data.add(item.getReports());
	        data.add(item.getBlack());
	        data.add(item.getAccountLocked());
	        data.add(item.getCancels());

	        // 각 회원의 이메일과 이름을 콘솔에 출력 (디버깅용)
//	        System.out.println("RecentLog: " + item.getRecentLog());
//	        System.out.println("Mname: " + item.getMname());
//	        System.out.println("service.searchVO ->" + searchVO);
	        // 배열에 회원 데이터 추가
	        array.add(data);
	    }

//	    // 결과를 Map에 담아 반환
//	    Map<String, Object> result = new HashMap<>();
//	    result.put("draw", searchVO.getDraw());
//	    result.put("recordsTotal", array.size());  // 전체 레코드 수 (페이징에서 사용)
//	    result.put("recordsFiltered", array.size());  // 필터링된 레코드 수 (페이징에서 사용)
//	    result.put("data", array);  // 실제 데이터 배열
//
//	    return result;
//	}
        
        int recordsTotal = adminDAO.getSearchMemberTotalCount(searchVO);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("recordsTotal", recordsTotal);
		result.put("recordsFiltered", recordsTotal);
		result.put("data", array);
		
		return result;
	}
	
	 public String formatDate(LocalDateTime dateTime) {
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        return dateTime.format(formatter);
	    }


}
