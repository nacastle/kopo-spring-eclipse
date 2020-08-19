package kr.co.mlec.method;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@RequestMapping("method/method.do")
@Controller
public class MethodController {

//	@RequestMapping(method = RequestMethod.GET)  //get방식이면 이 메소드를 호출
	@RequestMapping(value = "/method/method.do", method = RequestMethod.GET)  //get방식이면 이 메소드를 호출

	public String callGet() {  // spring은 ModelAndView 타입으로 꼭 리턴하지 않아도 상관없음 string도 가능
		return "method/methodForm";
	}
	
//	@RequestMapping(method = RequestMethod.POST) //post방식이면 이 메소드를 호출
	@RequestMapping(value = "/method/method.do", method = RequestMethod.POST) //post방식이면 이 메소드를 호출
	public String callPost() {  // spring은 ModelAndView 타입으로 꼭 리턴하지 않아도 상관없음 string도 가능
		return "method/methodProcess";
	}
	
//	public void callPost() {  // 이렇게 하면 @RequestMapping("method/method.do")의 uri로 알아서 이동함
//		
//	}

}
