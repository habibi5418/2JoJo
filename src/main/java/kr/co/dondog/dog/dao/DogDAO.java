package kr.co.dondog.dog.dao;

import java.util.List;

import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.dog.vo.DogVO;

public interface DogDAO {
	List<DogVO> getList(String email) throws Exception;
	List<DogVO> getRecent(String email) throws Exception;
	DogVO getProfile(int dnum);
	int add(DogVO dog);
	int update(DogVO dog);
	int delete(DogVO dog);
	List<DogVO> getBoardDogList(BoardVO board) throws Exception;

}
