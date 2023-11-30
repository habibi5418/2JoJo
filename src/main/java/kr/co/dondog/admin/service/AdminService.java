package kr.co.dondog.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public int getmemberCount() {
		System.out.println("AdminService.getmemberCount");
		return adminDAO.getmemberCount();
	}

	public int reportCountInc() {
		System.out.println("AdminService.reportCountInc");
		return adminDAO.reportCountInc();
	}

	public List<MemberVO> sendEmail() {
		System.out.println("AdminService.sendEmail");
		return adminDAO.sendEmailMember();
	}
	
	
//	===========================페이징, 검색 , 건수 부분==============================
//	public Map<String, Object> searchMemberList(SearchVO searchVO) {
//		System.out.println("AdminService.searchMemberList");
//
//        List<List<Object>> array = new ArrayList<List<Object>>();
//		int start = searchVO.getStart();
//        for (MemberVO item : adminDAO.searchMemberList(searchVO)) {
//        	List<Object> data = new ArrayList<Object>();
//        	data.add(String.valueOf(++start));
//        	data.add(item.getEmail());
//        	data.add(item.getMname());
//        	data.add(item.getAddress());
//        	data.add(item.getBirth());
//        	data.add(item.getGender());
//        	data.add(item.getGrade());
//        	data.add(item.getJoinDate());
//        	data.add(item.getRecentLog());
//        	data.add(item.getReports());
//        	data.add(item.getBlack());
//        	data.add(item.getAccountLocked());
//        	data.add(item.getCancels());
//        	
//        	
//            System.out.println("Email: " + item.getEmail());
//            System.out.println("Mname: " + item.getMname());
//        	array.add(data);
//		}
//        
//        int recordsTotal = adminDAO.getSearchMemberTotalCount(searchVO);
//		Map<String, Object> result = new HashMap<String, Object>();
//		result.put("recordsTotal", recordsTotal);
//		result.put("recordsFiltered", recordsTotal);
//		result.put("data", array);
//		
//		return result;
//	}



}
