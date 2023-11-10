package kr.co.dondog.dog.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.dog.dao.DogDAO;
import kr.co.dondog.dog.vo.DogVO;

@Service
public class DogService {
	
	@Autowired
	DogDAO dogDAO;
	
	// 회원 등록 강아지 가져오기
	public List<DogVO> getList(String email) throws Exception {
		return dogDAO.getList(email);
	}
	
	// 방금 등록한 강아지 가져오기
	public List<DogVO> getRecent(String email) throws Exception {
		return dogDAO.getRecent(email);
	}
	
	// 강아지 추가
	public JSONObject add(DogVO dog) {
		JSONObject result = new JSONObject();
		
		List<DogVO> dogProfileList = dog.getDogProfileList();
		
		if (dogProfileList.size() != 0) {
			for (DogVO dogProfile : dogProfileList) {
				dogProfile.setEmail(dog.getEmail());
				dogProfile.setDname(dog.getDname());
				dogProfile.setDtype(dog.getDtype());
				dogProfile.setAge(dog.getAge());
				dogProfile.setGender(dog.getGender());
				dogProfile.setWeight(dog.getWeight());
				dogProfile.setMatter(dog.getMatter());
				System.out.println("DogService.add -> dogProfileList : " + dogProfileList);
				if (dogDAO.add(dogProfile) > 0) {
					result.put("message", "추가가 완료되었습니다.");
					result.put("status", true);
				} else {
					result.put("message", "추가를 실패하였습니다.");
					result.put("status", false);
				}
			}
		} 
		
		return result;
	}

	// 글 수정
	public JSONObject update(DogVO dog) {
		JSONObject result = new JSONObject();
		
		if (dog.getDogProfileList().size() != 0) {
			dogDAO.delete(dog);
			for (DogVO dogProfile : dog.getDogProfileList()) {
				dogProfile.setEmail(dog.getEmail());
				dogDAO.add(dogProfile);
			}
		} 
		
		return result;
	}
	
	// 글 삭제
	public JSONObject delete(DogVO dog) {
		JSONObject result = new JSONObject();
		
		if (dog.getDogProfileList().size() != 0) {
			dogDAO.delete(dog);
		} 
		
		return result;
	}
	
	// 게시글 강아지 가져오기
	public List<DogVO> getBoardDogList(BoardVO board) throws Exception {
		return dogDAO.getBoardDogList(board);
	}
	
}
