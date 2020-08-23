package kr.co.mlec.body;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mlec.form.MemberVO;

@RequestMapping("/ajax")
@Controller
public class ResBodyController {
	
	
	@ResponseBody
	@RequestMapping("/resVOListBody.json")
	public List<MemberVO> resJsonVOListBody() {
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		for (int i = 1; i < 4; i++) {
			MemberVO vo = new MemberVO();
			vo.setId("hong");
			vo.setName("홍길동");
			vo.setPassword("1234");
			list.add(vo);
		}
		
		return list;
	}
	@ResponseBody
	@RequestMapping("/resStringListBody.json")
	public List<String> resJsonStringListBody() {
		
		List<String> list = new ArrayList<String>();
		
		for (int i = 1; i < 4; i++) {
			list.add(String.valueOf(i));
			
		}
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/resVOBody.json")
	public MemberVO resJsonVOBody() {
		
		MemberVO vo = new MemberVO();
		
		vo.setId("hong");
		vo.setName("홍길동");
		vo.setPassword("1234");
		
		return vo;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("/resBody.json")
	public Map<String, String> resJsonBody() {
		
		Map<String,String> result = new HashMap<String, String>();
		result.put("id", "hong");
		result.put("name", "홍길동");
		result.put("addr", "서울");
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/resBody.do")
	public String resStringBody() {
		return "OK, 성공";
	}
	
	
	
	
	

}
