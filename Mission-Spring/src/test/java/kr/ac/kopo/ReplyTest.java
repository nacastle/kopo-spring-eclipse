package kr.ac.kopo;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.reply.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class ReplyTest {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Test
	public void 전체댓글조회() throws Exception {
		
		List<ReplyVO> list = sqlSession.selectList("reply.dao.ReplyDAO.selectAll", 7);
		
		for(ReplyVO vo : list) {
			System.out.println(vo);
		}
		
	}
	
	public void 댓글수증가Test() throws Exception {
		
		sqlSession.update("board.dao.BoardDAO.incrementReplyCnt",7);
		
	}

}
