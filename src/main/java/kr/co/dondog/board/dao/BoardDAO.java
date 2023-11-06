package kr.co.dondog.board.dao;

import java.util.List;

import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.board.vo.ParkVO;
import kr.co.dondog.board.vo.TestVO;

public interface BoardDAO {
	List<BoardVO> getMatchList();
	
	int sendCoord(TestVO test);
	List<ParkVO> loadPark();
	List<TestVO> getRoute(TestVO test);
	List<TestVO> getWnum(TestVO test);
}
