package hafy.cover;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CoverController {
	
	@RequestMapping("/cover")
	public String mainCover() { 
//		System.out.println("cover 컨트롤러 거치기");
		return "cover/cover";
	}
	
//	@RequestMapping("/signUp")
//	public String subCover() { 
//		return "signUp/signUp";
//	}
	
//	@PostMapping("/board/write")
//	public String write(@Valid BoardVO boardVO, BindingResult result) {  // @Valid : 게시글 등록폼 유효성 검사 (제목, 내용에 작성안된부분이 있는지)
//		
////		System.out.println(boardVO);
//		System.out.println("또 호츌?");
////		System.out.println("result: " + result.hasErrors());
//		if (result.hasErrors()) {
//			System.out.println("오류발생...");
//			
//			return "board/write";
//			
//		}
//		
//		return "redirect:/board";
//	}

}
