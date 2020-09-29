package hafy.bid.controller;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hafy.aucGoods.service.AucGoodsService;
import hafy.aucGoods.vo.AucGoodsVO;
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
public class BidController {

	@Autowired
	private AucGoodsService aucGoodsService;
	@Autowired
	private MAccountService mAccountService;
	@Autowired
	private BidService bidService;
	@Autowired
	private MemberService memberService;

	/**
	 * 1. 경매가 마감된건들에 대하여 2. 낙찰액을 제외한 입찰액들을 3. 본래 입찰자 계좌로 환급 (사용자들은 적어도 한 계좌 이상이 어플에
	 * 등록돼있어야) / 경매모임통장에 입출금 내역 남기고 / 해당 경매모임통장에서 돈 빠져나가고
	 */
	@Scheduled(cron = "10 * * * * *")
	public void refundBidMoney() {
		// 현재시간 가져오기
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
		
		System.out.println("매분 10초에 환급 알고리즘 도는중..." + " (현재시각:" + nowTime +")");
		// 마감된 경매 환급
		bidService.refundBidMoney();
	}

	// 스케쥴러로 알림메세지 보내기
	@Scheduled(cron = "0 * * * * *")
	public void noticeWithScheduler() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
		System.out.println("매분 0초에 경매마감/경매마감임박 알림 알고리즘 도는중..." + " (현재시각:" + nowTime +")");
		// 마감임박한 경매 알림 (bidders)
		bidService.noticeImminentAucs();

		// 마감된 경매 알림 (seller, bidders(winner, losers))
		bidService.noticeClosedBid();
	}

	@Scheduled(cron = "0 * * * * *")
	public void autoPurchaseConfirm() {
		
		int confirmDay = 2;
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);
		System.out.println("매분 0초에 자동 매입확정 알고리즘 도는중..." + " (현재시각:" + nowTime +")");

		// 자동 매입확정 알고리즘 (낙찰액 전달 / 출품자에게 알림메세지) (낙찰된지 confirmDay일 지난  건들에 대해 매입확정 알고리즘)
		bidService.autoPurchaseConfirm(confirmDay);
	}
	

	@ResponseBody
	@GetMapping("/loadBidHistory/{historyScrollCnt}/{loadCnt}/{aucNo}")
	public ModelAndView loadBidHistory(@PathVariable("historyScrollCnt") int historyScrollCnt,
			@PathVariable("loadCnt") int loadCnt, @PathVariable("aucNo") int aucNo) {

		ModelAndView mav = new ModelAndView();

		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		if (aucGoodsVO.getWinningBid() != 0) {

			Map<String, Object> loadInfo = new HashMap<String, Object>();
			loadInfo.put("scrollCnt", historyScrollCnt);
			loadInfo.put("loadCnt", loadCnt);
			loadInfo.put("aucNo", aucNo);

			// 특정 경매의 입출금 탭 정보 구하기
			List<ATranzVO> aTranzList = new ArrayList<ATranzVO>();
			aTranzList = bidService.selectATranzLazyLoadByAucNo(loadInfo);

			mav.addObject("aTranzList", aTranzList);
		}
		mav.setViewName("/aAccount/beforeLoadBidHistory");

		return mav;
	}

	@GetMapping("/bidHistory/{aucNo}")
	public String bidHistory(@PathVariable("aucNo") int aucNo, HttpServletRequest request) {

		// 특정경매의 마감시간 가져오려고 vo 구하기
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);

		if (aucGoodsVO.getWinningBid() != 0) {

			// 특정 경매의 입출금 탭 정보 구하기
			List<ATranzVO> aTranzList = new ArrayList<ATranzVO>();
			aTranzList = bidService.selectATranzByAucNo(aucNo);

			// 특정 경매의 모임통장 정보 가져오기 (경매자, 입찰액) / 경매참여자 탭에서 필요한 정도
			List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
			bidderList = bidService.selectAAccount(aucNo);

			// 경매 랭크결과 정보 가져오기(이거로 경매결과탭, 최고입찰자 정보 추출가능)
			List<ATranzVO> bidResult = new ArrayList<ATranzVO>();
			bidResult = bidService.selectBidResult(aucNo);

			request.setAttribute("aTranzList", aTranzList);
			request.setAttribute("bidderList", bidderList);
			request.setAttribute("bidResult", bidResult);

		}

		// 현재시간 가져오기
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String nowTime = now.format(formatter);

		request.setAttribute("nowTime", nowTime);
		request.setAttribute("aucGoodsVO", aucGoodsVO);

		return "/aAccount/bidHistory";
	}

	@GetMapping("bidForm/{aucNo}")
	public String bidForm(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {

		// 상품 정보 불러오기
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		request.setAttribute("aucGoodsVO", aucGoodsVO);

		// 회원 계좌 목록 불러오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();
		List<MAccountVO> mAccountList = mAccountService.selectMAccountList(memberNick);

		// 현 로그인한 회원이 여태 입찰한 금액 불러오기
		double pastBidMoney = 0;

		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidService.selectAAccount(aucNo);

		if (bidderList != null) {
			for (AAccountVO a : bidderList) {
				if (a.getBidderNick().equals(memberNick)) {
					pastBidMoney = a.getBidMoney();
					break;
				}
			}
		}

		// 최고 입찰가 구하기
		// 입찰 기록이 없는 경우 시작가를 최고입찰액으로 설정
		//// 입찰목록 불러오기
//		System.out.println(bidderList);
		//// 시작가
		int startPrice = aucGoodsVO.getStartPrice();

		double highestBid = 0;
		if (bidderList.isEmpty()) {
			highestBid = startPrice;
//			System.out.println("시작가가 최고입찰가: " + highestBid);
		} else {
			highestBid = bidderList.get(0).getBidMoney();
			for (int i = 1; i < bidderList.size(); i++) {
				if (bidderList.get(i).getBidMoney() >= highestBid) {

					highestBid = bidderList.get(i).getBidMoney();
				}
			}
//			System.out.println("쌓아둔게 최고입찰가: " + highestBid);
		}

//		System.out.println("과거 입찰액: " + pastBidMoney);
		request.setAttribute("pastBidMoney", pastBidMoney);
		request.setAttribute("mAccountList", mAccountList);
		request.setAttribute("highestBid", highestBid);

		return "/bid/bidForm";
	}

	@PostMapping("/bidConfirm/{aucNo}")
	public String bidConfirm(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {

		int bidMoney = Integer.parseInt(request.getParameter("bidMoney"));

		// 입찰할 계좌 정보 가져와서 은행 / 계좌번호 나누기
		String bidAccount = request.getParameter("bidAccount");
		String[] strList = bidAccount.split(" | ");
		String bidBank = strList[0];
		String bidAccountNo = strList[2];

		session.setAttribute("bidMoney", bidMoney); // 입찰액은 계속 쓸거라 일단 세션에 넣어줌
		request.setAttribute("bidBank", bidBank);
		session.setAttribute("bidAccountNo", bidAccountNo);
		request.setAttribute("aucNo", aucNo);

		return "/bid/bidConfirm";
	}

	@GetMapping("/pwd/{aucNo}")
	public String pwd(@PathVariable("aucNo") int aucNo, HttpServletRequest request) {
		request.setAttribute("aucNo", aucNo);
		return "/bid/pwd";
	}

	@Transactional
	@PostMapping("/bidSuccess/{aucNo}")
	public String bidSuccess(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {

		// 경매번호 계속 전달해주기
		request.setAttribute("aucNo", aucNo);

		// 입찰자 정보 얻어오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		// 입찰자 송금 패스워드 얻어오기
		String memberTranzPwd = memberVO.getTranzPwd();
		// 입찰자가 입력한 패스워드 얻어오기
		String inputTranzPwd = request.getParameter("tranzPwd");

		if (!memberTranzPwd.trim().equals(inputTranzPwd.trim())) {

			session.setAttribute("msg", "비밀번호가 틀렸습니다.");

			return "redirect:/pwd/" + aucNo;
		}

		// 입찰정보 얻어오기
		String mAccountNo = (String) session.getAttribute("bidAccountNo");
		int bidMoney = (Integer) session.getAttribute("bidMoney");

		// 회원 닉네임 받아오기
		String bidderNick = memberVO.getNickname();

		// 경매모임계좌에 거래내역(입찰,환급) 추가하기
		ATranzVO aTranzVO = new ATranzVO();
		aTranzVO.setAucNo(aucNo);
		aTranzVO.setTranzAccountNo(mAccountNo);
		aTranzVO.setTranzMemberNick(bidderNick);
		aTranzVO.setTranzMoney(bidMoney);
		aTranzVO.setTranzType("입금");

		bidService.insertBidTranz(aTranzVO);

		AAccountVO aAccountVO = new AAccountVO(aucNo, bidderNick, bidMoney);

		AAccountVO isBidVO = bidService.isBidding(aAccountVO);
		double withdrawMoney = bidMoney;
		if (isBidVO != null) {
			withdrawMoney = bidMoney - isBidVO.getBidMoney();
		}
		System.out.println("출금금액: " + withdrawMoney);

		Map<String, Object> bidInfo = new HashMap<String, Object>();
		bidInfo.put("mAccountNo", mAccountNo);
		bidInfo.put("bidMoney", withdrawMoney);

		mAccountService.bidMoney(bidInfo);

		// 경매모임계좌(hf_a_account) 입찰자 명단에 입찰자, 입찰액 추가하기 (처음 입찰 case / 두번째 이상 입찰 case 나뉨)
		bidService.bidding(aAccountVO);

		// 알림 테이블에 데이터 삽입
		//// 판매자에게 입찰자의 입찰 알림
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		NoticeSettingVO sellerNoticeSettingVO = memberService.selectNoticeSettingVOByNick(aucGoodsVO.getMemberNick());
		String sellerBidNotice = sellerNoticeSettingVO.getSellerBidNotice();

		DecimalFormat Commas = new DecimalFormat("#,###");
		String rfBidMoney = (String) Commas.format(bidMoney);

		if (sellerBidNotice.equals("true")) {

			String notiType = "bidHistory";
			String notiSellerMsg = bidderNick + " 님이 '" + aucGoodsVO.getName() + "' 경매" + "(번호: " + aucNo + ")에 "
					+ rfBidMoney + " 원으로 입찰하셨습니다.";

			NoticeVO noticeVO = new NoticeVO(aucGoodsVO.getMemberNick(), notiType, aucNo, notiSellerMsg);
			bidService.insertNoti(noticeVO);
		}

		//// 다른 입찰자들에게 입찰 알림
		List<AAccountVO> aacList = bidService.selectAAccount(aucNo);
		String notiBidderMsg = "";
		for (AAccountVO a : aacList) {
			NoticeSettingVO bidderNoticeSettingVO = memberService.selectNoticeSettingVOByNick(a.getBidderNick());
			String bidderBidNotice = bidderNoticeSettingVO.getBidderBidNotice();

			if (bidderBidNotice.equals("true")) {

				if (bidderNick.equals(a.getBidderNick())) {
					notiBidderMsg = "회원님이 '" + aucGoodsVO.getName() + "' 경매" + "(번호: " + aucNo + ")에 " + rfBidMoney
							+ " 원으로 최고입찰자가 되었습니다.";
				} else {
					notiBidderMsg = bidderNick + " 님이 '" + aucGoodsVO.getName() + "' 경매" + "(번호: " + aucNo + ")에 "
							+ rfBidMoney + " 원으로 최고입찰자가 되었습니다.";
				}
				NoticeVO noVo = new NoticeVO(a.getBidderNick(), "bidHistory", aucNo, notiBidderMsg);
				bidService.insertNoti(noVo);
			}
		}
		request.setAttribute("bidMoney", bidMoney);
		session.removeAttribute("bidMoney");
		session.removeAttribute("bidAccountNo");

		return "/bid/bidSuccess";
	}

}
