package hafy.mAccount.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hafy.mAccount.service.MAccountService;
import hafy.mAccount.vo.MAccountVO;
import hafy.member.vo.MemberVO;


@Controller
public class MAccountController {
	
	@Autowired
	private MAccountService mAccountService;
	
	
	@ResponseBody
	@DeleteMapping("/deleteMAccount/{accountNo}")
	public void deleteMAccount(@PathVariable("accountNo")String accountNo) {
		
		mAccountService.deleteMAccount(accountNo);
	}
	
	@RequestMapping("/myAccountMng")
	public String myAccountMng(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		List<MAccountVO> mAccountList = mAccountService.selectMAccountList(memberVO.getNickname());
		
		model.addAttribute("mAccountList", mAccountList);
		
		return "myPage/myAccountMng";
	}
	
	@RequestMapping("/myAccount")
	public String myAccount(HttpSession session, Model model) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		List<MAccountVO> mAccountList = mAccountService.selectMAccountList(memberVO.getNickname());
		
		model.addAttribute("mAccountList", mAccountList);
		
		return "myPage/myAccount";
	}
	
	@RequestMapping("/registerAccForm")
	public String registerAccForm() {
		
		return "mAccount/registerAccForm";
	}
	
	@RequestMapping("/addRegisterAccForm")
	public String addRegisterAccForm() {
		
		return "myPage/addRegisterAccForm";
	}
	
	@RequestMapping("/addRegisterAccSuccess")
	public String addRegisterAccSuccess(MAccountVO mAccountVO, HttpSession session, Model model) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		String nickname = memberVO.getNickname();
		mAccountVO.setMemberNick(nickname);
		
		mAccountService.insertMAccount(mAccountVO);
		model.addAttribute("mAccountVO",mAccountVO);
		
		return "myPage/addRegisterAccSuccess";
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
