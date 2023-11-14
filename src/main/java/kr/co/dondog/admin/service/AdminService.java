package kr.co.dondog.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.admin.dao.AdminDAO;
import kr.co.dondog.member.vo.MemberVO;

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
}
