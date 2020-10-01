package hafy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import hafy.member.vo.MemberVO;

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
		
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
//		System.out.println("로그인돼있는거?" +memberVO);
		// test할때는 항상 로그인 상태로 만들어주기
//		if (memberVO == null) {
//		MemberVO tempVO = new MemberVO("nacastle","나성주","920193","서울시","송파구","SKT","01042119382","1","1212q");
//		MemberVO tempVO = new MemberVO("apple","사과","910212","서울시","송파구","KT","01029371726","1","1231q");
//		MemberVO tempVO = new MemberVO("kiwi","키위","910212","서울시","송파구","KT","01029371726","1","1231q");
//		session.setAttribute("memberVO", tempVO);
//		}
		// 여기까지 해서 로그인 상태 만들어주는 법
		
		if (memberVO == null) {
			
			System.out.println("로그인인터셉터 거치긴 하지?");
			
			String uri = request.getRequestURI();
			System.out.println("request.getContextPath() " + request.getContextPath());
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