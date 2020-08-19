package kr.co.mlec.form;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/form")
@Controller
public class MemberController {
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		
		return "form/joinForm";
	}
	
	
// 얘도 가능..
//	@RequestMapping("/joinForm.do")   
//	public void joinForm() {
//	}
	
	@RequestMapping("/join.do")
	public String join(@ModelAttribute("member")MemberVO memberVO) {  // 이름 임의 지정 가능하게끔 해주는 ModelAttribute
//	public String join(MemberVO memberVO) {  // 그냥 알아서 공유영역에 등록해줌... ㄷㄷ 대신 memberVO라고 앞에 소문자만 바뀌고 변수 인식해줘야함 
		
//		System.out.println("되나");
		
		return "form/memberInfo";
	}
	
	
	
	
	
//	@RequestMapping("/join.do")
//	public String join(HttpServletRequest request) {
	
//	public ModelAndView join(@RequestParam("id")String id, 
//			@RequestParam("password")String password, 
//			@RequestParam("name")String name, 
//			HttpServletRequest request) {
	
//	public ModelAndView join(MemberVO member) {   // VO 객체로 파라미터를 가져오면 알아서 공유영역에서 가져옴
		
//		MemberVO member = new MemberVO();
//		member.setId(id);
//		member.setPassword(password);
//		member.setName(name);
		
//		System.out.println(member);
		
//		request.setAttribute("member", member);
		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("form/memberInfo");
//		mav.addObject("member",member);
		
//		return mav;
//		return "form/memberInfo";
//	}
	
	

}
