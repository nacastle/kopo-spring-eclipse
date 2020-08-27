package kr.ac.kopo.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.reply.dao.ReplyDAO;
import kr.ac.kopo.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private BoardDAO boardDAO;
	
	/**
	 * 댓글추가
	 * 1. DB에 t_board에 해당 레코드의 댓글 카운트 컬럼 1증가
	 * 2. DB에 t_reply에 새로운 댓글 추가
	
	*/
	@Transactional
	@Override
	public void insertReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		
		
		replyDAO.insert(replyVO);
		boardDAO.incrementReplyCnt(replyVO.getBoardNo());
		
	}


	@Override
	public List<ReplyVO> selectReplyList(int boardNo) {
		// TODO Auto-generated method stub
		List<ReplyVO> replyList = replyDAO.selectAll(boardNo);
		
		return replyList;
	}
	
	/**
	 * 0. DB에서 삭제할 댓글의 게시물 번호 조회(t_reply)
	 * 1. DB에서 해당 댓글 삭제(t_reply)
	 * 2. DB에서 해당 게시물의 댓글 카운트 감소(t_board)
	*/	
	@Transactional
	@Override
	public void removeReply(int replyNo) {
		// TODO Auto-generated method stub
		
		int boardNo = replyDAO.selectBoardNo(replyNo);
		replyDAO.delete(replyNo);
		boardDAO.decrementReplyCnt(boardNo);
		
	}

	@Transactional
	@Override
	public void removeReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		replyDAO.delete(replyVO.getNo());
		boardDAO.decrementReplyCnt(replyVO.getBoardNo());
		
		
	}
	
	
	
	
	
	
	
	
	

}
