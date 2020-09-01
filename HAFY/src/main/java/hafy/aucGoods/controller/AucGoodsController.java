package hafy.aucGoods.controller;

import java.io.File;
import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import hafy.aucGoods.service.AucGoodsService;
import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.member.vo.MemberVO;

@Controller
public class AucGoodsController {

	@Autowired
	private AucGoodsService aucGoodsService;
	@Autowired
	private ServletContext servletContext;
	
	
	
	@GetMapping("goodsDetail/{aucNo}")
	public String  goodsDetail(@PathVariable("aucNo")int aucNo, HttpServletRequest request, HttpSession session) {
		
		Map<AucGoodsVO, List<GoodsPhotoVO>> aucMap = aucGoodsService.selectAucByNo(aucNo);
		request.setAttribute("aucMap", aucMap);
		
		// 로그인한 멤버 닉네임 가져오기
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();
		
		// 좋아요 한 상품인지 확인
		LikeVO likeVO = new LikeVO(memberNick, aucNo);
		LikeVO isLikeVO = aucGoodsService.selectIsLike(likeVO);
		boolean isLike = false;
		if (isLikeVO != null) {
			isLike = true;
		}
		request.setAttribute("isLike", isLike);
		
//		for (AucGoodsVO key : aucMap.keySet()) {
//			List<GoodsPhotoVO> photoList = aucMap.get(key);
//			for(GoodsPhotoVO g : photoList) {
//				System.out.println("key: " + key + "g: " + g);
//			}
//		}
	
		return "/detail/goodsDetail";
	}

	@RequestMapping("/hot")
	public String mainHot(HttpServletRequest request) {
		
		
//		List<AucGoodsVO> aucList = aucGoodsService.selectAllAuc();
//		List<GoodsPhotoVO> photoList = aucGoodsService.selectAllA();
		
		Map<String, AucGoodsVO> aucMap = aucGoodsService.selectAllAuc();
		
//		for (String key : aucMap.keySet()) {
//			AucGoodsVO vo = aucMap.get(key);
//			System.out.println("key: "+key + ", vo: " + vo);
//		}
		
//		ModelAndView mav = new ModelAndView("/home/hot");
		request.setAttribute("aucMap", aucMap);
//		request.setAttribute("list", list);
//		mav.addObject("aucList", aucList);

		return "/home/hot";
	}

	@RequestMapping("/displayForm")
	public String displayForm() {

		return "/display/displayForm";
	}

	@RequestMapping("/displayLoading")
	public String displayLoading(AucGoodsVO aucGoodsVO, MultipartHttpServletRequest mRequest, HttpSession session, Model model)
			throws Exception {
		
		// 출품자 닉네임 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();
		
		// 경매번호 생성
		int aucNo = aucGoodsService.genAucNo();
		
		// 등록일시 생성
		LocalDateTime regDate = LocalDateTime.now();
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formatDateTime = regDate.format(formatter2);
		System.out.println("등록일시 : " + formatDateTime);
		
		// date 정제
		String startDate = aucGoodsVO.getStartDate();
		String fStartDate = startDate.substring(0, 10);
		String bStartDate = startDate.substring(11);
		String rStartDate = fStartDate + " "+ bStartDate;
		
		String endDate = aucGoodsVO.getEndDate();
		String fEndDate = endDate.substring(0, 10);
		String bEndDate = endDate.substring(11);
		String rEndDate = fEndDate + " "+ bEndDate;
		
		
		// 상품내용 VO에 설정
		aucGoodsVO.setRegDate( formatDateTime);
		aucGoodsVO.setMemberNick(memberNick);
		aucGoodsVO.setNo(aucNo);
		aucGoodsVO.setStartDate(rStartDate);
		aucGoodsVO.setEndDate(rEndDate);
		
//		System.out.println("경매번호: "+aucNo);
		
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");
//		String uploadDir = servletContext.getRealPath("/upload/");
		
		System.out.println(uploadDir);
		
//				ModelAndView mav = new ModelAndView("file/uploadResult");
//				String id = mRequest.getParameter("id");
//				System.out.println("id : " + id);
		
//		List<GoodsPhotoVO> photoList = new ArrayList<GoodsPhotoVO>();
		
		model.addAttribute("aucGoodsVO", aucGoodsVO);
		aucGoodsService.insertAucGoods(aucGoodsVO);
		
		Iterator<String> iter = mRequest.getFileNames();
		while (iter.hasNext()) {
			
			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);
			
			if (oriFileName != null && !oriFileName.equals("")) {
				
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				
				// 파일 사이즈
				long fileSize = mFile.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				// 고유한 파일명 만들기
				String saveFileName = "hafy-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);
				
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
				
				GoodsPhotoVO goodsPhotoVO = new GoodsPhotoVO(oriFileName, saveFileName, fileSize, aucNo);
//				photoList.add(photoVO);
				
				aucGoodsService.insertGoodsPhoto(goodsPhotoVO);
			}
		}
		
		
		
		
//		for (GoodsPhotoVO item : photoList) {
//			System.out.println(item);
//		}
		
		
		return "/display/displayLoading";
	}
	
	@RequestMapping("/displaySuccess/{no}")
	public String displaySuccess(@PathVariable("no")int aucNo, Model model)
			throws Exception {
		System.out.println("경매번호: " + aucNo);
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		
		System.out.println(aucGoodsVO);
		model.addAttribute("aucGoodsVO", aucGoodsVO);
		

		return "/display/displaySuccess";
	}

}
