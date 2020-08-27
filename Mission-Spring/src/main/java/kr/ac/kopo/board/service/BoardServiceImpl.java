package kr.ac.kopo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectAllBoard() {
		// TODO Auto-generated method stub
		
		List<BoardVO> boardList = boardDAO.selectAll();
		
		return boardList;
	}

	@Override
	public BoardVO selectBoardByNo(int no) {
		// TODO Auto-generated method stub
		
		BoardVO board = boardDAO.selectByNo(no);
		
		return board;
	}
	
	
	
	
	

}
