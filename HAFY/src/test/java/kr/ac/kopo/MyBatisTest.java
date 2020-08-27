package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})  // config.xml 파일 로드하기
public class MyBatisTest {
	
	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private BoardService boardService;
	
	@Ignore
	@Test
	public void dsTest() throws Exception {
//		System.out.println(ds);
//		assertNull(ds);  //null이면 초록색
		assertNotNull(ds); // null이 아니면 초록색
	}
	
	@Ignore
	@Test
	public void sqlSessionTest() throws Exception {
		assertNotNull(session);
		
	}
	
	@Ignore
	@Test
	public void 전체게시글조회테스트() {
//		List<BoardVO> list = session.selectList("board.dao.BoardDAO.selectAll");
//		List<BoardVO> list = boardDAO.selectAll();
		List<BoardVO> list = boardService.selectAllBoard();
		
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	@Test
	public void 게시판상세Test() throws Exception {
		BoardVO board = boardDAO.selectByNo(3);
		System.out.println(board);
		
	}

}
