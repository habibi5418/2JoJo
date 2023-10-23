package kr.co.dondog.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.board.vo.BoardVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> test() {
		return sqlSession.selectList("mapper.board.test");
	}
}
