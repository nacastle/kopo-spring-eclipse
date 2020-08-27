package kr.ac.kopo.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("reply.dao.ReplyDAO.insert",replyVO);

	}

	@Override
	public List<ReplyVO> selectAll(int boardNo) {
		// TODO Auto-generated method stub
		List<ReplyVO> replyList = sqlSession.selectList("reply.dao.ReplyDAO.selectAll", boardNo);
		
		return replyList;
	}

	@Override
	public void delete(int replyNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("reply.dao.ReplyDAO.delete",replyNo);
	}

	@Override
	public int selectBoardNo(int replyNo) {
		// TODO Auto-generated method stub
		int boardNo =  sqlSession.selectOne("reply.dao.ReplyDAO.selectBoardNo",replyNo);
		
		return boardNo;
	}


	
	
	
	
	
	
	

}
