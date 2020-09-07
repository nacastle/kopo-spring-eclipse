package hafy.aucGoods.controller;

import java.io.File;
import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import hafy.aucGoods.service.AucGoodsService;
import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.CodeVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.bid.service.BidService;
import hafy.bid.vo.AAccountVO;
import hafy.member.vo.MemberVO;

@Controller
public class AucGoodsController {

	@Autowired
	private AucGoodsService aucGoodsService;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private BidService bidService;

	
	@ResponseBody
	@GetMapping("/aucSearch/{searchWord}")
	public Map<String, AucGoodsVO>  doAucSearch(@PathVariable("searchWord")String searchWord) {
		
		System.out.println(searchWord);
		
		Map<String, AucGoodsVO> aucSearchMap = new LinkedHashMap<String, AucGoodsVO>();
		aucSearchMap = aucGoodsService.selectAucSearchWord(searchWord);
		
		return aucSearchMap;
	}
	
	@GetMapping("/aucSearch")
	public String aucSearchForm() {
		return "/search/aucSearch";
	}
	
	@GetMapping("/likeAuction")
	public String likeAuction(Model model, HttpSession session) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
		Map<String, AucGoodsVO> likeMap = new LinkedHashMap<String, AucGoodsVO>();
		likeMap = aucGoodsService.selectLikeMap(memberVO);
		
		model.addAttribute("likeMap", likeMap);
		
		return "/myPage/likeAuction";
	}
	
	@GetMapping("/myAuction")
	public String myAuction(Model model, HttpSession session) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
		// 사용자가 입찰한 목록 가져오기 (첫째 사진 파일 이름과 함께)
		Map<String, AucGoodsVO> bidMap = new LinkedHashMap<String, AucGoodsVO>(); 
		bidMap = aucGoodsService.selectBidMap(memberVO);
		
		// 사용자가 출품한 목록 가져오기 (첫째 사진 파일 이름과 함께)
		Map<String, AucGoodsVO> displayMap = new LinkedHashMap<String, AucGoodsVO>(); 
		displayMap = aucGoodsService.selectDisplayMap(memberVO);
		
		model.addAttribute("bidMap", bidMap);
		model.addAttribute("displayMap", displayMap);
		
		return "/myAuction/myAuction";
	}
	
	@GetMapping("/goodsCategory")
	public String goodsCategory(Model model) {
		List<CodeVO> goodsCategory = aucGoodsService.selectGoodsCategory("gc");

		model.addAttribute("goodsCategory", goodsCategory);

		return "/category/goodsCategory";
	}

	@GetMapping("goodsDetail/{aucNo}")
	public String goodsDetail(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {

		Map<AucGoodsVO, List<GoodsPhotoVO>> aucMap = aucGoodsService.selectAucByNo(aucNo);
		request.setAttribute("aucMap", aucMap);

		// 로그인한 멤버 닉네임 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 좋아요 한 상품인지 확인
		LikeVO likeVO = new LikeVO(memberNick, aucNo);
		LikeVO isLikeVO = aucGoodsService.selectIsLike(likeVO);
		boolean isLike = false;
		if (isLikeVO != null) {
			isLike = true;
		}

		// 최고 입찰가 구하기
		// 입찰 기록이 없는 경우 시작가를 최고입찰액으로 설정
		//// 입찰목록 불러오기
		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidService.selectAAccount(aucNo);
		// 시작가 구하기
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		int startPrice = aucGoodsVO.getStartPrice();

		int highestBid = 0;
		if (bidderList.isEmpty()) {
			highestBid = startPrice;
//			System.out.println("시작가가 최고입찰가: " + highestBid);
		} else {
			// 입찰 인원수 구하기
			request.setAttribute("bidderCnt", bidderList.size());

			highestBid = bidderList.get(0).getBidMoney();
			for (int i = 1; i < bidderList.size(); i++) {
				if (bidderList.get(i).getBidMoney() >= highestBid) {

					highestBid = bidderList.get(i).getBidMoney();
				}
			}
//			System.out.println("쌓아둔게 최고입찰가: " + highestBid);
		}

		request.setAttribute("highestBid", highestBid);
		request.setAttribute("isLike", isLike);

		return "/detail/goodsDetail";
	}

	@RequestMapping("/goodsCategory/{category}")
	public String specificCategory(@PathVariable("category")String category, HttpServletRequest request) {
		
		Map<String, AucGoodsVO> specCategoryMap = new LinkedHashMap<String, AucGoodsVO>(); 
		specCategoryMap = aucGoodsService.selectSpecificCategory(category);
		
		// uriname(category)으로 카테고리이름 가져오기
		CodeVO codeVO = aucGoodsService.selectCodeVO(category);
		String categoryName = codeVO.getCodeName();
		
		request.setAttribute("specCategoryMap", specCategoryMap);
		request.setAttribute("categoryName", categoryName);
		
		return "/category/specificCategory";
	}
	
	@RequestMapping("/goodsCategory/recommend")
	public String categoryRecommend(HttpServletRequest request) {
		
		Map<String, AucGoodsVO> aucMap = new LinkedHashMap<String, AucGoodsVO>(); 
		aucMap = aucGoodsService.selectAllAuc();
		request.setAttribute("aucMap", aucMap);
		
		return "/category/recommend";
	}
	
	@RequestMapping("/goodsCategory/hot")
	public String categoryHot(HttpServletRequest request) {
		
		Map<String, AucGoodsVO> aucMap = new LinkedHashMap<String, AucGoodsVO>(); 
		aucMap = aucGoodsService.selectAllAuc();
		request.setAttribute("aucMap", aucMap);
		
		return "/category/hot";
	}
	
	@RequestMapping("/hot")
	public String mainHot(HttpServletRequest request) {

		Map<String, AucGoodsVO> aucMap = new LinkedHashMap<String, AucGoodsVO>(); 
		aucMap = aucGoodsService.selectAllAuc();
		request.setAttribute("aucMap", aucMap);

		return "/home/hot";
	}

	@RequestMapping("/displayForm")
	public String displayForm(Model model) {

		List<CodeVO> goodsCategory = aucGoodsService.selectGoodsCategory("gc");
		model.addAttribute("goodsCategory", goodsCategory);
		return "/display/displayForm";
	}

	@RequestMapping("/displayLoading")
	public String displayLoading(AucGoodsVO aucGoodsVO, MultipartHttpServletRequest mRequest, HttpSession session,
			Model model) throws Exception {

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
		String rStartDate = fStartDate + " " + bStartDate;

		String endDate = aucGoodsVO.getEndDate();
		String fEndDate = endDate.substring(0, 10);
		String bEndDate = endDate.substring(11);
		String rEndDate = fEndDate + " " + bEndDate;

		// 상품내용 VO에 설정
		aucGoodsVO.setRegDate(formatDateTime);
		aucGoodsVO.setMemberNick(memberNick);
		aucGoodsVO.setNo(aucNo);
		aucGoodsVO.setStartDate(rStartDate);
		aucGoodsVO.setEndDate(rEndDate);

		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");

		System.out.println(uploadDir);

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

		return "/display/displayLoading";
	}

	@RequestMapping("/displaySuccess/{no}")
	public String displaySuccess(@PathVariable("no") int aucNo, Model model) throws Exception {
//		System.out.println("경매번호: " + aucNo);
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);

//		System.out.println(aucGoodsVO);
		model.addAttribute("aucGoodsVO", aucGoodsVO);

		return "/display/displaySuccess";
	}

}
