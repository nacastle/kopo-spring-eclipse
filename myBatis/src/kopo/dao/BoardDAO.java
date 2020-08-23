package kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kopo.MyConfig;
import kopo.vo.BoardVO;

public class BoardDAO {

	private SqlSession session;

	public BoardDAO() {
		super();
		// TODO Auto-generated constructor stub
		this.session = new MyConfig().getInstance();
		System.out.println("session : " + session);
	}

	public void work() {

//		insert();
//		select();
		selectOne();
//		selectWhere();
//		selectWhere2();
//		selectNos();
//		selectMap();
//		selectMap2();
	}

	public void insert() {

		BoardVO board = new BoardVO();
		board.setTitle("alias삽입연습");
		board.setWriter("나나나");
		board.setContent("연습중입니다.");

		session.insert("dao.BoardDAO.insertBoard", board);
		session.commit(); // 자동커밋이 안되므로 해줘야함

		System.out.println("삽입완료...");

	}

	private void selectWhere() {

		BoardVO vo = new BoardVO();
//	      방법1 제목이 hi고 작성자 kim
		vo.setTitle("alias삽입연습");
		vo.setWriter("나나나");

//	      방법 2. 작성자가 "user"인 게시물 조회
//	      vo.setWriter("나나나");

//	      방법 3. 제목이 "hi"인 게시물 조회
//	      where title = "alias삽입연습"
//	      vo.setTitle("alias삽입연습");

		List<BoardVO> list = session.selectList("dao.BoardDAO.selectWhere", vo);
		for (BoardVO board : list) {
			System.out.println(board);
		}
	}

	private void selectWhere2() {
		// 제목이 'alias'로 시작하고 사용자가 '나나나'

		BoardVO vo = new BoardVO();
		vo.setTitle("alias");
		vo.setWriter("나나나");

		List<BoardVO> list = session.selectList("dao.BoardDAO.selectWhere2", vo);
		for (BoardVO board : list) {
			System.out.println(board);
		}

	}

	private void selectMap() {

//	       제목이 alias삽입연습 이고 작성자는 나나나
		Map<String, String> map = new HashMap<>();
		map.put("title", "alias삽입연습");
		map.put("writer", "나나나");

		List<BoardVO> list = session.selectList("dao.BoardDAO.selectMap", map);
		for (BoardVO board : list) {
			System.out.println(board);
		}

	}

	private void selectMap2() {
		// 2번 게시물 조회

		Map<String, Object> map = session.selectOne("dao.BoardDAO.selectMap2", 2);
		Set<String> keys = map.keySet();

		for (Object key : keys) {
			System.out.println(key + " : " + map.get(key));
		}

	}

	@Test // 이 메소드 테스트 실행
	public void selectNos() {
		int[] nos = { 3, 4, 5, 6, 7, 8, 9 };

		BoardVO vo = new BoardVO();
		vo.setNos(nos);

//		List<BoardVO> list = session.selectList("dao.BoardDAO.selectNos",vo);
//		List<BoardVO> list = session.selectList("dao.BoardDAO.selectNos2",nos);
		List<BoardVO> list = session.selectList("dao.BoardDAO.selectNos3", nos);
		for (BoardVO board : list) {
			System.out.println(board);
		}

	}

	private void selectOne() {
		BoardVO board = session.selectOne("dao.BoardDAO.selectByNo", 235);

		BoardVO vo = new BoardVO();
		vo.setNo(2);
//		BoardVO board = session.selectOne("dao.BoardDAO.selectByNo2", vo);
//		BoardVO board = session.selectOne("dao.BoardDAO.selectByNo3", vo);

		System.out.println(board);

	}

	public void select() {

		List<BoardVO> list = session.selectList("dao.BoardDAO.selectBoard");

		for (BoardVO board : list) {
			System.out.println(board);
		}
	}

}
