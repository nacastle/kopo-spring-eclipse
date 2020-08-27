package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

//@Controller   //안만들어지기 때문에 주입이 일어나지 않아서 무시당할 클래스
public class MemberController2 {
	
	@Autowired
	private MemberService memberService;
	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
	@GetMapping("/login")
	public String loginForm() {
		
		return "/login/login";
	}

//	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@PostMapping("/login")
//	public String login(@RequestParam("id")String id, @RequestParam("password")String password) {

	//	public String login(MemberVO member, HttpServletRequest request) {
	public String login(MemberVO member, HttpSession session) {
		
//		System.out.println(member);
		
		MemberVO loginVO = memberService.login(member);
		
		// 로그인 실패
		if (loginVO == null) {
			return "redirect:/login";
		}
		
		//로그인 성공
//		HttpSession session = request.getSession();
		session.setAttribute("loginVO", loginVO);
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
		
	}

}
