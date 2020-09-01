package hafy.mAccount.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hafy.mAccount.service.MAccountService;
import hafy.mAccount.vo.MAccountVO;
import hafy.member.vo.MemberVO;


@Controller
public class MAccountController {
	
	@Autowired
	private MAccountService mAccountService;
	
	
	
	@RequestMapping("/registerAccForm")
	public String registerAccForm(HttpSession session) {
		
		// 테스트 용
//		MemberVO memberVO = new MemberVO("nacastle","나성주","920193","서울시","송파구","SKT","01042119382","1","0101t");
//		session.setAttribute("memberVO", memberVO);
		
		return "mAccount/registerAccForm";
	}
	
	@RequestMapping("/registerAccSuccess")
	public String registerAccSuccess(MAccountVO mAccountVO, HttpSession session, Model model) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		String nickname = memberVO.getNickname();
		mAccountVO.setMemberNick(nickname);
		
		mAccountService.insertMAccount(mAccountVO);
		model.addAttribute("mAccountVO",mAccountVO);
		
		return "mAccount/registerAccSuccess";
	}
	
	
	

}
