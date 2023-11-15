package kr.co.dondog.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.admin.dao.AdminDAO;
import kr.co.dondog.dog.vo.DogVO;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	public int dayJoinMemberCount() {
		System.out.println("AdminService.dayJoinMemberCount");
		return adminDAO.dayJoinMemberCount();
	}
	
	public int dayRegBoerdCount() {
		System.out.println("AdminService.dayRegBoerdCount");
		return adminDAO.dayRegBoerdCount();
	}
	
	public int dtypeCount() {
		System.out.println("AdminService.dtypeCount");
		return adminDAO.dtypeCount();
	}
	
	public int totalDogCounts() {
		System.out.println("AdminService.totalDogCounts");
		return adminDAO.totalDogCounts();
	}

//	public List<Map<String, Object>> topDogCounts() {
//		System.out.println("AdminService.topDogCounts");
//		return adminDAO.topDogCounts();
//	}
	
	public List<DogVO> topDogCounts() {
		System.out.println("AdminService.topDogCounts");
		return adminDAO.topDogCounts();
	}
}
