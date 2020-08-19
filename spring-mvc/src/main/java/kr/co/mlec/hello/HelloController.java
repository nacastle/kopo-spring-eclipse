package kr.co.mlec.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping("/hello/hello.do")   // �� uri�� �������� ��û �����ϰڴٴ�
	public ModelAndView hello() {
		ModelAndView mav = new ModelAndView("hello/hello");  //prefix �Ʒ��� �ִ� jsp ������ �������ϰڴٴ�...(spring-mvc.xml)
		mav.addObject("msg", "hi ������ MVC~~");  // ��ü request���������� �ø���
		return mav;
	}

}
