package kr.co.dondog.dog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.dog.vo.DogVO;

@Repository("DogDAO")
public class DogDAOImpl implements DogDAO {
	
	@Autowired
	private  SqlSession sqlSession;

	@Override
	public List<DogVO> getList(String email) throws Exception {
		return sqlSession.selectList("mapper.dog.getList", email);
	}
	
	@Override
	public List<DogVO> getRecent(String email) throws Exception {
		return sqlSession.selectList("mapper.dog.getRecent", email);
	}

	@Override
	public DogVO getProfile(int dnum) {
		return sqlSession.selectOne("mapper.dog.getProfile", dnum);
	}

	@Override
	public int add(DogVO dog) {
		return sqlSession.insert("mapper.dog.add", dog);
	}

	@Override
	public int update(DogVO dog) {
		return sqlSession.insert("mapper.dog.add", dog);
	}

	@Override
	public int delete(DogVO dog) {
		return sqlSession.delete("mapper.dog.add", dog);
	}

	@Override
	public List<DogVO> getBoardDogList(BoardVO board) throws Exception {
		return sqlSession.selectList("mapper.dog.getBoardDogList", board);
	}

}