package hafy.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import hafy.member.service.MemberService;
import hafy.member.vo.MemberVO;
import hafy.member.vo.NoticeSettingVO;




//@SessionAttributes({ "memberVO" })	// addObject했을때 loginVO객체를 session공유영역에 등록 (여러개 들어올수있음...배열형태{}) 하지만 이방식은
									// invalidate로 세션 삭제 안됨
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	
	
	
	
	@GetMapping("/noticeSetting")
	public String noticeSetting(HttpSession session, Model model) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String nickname = memberVO.getNickname();
		
		NoticeSettingVO noticeSettingVO = memberService.selectNoticeSettingVOByNick(nickname);
//		System.out.println(nickname + "의 " + noticeSettingVO);
		model.addAttribute("noticeSettingVO", noticeSettingVO);
		
		return "/myPage/noticeSetting";
	}
	
	@ResponseBody
	@PostMapping("/noticeSettingProcess")
	public void noticeSettingProcess(HttpSession session, NoticeSettingVO noticeSettingVO) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String nickname = memberVO.getNickname();
		noticeSettingVO.setMemberNick(nickname);
		
//		System.out.println("noticeSettingVO" + noticeSettingVO);
		memberService.updateNoticeSetting(noticeSettingVO);
		
	}
	
	@PostMapping("/changePwdSuccess")
	public String changePwdSuccess(@RequestParam("tranzPwd") String tranzPwd, HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String nickname = memberVO.getNickname();
//		System.out.println("닉넴:"+nickname +", 비번: " + tranzPwd);
		
		Map<String, String> pwdMap = new HashMap<String, String>();
		pwdMap.put("nickname", nickname);
		pwdMap.put("tranzPwd", tranzPwd);
		memberService.registerPwd(pwdMap);
		
		memberVO.setTranzPwd(tranzPwd);
		session.removeAttribute("memberVO");
		session.setAttribute("memberVO", memberVO);
		
		return "/myPage/changePwdSuccess";
	}

	
	@GetMapping("/changePwdForm")
	public String changePwdForm() {
		return "/myPage/changePwdForm";
	}
	
	@GetMapping("/changePwd")
	public String changePwd() {
		return "/myPage/changePwd";
	}
	
	@GetMapping("/confirmSignOut")
	@ResponseBody
	public void confirmSignOut(HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		memberService.deleteMember(memberVO);
		session.removeAttribute("memberVO");
	}

	@PostMapping("/checkPwd")
	@ResponseBody
	public String checkPwd(HttpServletRequest request, HttpSession session) {

		String inputPwd = request.getParameter("inputPwd");
//		System.out.println("회원탈퇴시 입력받은 패스워드: " + inputPwd);

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberPwd = memberVO.getTranzPwd();
		
//		System.out.println(inputPwd.equals(memberPwd));

		if (inputPwd.equals(memberPwd)) {
			return "correct";
		} else {
			return "incorrect";
		}

	}

	@PostMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session) {

		session.removeAttribute("memberVO");
	}

	@RequestMapping("/signOut")
	public String signOut() {

		return "/myPage/signOut";
	}

//	@PostMapping("/login")
//	public ModelAndView loginProcess(MemberVO inputMemberVO, HttpSession session) {
//		
//		
//		MemberVO memberVO = memberService.checkLogin(inputMemberVO);
//		ModelAndView mav = new ModelAndView();
//		System.out.println("컨트롤러에서 멤버 받아오는지?"+memberVO);
//		
//		if (memberVO == null) {
//			mav.setViewName("redirect:/login");
//		} else {
////			System.out.println("로긴프로세스에서 로긴한애 " + memberVO);
//			session.setAttribute("memberVO", memberVO);
////			MemberVO m = (MemberVO)session.getAttribute("memberVO");
////			System.out.println("방금로긴한애" + m);
//			mav.setViewName("redirect:/hot");
//		}
//		
//		
//		// 로그인 인터셉터 쓸경우 주석 풀어줘야
////		else {
////			// 로그인 성공
//////			HttpSession session = request.getSession();
////				String dest = (String)session.getAttribute("dest");
////				System.out.println("멤버 컨트롤러에서 dest: " +dest);
////				if(dest == null) {
////					mav.setViewName("redirect:/hot");
////				} else {
////					
////					
////					mav.setViewName("redirect:" + dest);
////					session.removeAttribute(dest);
////					
////				}
////				mav.addObject("memberVO", memberVO);
////			}
//		// 여기까지 로그인 인터셉터
//		
//		
//		
////			System.out.println("세션에 등록하나?");
////			session.setAttribute("memberVO", memberVO);
////			return "redirect:/hot";
//		return mav;
//	}
	@PostMapping("/login")
	public String loginProcess(MemberVO inputMemberVO, HttpSession session) {

		
		MemberVO memberVO = memberService.checkLogin(inputMemberVO);
//		ModelAndView mav = new ModelAndView();
//		System.out.println("컨트롤러에서 멤버 받아오는지?"+memberVO);

		if (memberVO == null) {
			return "redirect:/login";
		} else {
//			System.out.println("로긴프로세스에서 로긴한애 " + memberVO);
			session.setAttribute("memberVO", memberVO);
//			MemberVO m = (MemberVO)session.getAttribute("memberVO");
//			System.out.println("방금로긴한애" + m);
			return "redirect:/hot";
		}
	}

	@GetMapping("/login")
	public String login() {
		return "/login/login";
	}

	@RequestMapping("/myPage")
	public String myPage() {
		return "/myPage/myPage";
	}

	@RequestMapping("/myInfo")
	public String myInfo() {
		return "/myPage/myInfo";
	}

	@RequestMapping("/myModify")
	public String myModify() {
		return "/myPage/myModify";
	}

	@PostMapping("/myModifyComplete")
	public String myModifyComplete(HttpSession session, HttpServletRequest request) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");

		MemberVO modMemberVO = new MemberVO();
		modMemberVO.setNickname(memberVO.getNickname());
		modMemberVO.setPhone(phone);
		modMemberVO.setAddress1(address1);
		modMemberVO.setAddress2(address2);

		memberService.updateMember(modMemberVO);

		modMemberVO = memberService.selectMember(memberVO);

//		session.removeAttribute("memberVO");
		session.setAttribute("memberVO", modMemberVO);

		return "redirect:/myInfo";
	}

	@RequestMapping("/signUp")
	public String subCover() {
//		System.out.println("거치나?");
		return "signUp/signUp";
	}

	@RequestMapping("/signUpForm")
	public String signUpForm() {
		return "signUp/signUpForm";
	}

	@PostMapping("/signUpSuccess")
	public String signUpSuccess(MemberVO memberVO, HttpSession session) {

		String tranzPwd = "0000t";
		memberVO.setTranzPwd(tranzPwd);

		memberService.insertMember(memberVO);
		memberService.insertNoticeSetting(memberVO);
		session.setAttribute("memberVO", memberVO);

		return "signUp/signUpSuccess";
	}

	@RequestMapping("/pwdSetting")
	public String pwdSetting() {
		return "signUp/pwdSetting";
	}

	@PostMapping("/pwdSettingSuccess")
	public String pwdSettingSuccess(@RequestParam("tranzPwd") String tranzPwd, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String nickname = memberVO.getNickname();

		Map<String, String> pwdMap = new HashMap<String, String>();
		pwdMap.put("nickname", nickname);
		pwdMap.put("tranzPwd", tranzPwd);
		memberService.registerPwd(pwdMap);

		memberVO.setTranzPwd(tranzPwd);
		session.removeAttribute("memberVO");
		session.setAttribute("memberVO", memberVO);

		return "signUp/pwdSettingSuccess";
	}

}
