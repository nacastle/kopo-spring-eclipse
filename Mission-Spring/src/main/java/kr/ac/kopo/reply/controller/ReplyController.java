package kr.ac.kopo.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;

//@RequestMaaping(/reply) 이거 쓰면 getmapping에 /{boardNo}만 쓸수있음 (postMapping도 마찬가지)
@RestController
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//@ResponseBody  이거 생략하고 쓴게 @RestController
	@PostMapping("/reply")
	public void addReply(ReplyVO replyVO) {
//		System.out.println("/reply controller 호출...");
//		System.out.println(replyVO);
		replyService.insertReply(replyVO);  // 댓글 삽입과 동시에 t_board의 reply_cnt 1증가 (serviceImpl보면 앎)
		
	}
	
	@GetMapping("/reply/{boardNo}")
	public List<ReplyVO> getList(@PathVariable("boardNo")int boardNo) {
//		System.out.println("조회할 게시물 번호 : "+ boardNo);
		List<ReplyVO> replyList = replyService.selectReplyList(boardNo);
		
		return replyList;
	}
	
	@DeleteMapping("/reply/{replyNo}")
	public void deleteReply(@PathVariable("replyNo")int replyNo) {
		System.out.println("삭제할 댓글 번호 : " + replyNo);
		replyService.removeReply(replyNo);
		
	}
	
	@DeleteMapping("/reply/{replyNo}/{boardNo}")
	public void deleteReply(@PathVariable("replyNo")int replyNo, @PathVariable("boardNo")int boardNo) {
		System.out.println("댓글번호 : " + replyNo + ", 게시글 번호 : " + boardNo);
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setNo(replyNo);
		replyVO.setBoardNo(boardNo);
		replyService.removeReply(replyVO);
		
		
	}

}
