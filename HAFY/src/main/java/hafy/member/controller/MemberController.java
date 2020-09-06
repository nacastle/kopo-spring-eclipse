package hafy.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hafy.member.service.MemberService;
import hafy.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

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
		System.out.println("회원탈퇴시 입력받은 패스워드: " + inputPwd);

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberPwd = memberVO.getTranzPwd();
		
		System.out.println(inputPwd.equals(memberPwd));

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

	@RequestMapping("/loginProcess")
	public String loginProcess(MemberVO inputMemberVO, HttpSession session) {

		MemberVO memberVO = memberService.checkLogin(inputMemberVO);

		if (memberVO == null) {
			return "redirect:/login";
		} else {
			session.setAttribute("memberVO", memberVO);
			return "redirect:/hot";
		}
	}

	@RequestMapping("/login")
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

//		System.out.println(modMemberVO);

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

//	@PostMapping("/reply")
//	public void addReply(ReplyVO replyVO) {
//		System.out.println("/reply controller 호출...");
//		System.out.println(replyVO);
//		replyService.insertReply(replyVO);  // 댓글 삽입과 동시에 t_board의 reply_cnt 1증가 (serviceImpl보면 앎)

//	}

	@PostMapping("/signUpSuccess")
	public String signUpSuccess(MemberVO memberVO, HttpSession session) {

		String tranzPwd = "0000t";
		memberVO.setTranzPwd(tranzPwd);

//		System.out.println(memberVO);

		memberService.insertMember(memberVO);
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
//		System.out.println("닉넴:"+nickname +", 비번: " + tranzPwd);

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
