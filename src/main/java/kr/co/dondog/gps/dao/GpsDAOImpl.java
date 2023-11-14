package kr.co.dondog.gps.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.gps.vo.ParkVO;
import kr.co.dondog.gps.vo.TestVO;

@Repository("GpsDAO")
public class GpsDAOImpl implements GpsDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int sendCoord(TestVO test) {
		return sqlSession.insert("mapper.gps.sendCoord", test);
	}

	@Override
	public List<ParkVO> loadPark() {
		return sqlSession.selectList("mapper.gps.loadPark");
	}

	@Override
	public List<TestVO> getRoute(TestVO test) {
		System.out.println(test);
		return sqlSession.selectList("mapper.gps.getRoute", test);
	}

	@Override
	public List<TestVO> getWnum(TestVO test) {
		return sqlSession.selectList("mapper.gps.getWnum", test);
	}
}
