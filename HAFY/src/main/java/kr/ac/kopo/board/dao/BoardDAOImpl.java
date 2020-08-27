package kr.ac.kopo.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<BoardVO> selectAll() {
		// TODO Auto-generated method stub
		
		List<BoardVO> boardList = sqlSession.selectList("board.dao.BoardDAO.selectAll");
		
		return boardList;
	}

	@Override
	public void insert(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO selectByNo(int no) {
		// TODO Auto-generated method stub
		
		BoardVO board = sqlSession.selectOne("board.dao.BoardDAO.selectByNo",no);
		
		return board;
	}

	@Override
	public void incrementReplyCnt(int no) {
		// TODO Auto-generated method stub
		sqlSession.update("board.dao.BoardDAO.incrementReplyCnt",no);
		
	}

	@Override
	public void decrementReplyCnt(int no) {
		// TODO Auto-generated method stub
		sqlSession.update("board.dao.BoardDAO.decrementReplyCnt",no);
	}
	
	
	
	
	
	
	
	

}
