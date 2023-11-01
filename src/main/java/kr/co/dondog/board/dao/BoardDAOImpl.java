package kr.co.dondog.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.board.vo.ParkVO;
import kr.co.dondog.board.vo.TestVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int sendCoord(TestVO test) {
		return sqlSession.insert("mapper.board.sendCoord", test);
	}

	@Override
	public List<ParkVO> loadPark() {
		return sqlSession.selectList("mapper.board.loadPark");
	}

	@Override
	public List<TestVO> getRoute(TestVO test) {
		System.out.println(test);
		return sqlSession.selectList("mapper.board.getRoute", test);
	}

	@Override
	public List<TestVO> getWnum(TestVO test) {
		return sqlSession.selectList("mapper.board.getWnum", test);
	}
}
