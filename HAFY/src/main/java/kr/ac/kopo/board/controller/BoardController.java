package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board")
	public ModelAndView list() {
		
		List<BoardVO> boardList = boardService.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("boardList",boardList);
		
		return mav;
	}
	
	
//	http://localhost:9999/Mission-Spring/board/2
	@RequestMapping("board/{no}")   // requestMapping 안에 가변적인 값 넣을때 { }
	public ModelAndView detail(@PathVariable("no")int boardNo) {
		
		System.out.println("boardNO : " + boardNo);
		BoardVO board = boardService.selectBoardByNo(boardNo);
		
		System.out.println(board.getTitle());
		
		ModelAndView mav = new ModelAndView("board/detail");
		
		mav.addObject("board", board);
		
		return mav;
	}
	
//	http://localhost:9999/Mission-Spring/board/detail?no=2
//	@RequestMapping("/board/detail")
//	public ModelAndView detail( @RequestParam("no")int boardNo) {
//		
//		System.out.println(boardNo);
//		
//		ModelAndView mav = new ModelAndView("board/detail");
//		
//		return mav;
//	}
	
	@GetMapping("/board/write")
//	public void writeForm(Model model) { //void면 mapping 내 uri값으로 포워드함
	public String writeForm(Model model, HttpSession session) { 
		
		BoardVO board = new BoardVO();
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		if(loginVO != null) {
			
			board.setWriter(loginVO.getId());
//			model.addAttribute("loginVO", loginVO);
		}
		
		
		model.addAttribute("boardVO", board);
		
		return "board/write";
	}
	
	@PostMapping("/board/write")
	public String write(@Valid BoardVO boardVO, BindingResult result) {  // @Valid : 게시글 등록폼 유효성 검사 (제목, 내용에 작성안된부분이 있는지)
		
//		System.out.println(boardVO);
		System.out.println("또 호츌?");
//		System.out.println("result: " + result.hasErrors());
		if (result.hasErrors()) {
			System.out.println("오류발생...");
			
			return "board/write";
			
		}
		
		return "redirect:/board";
	}
	

}
