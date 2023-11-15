package kr.co.dondog.admin.dao;

import java.util.List;

import kr.co.dondog.dog.vo.DogVO;

public interface AdminDAO {

	int dayJoinMemberCount();

	int dayRegBoerdCount();

	int dtypeCount();

//	List<Map<String, Object>> topDogCounts();
	List<DogVO> topDogCounts();

	int totalDogCounts();
}
