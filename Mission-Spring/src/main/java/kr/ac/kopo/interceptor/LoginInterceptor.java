package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.member.vo.MemberVO;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		System.out.println("prehandle()...");
		
		
		// 어떤 컨트롤러 어떤 메소드가 동작했는지 확인하는 handler라는 것
//		HandlerMethod method = (HandlerMethod)handler;
//		System.out.println("메소드: " + method);
//		System.out.println("컨트롤러: " + method.getBean());
		
		// 로그인 여부 체크
		HttpSession session = request.getSession();
		
		
		// test할때는 항상 로그인 상태로 만들어주기
		MemberVO vo = new MemberVO();
		
		vo.setId("qwe");
		vo.setPassword("qwe");
		session.setAttribute("loginVO", vo);
		// 여기까지 해서 로그인 상태 만들어주는 법
		
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		
		if (loginVO == null) {
			
			String uri = request.getRequestURI();
			uri = uri.substring(request.getContextPath().length());
			
			String query = request.getQueryString();
			System.out.println(query);
			
			if(query != null && query.length() != 0) {
				uri = uri + "?" + query;
			}
			
			session.setAttribute("dest", uri);
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}

	
	
	
	

}
