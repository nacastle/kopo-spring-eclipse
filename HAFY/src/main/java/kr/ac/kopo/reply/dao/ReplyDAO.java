package kr.ac.kopo.reply.dao;

import java.util.List;

import kr.ac.kopo.reply.vo.ReplyVO;

public interface ReplyDAO {
	
	/**
	 * 댓글 등록
	*/
	
	void insert(ReplyVO replyVO);
	
	/**
	 * 해당게시물의 댓글 조회
	 * @param boardNo 조회할 게시물 번호
	*/
	List<ReplyVO> selectAll(int boardNo);
	
	/**
	 * 댓글삭제
	*/
	void delete(int replyNo);
	
	/**
	 * 댓글번호에 해당 게시물 번호 조회
	 * @param replyNo 댓글번호
	 * @return 댓글번호에 해당하는 게시물 번호
	*/
	int selectBoardNo(int replyNo);
}	
