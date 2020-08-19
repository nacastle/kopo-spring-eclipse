package kr.co.mlec.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping("/hello/hello.do")   // 저 uri가 들어왔을때 요청 수행하겠다는
	public ModelAndView hello() {
		ModelAndView mav = new ModelAndView("hello/hello");  //prefix 아래에 있는 jsp 폴더를 포워드하겠다는...(spring-mvc.xml)
		mav.addObject("msg", "hi 스프링 MVC~~");  // 객체 request공유영역에 올리기
		return mav;
	}

}
