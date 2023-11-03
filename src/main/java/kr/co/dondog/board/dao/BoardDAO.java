package kr.co.dondog.board.dao;

import java.util.List;

import kr.co.dondog.board.vo.ParkVO;
import kr.co.dondog.board.vo.TestVO;

public interface BoardDAO {
	int sendCoord(TestVO test);
	List<ParkVO> loadPark();
	List<TestVO> getRoute(TestVO test);
	List<TestVO> getWnum(TestVO test);
}
