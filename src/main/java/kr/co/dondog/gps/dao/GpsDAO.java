package kr.co.dondog.gps.dao;

import java.util.List;

import kr.co.dondog.gps.vo.ParkVO;
import kr.co.dondog.gps.vo.TestVO;


public interface GpsDAO {
	int sendCoord(TestVO test);
	List<ParkVO> loadPark();
	List<TestVO> getRoute(TestVO test);
	List<TestVO> getWnum(TestVO test);
}
