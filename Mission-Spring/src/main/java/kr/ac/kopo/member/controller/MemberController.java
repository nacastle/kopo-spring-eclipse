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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes({ "loginVO" }) // addObject했을때 loginVO객체를 session공유영역에 등록 (여러개 들어올수있음...배열형태{}) 하지만 이방식은
									// invalidate로 세션 삭제 안됨
@Controller
public class MemberController {

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

	// public String login(MemberVO member, HttpServletRequest request) {
	public ModelAndView login(MemberVO member, HttpSession session) {

//		System.out.println(member);
		MemberVO loginVO = memberService.login(member);
		ModelAndView mav = new ModelAndView();

		// 로그인 실패
		if (loginVO == null) {
			mav.setViewName("redirect:/login");
//			return "redirect:/login"; 
		} else {
			
			

			// 로그인 성공
//		HttpSession session = request.getSession();
			String dest = (String)session.getAttribute("dest");
			if(dest == null) {
				mav.setViewName("redirect:/");
			} else {
				mav.setViewName("redirect:" + dest);
				session.removeAttribute(dest);
				
			}
			mav.addObject("loginVO", loginVO);
		}

//		session.setAttribute("loginVO", loginVO);

		return mav;
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status) {

//		session.invalidate();
		
		// session 내 값 지우기
		status.setComplete();
		System.out.println(status.isComplete()); // false면 아직 session에 값이 남아있다는 뜻 / true면 값이 다 사라진것

		return "redirect:/";

	}

}
