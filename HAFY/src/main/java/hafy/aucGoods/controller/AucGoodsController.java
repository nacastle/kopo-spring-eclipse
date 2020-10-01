package hafy.aucGoods.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
import hafy.aucGoods.vo.ReturnGoodsVO;
import hafy.bid.service.BidService;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.bid.vo.NoticeVO;
import hafy.mAccount.service.MAccountService;
import hafy.mAccount.vo.MAccountVO;
import hafy.member.service.MemberService;
import hafy.member.vo.MemberVO;
import hafy.member.vo.NoticeSettingVO;

@Controller
public class AucGoodsController {

	@Autowired
	private AucGoodsService aucGoodsService;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private BidService bidService;
	@Autowired
	private MAccountService mAccountService;
	@Autowired
	private MemberService memberService;
//	@Autowired
//	private MemberService memberService;

	@ResponseBody
	@GetMapping("/loadHotAucs/{hotScrollCnt}/{loadCnt}")
	public ModelAndView loadHotAucs(@PathVariable("hotScrollCnt") int scrollCnt, @PathVariable("loadCnt") int loadCnt) {

		Map<String, AucGoodsVO> hotAucMap = new LinkedHashMap<String, AucGoodsVO>();

		Map<String, Object> loadInfo = new HashMap<String, Object>();
		loadInfo.put("scrollCnt", scrollCnt);
		loadInfo.put("loadCnt", loadCnt);

		hotAucMap = aucGoodsService.selectHotAucLazyLoad(loadInfo);

//		Map<String, AucGoodsVO> recentAucMap = new LinkedHashMap<String, AucGoodsVO>();
//		recentAucMap = aucGoodsService.selectRecentAuc();

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);

//		LocalDateTime now = LocalDateTime.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/home/beforeLoadHot");
		String contents = null;
		if (hotAucMap.size() == 0) {
			contents = "empty";
		} else {
			contents = "notEmpty";
			mav.addObject("hotScrollCnt", scrollCnt - 1);
			mav.addObject("hotAucMap", hotAucMap);
		}

		mav.addObject("contents", contents);
//		System.out.println(contents);
		mav.addObject("nowTime", nowTime);
//		request.setAttribute("nowTime", nowTime);
//
//		request.setAttribute("hotAucMap", hotAucMap);
//		request.setAttribute("recentAucMap", recentAucMap);
		return mav;
	}

	@ResponseBody
	@GetMapping("/loadNotice/{notiScrollCnt}/{loadCnt}")
	public ModelAndView loadNotice(HttpSession session, @PathVariable("notiScrollCnt") int scrollCnt,
			@PathVariable("loadCnt") int loadCnt) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		Map<NoticeVO, String> noticeMap = new LinkedHashMap<NoticeVO, String>();

		Map<String, Object> loadInfo = new HashMap<String, Object>();
		loadInfo.put("scrollCnt", scrollCnt);
		loadInfo.put("loadCnt", loadCnt);
		loadInfo.put("memberNick", memberNick);

		noticeMap = aucGoodsService.selectNoticeLazyLoad(loadInfo);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/beforeLoadNotice");
		mav.addObject("noticeMap", noticeMap);
		return mav;
	}

	@ResponseBody
	@GetMapping("/loadRecentAucs/{recentScrollCnt}/{loadCnt}")
	public ModelAndView loadRecentAucs(@PathVariable("recentScrollCnt") int scrollCnt,
			@PathVariable("loadCnt") int loadCnt) {

		Map<String, AucGoodsVO> recentAucMap = new LinkedHashMap<String, AucGoodsVO>();

		Map<String, Object> loadInfo = new HashMap<String, Object>();
		loadInfo.put("scrollCnt", scrollCnt);
		loadInfo.put("loadCnt", loadCnt);

		recentAucMap = aucGoodsService.selectRecentAucLazyLoad(loadInfo);

//		Map<String, AucGoodsVO> recentAucMap = new LinkedHashMap<String, AucGoodsVO>();
//		recentAucMap = aucGoodsService.selectRecentAuc();

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/home/beforeLoadRecent");
		mav.addObject("recentAucMap", recentAucMap);
		mav.addObject("nowTime", nowTime);
//		request.setAttribute("nowTime", nowTime);
//
//		request.setAttribute("hotAucMap", hotAucMap);
//		request.setAttribute("recentAucMap", recentAucMap);
		return mav;
	}

	@Transactional
	@ResponseBody
	@PostMapping("/confirmPurchase")
	public void confirmPurchase(HttpServletRequest request, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		int aucNo = Integer.parseInt(request.getParameter("aucNo"));
		System.out.println("컨트롤러에서 확인한 다음 경매번호는 ? " + aucNo);

		String sellerNick = request.getParameter("sellerNick");
		List<MAccountVO> sellerAccountList = mAccountService.selectMAccountList(sellerNick);
		String sellerAccount = sellerAccountList.get(0).getAccountNo(); // 판매자의 계좌
		int winBidMoney = Integer.parseInt(request.getParameter("winBidMoney"));
		String winner = memberVO.getNickname(); // 낙찰자

		Map<String, Object> transferMap = new HashMap<String, Object>();
		transferMap.put("aucNo", aucNo);
		transferMap.put("sellerNick", sellerNick);
		transferMap.put("sellerAccount", sellerAccount);
		transferMap.put("winBidMoney", winBidMoney * 0.9); // 수수료 10퍼를 뗀 금액이 출품자에게 입금된다.
		transferMap.put("winner", winner);

		System.out.println("송금할 낙찰액");
		System.out.println(winBidMoney * 0.9);
		System.out.println(winBidMoney * 0.9);

//		System.out.println(aucNo);

		Map<String, Object> updateMap = new HashMap<String, Object>();

		String content = "확정";
		updateMap.put("aucNo", aucNo);
		updateMap.put("content", content);
		aucGoodsService.updatePurchaseConfirm(updateMap);

		aucGoodsService.transferBidMoneySeller(transferMap);

		// 매입확정 정보 알림 테이블에 넣기
		NoticeSettingVO noticeSettingVO = memberService.selectNoticeSettingVOByNick(sellerNick);
		String sellerPurchaseConfirmNotice = noticeSettingVO.getSellerPurchaseConfirmNotice();

		if (sellerPurchaseConfirmNotice.equals("true")) {
			AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
			String notiMsg = winner + " 님이 '" + aucGoodsVO.getName() + "' 경매" + "(번호: " + aucNo + ") 매입을 확정하였습니다.";
			NoticeVO noticeVO = new NoticeVO(sellerNick, "goodsDetail", aucNo, notiMsg);
			bidService.insertNoti(noticeVO);

			request.removeAttribute("aucNo");
		}

	}

	@Transactional
	@ResponseBody
	@GetMapping("/approveReturn/{aucNo}/{winner}")
	public void approveReturn(@PathVariable("aucNo") int aucNo, @PathVariable("winner") String winner) {

		Map<String, Object> updateMap = new HashMap<String, Object>();

		String content = "환불완료";
		updateMap.put("aucNo", aucNo);
		updateMap.put("content", content);
		aucGoodsService.updatePurchaseConfirm(updateMap);

		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		List<MAccountVO> mAccountList = mAccountService.selectMAccountList(winner);
		//// 환불하기
		// aAccountVO : 모임계좌에서 돈빠져나기기
		// depositInfo : 낙찰자 돈 도로 채우기, map형태
		// aTranzVO : 입출금내역 남기기
		AAccountVO aAccountVO = new AAccountVO(aucNo, winner, aucGoodsVO.getWinningBid());

		Map<String, Object> depositInfo = new HashMap<String, Object>();
		depositInfo.put("winBidMoney", aucGoodsVO.getWinningBid());
		depositInfo.put("mAccountNo", mAccountList.get(0).getAccountNo());

		ATranzVO aTranzVO = new ATranzVO(aucNo, mAccountList.get(0).getAccountNo(), -aucGoodsVO.getWinningBid(), winner,
				"출금");

		bidService.returnBidMoney(aAccountVO, depositInfo, aTranzVO);

		// 낙찰자에게 환불완료 알림 남기기
		// 알림 테이블에 데이터 삽입
		String notiType = "goodsDetail";
		String notiMsg = "요청하신 '" + aucGoodsVO.getName() + "' 경매" + "(번호: " + aucNo + ")의 환불이 완료되었습니다.";
		NoticeVO noticeVO = new NoticeVO(winner, notiType, aucNo, notiMsg);
		bidService.insertNoti(noticeVO);
	}

	@ResponseBody
	@GetMapping("/aucSearch/{searchWord}")
//	public Map<String, AucGoodsVO> doAucSearch(@PathVariable("searchWord") String searchWord) {
	public ModelAndView doAucSearch(@PathVariable("searchWord") String searchWord) {

		System.out.println(searchWord);

		ModelAndView mav = new ModelAndView();
		Map<String, AucGoodsVO> aucSearchMap = new LinkedHashMap<String, AucGoodsVO>();
		aucSearchMap = aucGoodsService.selectAucSearchWord(searchWord);

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
//		System.out.println("After : " + nowTime);

		mav.setViewName("search/searchResult");
		mav.addObject("nowTime", nowTime);
		mav.addObject("aucSearchMap", aucSearchMap);

		return mav;
	}

	@GetMapping("/aucSearch")
	public String aucSearchForm() {
		return "/search/aucSearch";
	}

	@GetMapping("/returnForm/{aucNo}")
	public String returnForm(@PathVariable("aucNo") int aucNo, Model model) {
		model.addAttribute("aucNo", aucNo);

		return "/myPage/returnForm";
	}

	@GetMapping("/confirmPurchaseForm")
	public String confirmPurchase(Model model, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		Map<String, AucGoodsVO> winAucMap = new LinkedHashMap<String, AucGoodsVO>();
		winAucMap = aucGoodsService.selectWinBidMap(memberNick);

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		model.addAttribute("nowTime", nowTime);
		model.addAttribute("winAucMap", winAucMap);

		return "/myPage/confirmPurchaseForm";
	}

	@ResponseBody
	@GetMapping("/loadReturnAuc")
	public ModelAndView loadReturnAuc(HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 매입확정 내역 불러오기
		Map<String, AucGoodsVO> returnGoodsMap = new LinkedHashMap<String, AucGoodsVO>();
		returnGoodsMap = aucGoodsService.selectReturnGoodsMap(memberNick);

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/myPage/beforeLoadReturnGoods");
		mav.addObject("nowTime", nowTime);
		mav.addObject("returnGoodsMap", returnGoodsMap);

		return mav;
	}

	@ResponseBody
	@GetMapping("/loadDisplayReturnAuc")
	public ModelAndView loadDisplayReturnAuc(HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 출품내역중 매입확정 내역 불러오기
		Map<String, AucGoodsVO> returnGoodsMap = new LinkedHashMap<String, AucGoodsVO>();
		returnGoodsMap = aucGoodsService.selectDisplayReturnGoodsMap(memberNick);

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/myPage/beforeLoadDisplayReturnGoods");
		mav.addObject("nowTime", nowTime);
		mav.addObject("returnGoodsMap", returnGoodsMap);

		return mav;
	}

	@ResponseBody
	@GetMapping("/loadDisplayConfirmAuc")
	public ModelAndView loadDisplayConfirmAuc(HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 출품내역중 매입확정 내역 불러오기
		Map<String, AucGoodsVO> purchaseConfirmMap = new LinkedHashMap<String, AucGoodsVO>();
		purchaseConfirmMap = aucGoodsService.selectDisplayPurchaseConfirmMap(memberNick);

		for (String key : purchaseConfirmMap.keySet()) {
			AucGoodsVO value = purchaseConfirmMap.get(key);
			System.out.println("key: " + key + "value: " + value);

		}

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/myPage/beforeLoadDisplayConfirmAuc");
		mav.addObject("nowTime", nowTime);
		mav.addObject("purchaseConfirmMap", purchaseConfirmMap);

		return mav;
	}

	@ResponseBody
	@GetMapping("/loadConfirmAuc")
	public ModelAndView loadConfirmAuc(HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 매입확정 내역 불러오기
		Map<String, AucGoodsVO> purchaseConfirmMap = new LinkedHashMap<String, AucGoodsVO>();
		purchaseConfirmMap = aucGoodsService.selectPurchaseConfirmMap(memberNick);

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/myPage/beforeLoadConfirmAuc");
		mav.addObject("nowTime", nowTime);
		mav.addObject("purchaseConfirmMap", purchaseConfirmMap);

		return mav;
	}

	@GetMapping("/displayClosed")
	public String displayClosed(Model model, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 낙찰내역 불러오기
		Map<String, AucGoodsVO> displayClosedAucMap = new LinkedHashMap<String, AucGoodsVO>();
		displayClosedAucMap = aucGoodsService.selectDisplayClosedAuc(memberNick);

		// 매입확정 내역 불러오기
//		Map<String, AucGoodsVO> purchaseConfirmMap = new LinkedHashMap<String, AucGoodsVO>();
//		purchaseConfirmMap = aucGoodsService.selectPurchaseConfirmMap(memberNick);

		// 환불요청 내역 불러오기

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);

		model.addAttribute("nowTime", nowTime);
		model.addAttribute("displayClosedAucMap", displayClosedAucMap);
//		model.addAttribute("purchaseConfirmMap", purchaseConfirmMap);

		return "/myPage/displayClosed";
	}

	@GetMapping("/bidWin")
	public String bidWin(Model model, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		// 낙찰내역 불러오기
		Map<String, AucGoodsVO> winAucMap = new LinkedHashMap<String, AucGoodsVO>();
		winAucMap = aucGoodsService.selectWinBidMap(memberNick);

		// 매입확정 내역 불러오기
//		Map<String, AucGoodsVO> purchaseConfirmMap = new LinkedHashMap<String, AucGoodsVO>();
//		purchaseConfirmMap = aucGoodsService.selectPurchaseConfirmMap(memberNick);

		// 환불요청 내역 불러오기

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
//		System.out.println("After : " + nowTime);

		model.addAttribute("nowTime", nowTime);
		model.addAttribute("winAucMap", winAucMap);
//		model.addAttribute("purchaseConfirmMap", purchaseConfirmMap);

		return "/myPage/bidWin";
	}

	@GetMapping("/likeAuction")
	public String likeAuction(Model model, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		Map<String, AucGoodsVO> likeMap = new LinkedHashMap<String, AucGoodsVO>();
		likeMap = aucGoodsService.selectLikeMap(memberVO);

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
//		System.out.println("After : " + nowTime);

		model.addAttribute("nowTime", nowTime);
		model.addAttribute("likeMap", likeMap);

		return "/myPage/likeAuction";
	}

	@Transactional
	@GetMapping("/myAuction")
	public String myAuction(Model model, HttpSession session, HttpServletRequest request) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		// 사용자가 입찰한 목록 가져오기 (첫째 사진 파일 이름과 함께)
		Map<String, AucGoodsVO> bidMap = new LinkedHashMap<String, AucGoodsVO>();
		bidMap = aucGoodsService.selectBidMap(memberVO);

		// 사용자가 출품한 목록 가져오기 (첫째 사진 파일 이름과 함께)
		Map<String, AucGoodsVO> displayMap = new LinkedHashMap<String, AucGoodsVO>();
		displayMap = aucGoodsService.selectDisplayMap(memberVO);

		model.addAttribute("bidMap", bidMap);
		model.addAttribute("displayMap", displayMap);

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
		// 오늘 타임스탬프(데이트포맷으로 저장했다고 치고 그걸 타임스탬프로 바꿔보는 작업)
//		System.out.println("After : " + nowTime);
		request.setAttribute("nowTime", nowTime);

//		System.out.println("hot에서 멤버"+memberVO);

		int unreadNotiCnt = 0;
		String memberNick = memberVO.getNickname();
//		System.out.println("memberNick" + memberNick);
		unreadNotiCnt = aucGoodsService.selectUnreadNotiCnt(memberNick);

		request.setAttribute("unreadNotiCnt", unreadNotiCnt);

		return "/myAuction/myAuction";
	}

	@GetMapping("/goodsCategory")
	public String goodsCategory(Model model, HttpSession session) {
		List<CodeVO> goodsCategory = aucGoodsService.selectGoodsCategory("gc");
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
//		System.out.println("hot에서 멤버"+memberVO);

		int unreadNotiCnt = 0;
		String memberNick = memberVO.getNickname();
//		System.out.println("memberNick" + memberNick);
		unreadNotiCnt = aucGoodsService.selectUnreadNotiCnt(memberNick);

		model.addAttribute("unreadNotiCnt", unreadNotiCnt);
		model.addAttribute("goodsCategory", goodsCategory);

		return "/category/goodsCategory";
	}

//	@GetMapping("displayDetail/{aucNo}")
//	public String displayDetail(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {
//
//		Map<AucGoodsVO, List<GoodsPhotoVO>> aucMap = aucGoodsService.selectAucByNo(aucNo);
//		request.setAttribute("aucMap", aucMap);
//
//		// 로그인한 멤버 닉네임 가져오기
//		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
//		String memberNick = memberVO.getNickname();
//
//		// 좋아요 한 상품인지 확인
//		LikeVO likeVO = new LikeVO(memberNick, aucNo);
//		LikeVO isLikeVO = aucGoodsService.selectIsLike(likeVO);
//		boolean isLike = false;
//		if (isLikeVO != null) {
//			isLike = true;
//		}
//
//		
//		// 최고 입찰가 구하기
//		// 입찰 기록이 없는 경우 시작가를 최고입찰액으로 설정
//		// 시작가 구하기
//		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
//		int startPrice = aucGoodsVO.getStartPrice();
//
//		// 경매 랭크결과 정보 가져오기(이거로 최고입찰자 정보 추출가능)
//		List<ATranzVO> bidResult = new ArrayList<ATranzVO>();
//		bidResult = bidService.selectBidResult(aucNo);
//		
//		int highestBid = startPrice;
//		if (bidResult != null) {
//			highestBid = bidResult.get(0).getMemberBalance();
//			
//		}
//
//		// 최고 입찰가 구하기 (사장된 버젼)
//		// 입찰 기록이 없는 경우 시작가를 최고입찰액으로 설정
////		//// 입찰목록 불러오기
////		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
////		bidderList = bidService.selectAAccount(aucNo);
////		// 시작가 구하기
////		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
////		int startPrice = aucGoodsVO.getStartPrice();
////
////		int highestBid = 0;
////		if (bidderList.isEmpty()) {
////			highestBid = startPrice;
//////			System.out.println("시작가가 최고입찰가: " + highestBid);
////		} else {
////			// 입찰 인원수 구하기
////			request.setAttribute("bidderCnt", bidderList.size());
////
////			highestBid = bidderList.get(0).getBidMoney();
////			for (int i = 1; i < bidderList.size(); i++) {
////				if (bidderList.get(i).getBidMoney() >= highestBid) {
////
////					highestBid = bidderList.get(i).getBidMoney();
////				}
////			}
//////			System.out.println("쌓아둔게 최고입찰가: " + highestBid);
////		}
//
//		LocalDateTime now = LocalDateTime.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		String nowTime = now.format(formatter);
////		System.out.println("After : " + nowTime);
//		request.setAttribute("nowTime", nowTime);
//
//		request.setAttribute("highestBid", highestBid);
//		request.setAttribute("isLike", isLike);
//
//		return "/display/displayDetail";
//	}

	@Transactional
	@GetMapping("returnDetail/{aucNo}")
	public String returnDetail(@PathVariable("aucNo") int aucNo, HttpServletRequest request) {

		// 로그인한 멤버 닉네임 가져오기
//		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
//		String memberNick = memberVO.getNickname();
		Map<ReturnGoodsVO, List<GoodsPhotoVO>> returnMap = aucGoodsService.selectReturnDetailByNo(aucNo);
		for (ReturnGoodsVO key : returnMap.keySet()) {
			List<GoodsPhotoVO> value = returnMap.get(key);
			System.out.println("key: " + key + "value: " + value);
		}

		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);

		request.setAttribute("aucGoodsVO", aucGoodsVO);
		request.setAttribute("returnMap", returnMap);

		// 로그인한 사용자가 해당 경매를 입찰했는지 안했는지

		return "/myPage/returnDetail";
	}

	@Transactional
	@GetMapping("goodsDetail/{aucNo}")
	public String goodsDetail(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {

		// 로그인한 멤버 닉네임 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		Map<AucGoodsVO, List<GoodsPhotoVO>> aucMap = aucGoodsService.selectAucByNo(aucNo, memberNick);
		request.setAttribute("aucMap", aucMap);

		// 좋아요 한 상품인지 확인
		LikeVO likeVO = new LikeVO(memberNick, aucNo);
		LikeVO isLikeVO = aucGoodsService.selectIsLike(likeVO);
		boolean isLike = false;
		if (isLikeVO != null) {
			isLike = true;
		}

		// 로그인한 사용자가 해당 경매를 입찰했는지 안했는지
		AAccountVO checkBidVO = new AAccountVO();
		checkBidVO.setAucNo(aucNo);
		checkBidVO.setBidderNick(memberNick);
		AAccountVO isBidVO = bidService.isBidding(checkBidVO);
		boolean isBid = false;
		if (isBidVO != null) {
			isBid = true;
		}

		// 입찰자 수 카운트 해주기
		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidService.selectAAccount(aucNo);

		//// 시작 n분전 계산
		// 데이트포맷
		String startLeftTime = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
		// 오늘 타임스탬프(데이트포맷으로 저장했다고 치고 그걸 타임스탬프로 바꿔보는 작업)
		long nowTimestamp = 0;
		try {
			nowTimestamp = sdf.parse(nowTime).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 시작일시 구하기 (타임스탬프도)
		for (AucGoodsVO auc : aucMap.keySet()) {

			// 시작일시 구하기 (타임스탬프도)
			String startTime = auc.getStartDate();
			System.out.println("컨트롤러에서 startTime" + startTime);
			long startTimestamp = 0;
			try {
				startTimestamp = sdf.parse(startTime).getTime();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 현재일시 - 시작일시의 타임스탬프 구하기
			long startDifference = (startTimestamp - nowTimestamp);

			if (startDifference > 0) {
				// 남은 시간 수
				long startHourLeft = startDifference / (60 * 60 * 1000);

				if (startHourLeft > 23) {
					long startDayLeft = startDifference / (24 * 60 * 60 * 1000);
					startLeftTime = String.valueOf(startDayLeft) + "일 전";
					System.out.println("남은 일 수: " + auc.getDetail());
				} else if (startHourLeft > 0 && startHourLeft < 24) {

					startLeftTime = String.valueOf(startHourLeft) + "시간 전";
				} else if (startHourLeft == 0) {
					long minLeft = startDifference / (60 * 1000);
					startLeftTime = String.valueOf(minLeft) + "분 전";

				} else {
					startLeftTime = "조건문 잘못 설정";
				}

				System.out.println("startLeftTime: " + startLeftTime);
			}

		}

//		LocalDateTime now = LocalDateTime.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);
		request.setAttribute("nowTime", nowTime);

//		request.setAttribute("highestBid", highestBid);
		request.setAttribute("bidderCnt", bidderList.size());
		request.setAttribute("startLeftTime", startLeftTime);
		request.setAttribute("isLike", isLike);
		request.setAttribute("isBid", isBid);

		return "/detail/goodsDetail";
	}

	@Transactional
	@RequestMapping("/goodsCategory/{category}")
	public String specificCategory(@PathVariable("category") String category, HttpServletRequest request) {

		Map<String, AucGoodsVO> specCategoryMap = new LinkedHashMap<String, AucGoodsVO>();
		specCategoryMap = aucGoodsService.selectSpecificCategory(category);

		// uriname(category)으로 카테고리이름 가져오기
		CodeVO codeVO = aucGoodsService.selectCodeVO(category);
		String categoryName = codeVO.getCodeName();

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
//		System.out.println("After : " + nowTime);

		request.setAttribute("nowTime", nowTime);
		request.setAttribute("specCategoryMap", specCategoryMap);
		request.setAttribute("categoryName", categoryName);

		return "/category/specificCategory";
	}

//	@RequestMapping("/goodsCategory/recommend")
//	public String categoryRecommend(HttpServletRequest request) {
//		
//		Map<String, AucGoodsVO> aucMap = new LinkedHashMap<String, AucGoodsVO>();
//		aucMap = aucGoodsService.selectAllAuc();
//		request.setAttribute("aucMap", aucMap);
//		
//		return "/category/recommend";
//	}
	@RequestMapping("/goodsCategory/recent")
	public String categoryRecommend(HttpServletRequest request) {

		Map<String, AucGoodsVO> recentAucMap = new LinkedHashMap<String, AucGoodsVO>();
		recentAucMap = aucGoodsService.selectRecentAuc();

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
//		System.out.println("After : " + nowTime);

		request.setAttribute("nowTime", nowTime);
		request.setAttribute("recentAucMap", recentAucMap);

		return "/category/recent";
	}

	@RequestMapping("/goodsCategory/hot")
	public String categoryHot(HttpServletRequest request) {

		Map<String, AucGoodsVO> hotAucMap = new LinkedHashMap<String, AucGoodsVO>();
		hotAucMap = aucGoodsService.selectHotAuc();

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);
//		System.out.println("After : " + nowTime);

		request.setAttribute("nowTime", nowTime);
		request.setAttribute("aucMap", hotAucMap);

		return "/category/hot";
	}

	@Transactional
	@RequestMapping("/hot")
	public String mainHot(HttpServletRequest request, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
//		System.out.println("hot에서 멤버"+memberVO);

		int unreadNotiCnt = 0;
		String memberNick = memberVO.getNickname();
//		System.out.println("memberNick" + memberNick);
		unreadNotiCnt = aucGoodsService.selectUnreadNotiCnt(memberNick);

//		Map<String, AucGoodsVO> hotAucMap = new LinkedHashMap<String, AucGoodsVO>();
//		hotAucMap = aucGoodsService.selectHotAuc();
//
//		Map<String, AucGoodsVO> recentAucMap = new LinkedHashMap<String, AucGoodsVO>();
//		recentAucMap = aucGoodsService.selectRecentAuc();

//		int hotTotalCnt = aucGoodsService.selectHotAucTotalCnt();

		// 데이트포맷
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
//		// 한국기준 날짜
//		Calendar calendar = Calendar.getInstance();
//		Date date = new Date(calendar.getTimeInMillis());
//		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
//		String nowTime = sdf.format(date);

//		LocalDateTime now = LocalDateTime.now();
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		String nowTime = now.format(formatter);
//		System.out.println("After : " + nowTime);
//		request.setAttribute("nowTime", nowTime);

		request.setAttribute("unreadNotiCnt", unreadNotiCnt);
//		request.setAttribute("hotTotalCnt", hotTotalCnt);
//		request.setAttribute("hotAucMap", hotAucMap);
//		request.setAttribute("recentAucMap", recentAucMap);

		return "/home/hot";
	}

	@GetMapping("/displayOnGoing")
	public String displayOnGoing(HttpSession session, HttpServletRequest request) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		Map<String, AucGoodsVO> onGoingAucMap = new LinkedHashMap<String, AucGoodsVO>();
		onGoingAucMap = aucGoodsService.selectDisplayOnGoingAuc(memberNick);

		// 데이트포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);

		request.setAttribute("nowTime", nowTime);
		request.setAttribute("onGoingAucMap", onGoingAucMap);

		return "/myPage/displayOnGoing";

	}

	@GetMapping("/bidOnGoing")
	public String bidOnGoing(HttpSession session, HttpServletRequest request) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		Map<String, AucGoodsVO> onGoingAucMap = new LinkedHashMap<String, AucGoodsVO>();
		onGoingAucMap = aucGoodsService.selectOnGoingAuc(memberNick);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		// 한국기준 날짜
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(calendar.getTimeInMillis());
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		String nowTime = sdf.format(date);

		request.setAttribute("nowTime", nowTime);
		request.setAttribute("onGoingAucMap", onGoingAucMap);

		return "/myPage/bidOnGoing";

	}

	@RequestMapping("/noticeContent")
	public String noticeContent(Model model, HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		// 로긴한 사용자의 알림 리스트 가져오기
		Map<NoticeVO, String> noticeMap = aucGoodsService.selectNotiMap(memberVO.getNickname());

//		for (NoticeVO key : noticeMap.keySet()) {
//			String value = noticeMap.get(key);
//			System.out.println("key: " + key + "value: " + value);
//		}

		model.addAttribute("noticeMap", noticeMap);

		return "/notice/noticeContent";
	}

	@ResponseBody
	@RequestMapping("/readAllNotice")
	public void readAllNotice(HttpSession session) {

		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		System.out.println("읽을사람: " + memberNick);
		aucGoodsService.updateNotiReadDatetime(memberNick);
	}

	@ResponseBody
	@RequestMapping("/readNotice/{notiNo}")
	public void readNotice(@PathVariable("notiNo") int notiNo) {
		aucGoodsService.updateReadStatus(notiNo);
	}

	@RequestMapping("/displayForm")
	public String displayForm(Model model) {

		List<CodeVO> goodsCategory = aucGoodsService.selectGoodsCategory("gc");
		model.addAttribute("goodsCategory", goodsCategory);
		return "/display/displayForm";
	}

	@Transactional
	@PostMapping("/returnRequest")
	public String returnRequest(ReturnGoodsVO returnGoodsVO, MultipartHttpServletRequest mRequest, HttpSession session,
			Model model) throws Exception {

		// 환불하는사람 닉네임 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();

		int aucNo = returnGoodsVO.getAucNo();

		returnGoodsVO.setWriter(memberNick);

		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");

		System.out.println(uploadDir);

//		model.addAttribute("returnGoodsVO", returnGoodsVO);
		aucGoodsService.insertReturnGoods(returnGoodsVO);

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

				aucGoodsService.insertReturnPhoto(goodsPhotoVO);
			}
		}

		Map<String, Object> updateMap = new HashMap<String, Object>();

		String content = "환불요청중";
		updateMap.put("aucNo", aucNo);
		updateMap.put("content", content);

		aucGoodsService.updatePurchaseConfirm(updateMap);

		// 출품자에게 환불요청 알림 남기기
		// 알림 테이블에 데이터 삽입
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		String notiType = "returnDetail";
		String notiMsg = "'" + aucGoodsVO.getName() + "' 경매" + "(번호: " + aucNo + ")의 환불요청이 접수되었습니다.";
		NoticeVO noticeVO = new NoticeVO(aucGoodsVO.getMemberNick(), notiType, aucNo, notiMsg);
		bidService.insertNoti(noticeVO);

		return "redirect:/bidWin/";
	}

//	@Transactional
//	@RequestMapping("/displayLoading")
//	public String displayLoading(AucGoodsVO aucGoodsVO, MultipartHttpServletRequest mRequest, HttpSession session,
//			Model model) throws Exception {
//		
//		// 출품자 닉네임 가져오기
//		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
//		String memberNick = memberVO.getNickname();
//		
//		// 경매번호 생성
//		int aucNo = aucGoodsService.genAucNo();
//		
//		// 등록일시 생성
//		LocalDateTime regDate = LocalDateTime.now();
//		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		String formatDateTime = regDate.format(formatter2);
//		System.out.println("등록일시 : " + formatDateTime);
//		
//		// date 정제
//		String startDate = aucGoodsVO.getStartDate();
//		String fStartDate = startDate.substring(0, 10);
//		String bStartDate = startDate.substring(11);
//		String rStartDate = fStartDate + " " + bStartDate;
//		
//		String endDate = aucGoodsVO.getEndDate();
//		String fEndDate = endDate.substring(0, 10);
//		String bEndDate = endDate.substring(11);
//		String rEndDate = fEndDate + " " + bEndDate;
//		
//		// 상품내용 VO에 설정
//		aucGoodsVO.setRegDate(formatDateTime);
//		aucGoodsVO.setMemberNick(memberNick);
//		aucGoodsVO.setNo(aucNo);
//		aucGoodsVO.setStartDate(rStartDate);
//		aucGoodsVO.setEndDate(rEndDate);
//		
//		// 실행되는 웹어플리케이션의 실제 경로 가져오기
//		String uploadDir = servletContext.getRealPath("/upload/");
//		
//		System.out.println(uploadDir);
//		
//		model.addAttribute("aucGoodsVO", aucGoodsVO);
//		aucGoodsService.insertAucGoods(aucGoodsVO);
//		
//		Iterator<String> iter = mRequest.getFileNames();
//		while (iter.hasNext()) {
//			
//			String formFileName = iter.next();
//			// 폼에서 파일을 선택하지 않아도 객체 생성됨
//			MultipartFile mFile = mRequest.getFile(formFileName);
//			
//			// 원본 파일명
//			String oriFileName = mFile.getOriginalFilename();
//			System.out.println("원본 파일명 : " + oriFileName);
//			
//			if (oriFileName != null && !oriFileName.equals("")) {
//				
//				// 확장자 처리
//				String ext = "";
//				// 뒤쪽에 있는 . 의 위치
//				int index = oriFileName.lastIndexOf(".");
//				if (index != -1) {
//					// 파일명에서 확장자명(.포함)을 추출
//					ext = oriFileName.substring(index);
//				}
//				
//				// 파일 사이즈
//				long fileSize = mFile.getSize();
//				System.out.println("파일 사이즈 : " + fileSize);
//				
//				// 고유한 파일명 만들기
//				String saveFileName = "hafy-" + UUID.randomUUID().toString() + ext;
//				System.out.println("저장할 파일명 : " + saveFileName);
//				
//				// 임시저장된 파일을 원하는 경로에 저장
//				mFile.transferTo(new File(uploadDir + saveFileName));
//				
//				GoodsPhotoVO goodsPhotoVO = new GoodsPhotoVO(oriFileName, saveFileName, fileSize, aucNo);
////				photoList.add(photoVO);
//				
//				aucGoodsService.insertGoodsPhoto(goodsPhotoVO);
//			}
//		}
//		
//		return "redirect:/displaySuccess/" + aucNo;
////		return "/display/displayLoading"; // 로딩.jsp로 안가고 바로 displaysuccess로 가게끔 redirect 해줫음
//	}
	@Transactional
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

		List<MultipartFile> fileList = mRequest.getFiles("photos");
//	        String src = mRequest.getParameter("src");
//	        System.out.println("src value : " + src);

//	        String path = "C:\\image\\";

		for (MultipartFile mFile : fileList) {
			String oriFileName = mFile.getOriginalFilename(); // 원본 파일 명
//	        	System.out.println("다음 오리파일은?" + oriFileName);

			if (oriFileName != null && !oriFileName.equals("") && !oriFileName.equals("delete")) {

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
//					photoList.add(photoVO);

				aucGoodsService.insertGoodsPhoto(goodsPhotoVO);
			}

		}

		return "redirect:/displaySuccess/" + aucNo;
//		return "/display/displayLoading"; // 로딩.jsp로 안가고 바로 displaysuccess로 가게끔 redirect 해줫음
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
