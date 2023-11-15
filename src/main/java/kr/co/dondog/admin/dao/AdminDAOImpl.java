package kr.co.dondog.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.dog.vo.DogVO;

@Repository("AdminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int dayJoinMemberCount() {
		System.out.println("AdminDAOImpl.dayJoinMemberCount");
		return sqlSession.selectOne("mapper.admin.dayJoinMemberCount");
	}

	@Override
	public int dayRegBoerdCount() {
		System.out.println("AdminDAOImpl.dayRegBoerdCount");
		return sqlSession.selectOne("mapper.admin.dayRegBoerdCount");
	}

	@Override
	public int dtypeCount() {
		System.out.println("AdminDAOImpl.dtypeCount");
		return sqlSession.selectOne("mapper.admin.dtypeCount");
	}

	@Override
//	public List<Map<String, Object>> topDogCounts() {
	public List<DogVO> topDogCounts() {
		System.out.println("AdminDAOImpl.topDogCounts");
		return sqlSession.selectList("mapper.admin.topDogCounts");

	}

	@Override
	public int totalDogCounts() {
		System.out.println("AdminDAOImpl.totalDogCounts");
		return sqlSession.selectOne("mapper.admin.totalDogCounts");
	}




}
