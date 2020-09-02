package hafy.bid.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import hafy.aucGoods.dao.AucGoodsDAO;
import hafy.aucGoods.service.AucGoodsService;
import hafy.aucGoods.vo.AucGoodsVO;
import hafy.bid.service.BidService;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.mAccount.dao.MAccountDAO;
import hafy.mAccount.service.MAccountService;
import hafy.mAccount.vo.MAccountVO;
import hafy.member.vo.MemberVO;

@Controller
public class BidController {

	@Autowired
	private AucGoodsService aucGoodsService;
	@Autowired
	private MAccountService mAccountService;
	@Autowired
	private BidService bidService;

	@GetMapping("/bidHistory/{aucNo}")
	public String bidHistory(@PathVariable("aucNo") int aucNo, HttpServletRequest request) {

		// 특정 경매의 입출금 내역 구하기
		List<ATranzVO> aTranzList = bidService.selectATranzByAucNo(aucNo);
		request.setAttribute("aTranzList", aTranzList);

		// 특정 경매의 모임통장 정보 가져오기 (경매자, 입찰액)
		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidService.selectAAccount(aucNo);

		// 최고 입찰가 구하기
		int highestBid = bidderList.get(0).getBidMoney();
		for (int i = 1; i < bidderList.size(); i++) {
//			System.out.println("다음 입찰액은? " + bidderList.get(i).getBidMoney());
			if (bidderList.get(i).getBidMoney() >= highestBid) {

				highestBid = bidderList.get(i).getBidMoney();
			}
		}

//		System.out.println("최고입찰가:"+highestBid);

		request.setAttribute("highestBid", highestBid);

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
		request.setAttribute("mAccountList", mAccountList);

		// 최고 입찰가 구하기
		// 입찰 기록이 없는 경우 시작가를 최고입찰액으로 설정
		//// 입찰목록 불러오기
		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidService.selectAAccount(aucNo);
		System.out.println(bidderList);
		//// 시작가
		int startPrice = aucGoodsVO.getStartPrice();

		int highestBid = 0;
		if (bidderList.isEmpty()) {
			highestBid = startPrice;
			System.out.println("시작가가 최고입찰가: " + highestBid);
		} else {
			highestBid = bidderList.get(0).getBidMoney();
			for (int i = 1; i < bidderList.size(); i++) {
				if (bidderList.get(i).getBidMoney() >= highestBid) {

					highestBid = bidderList.get(i).getBidMoney();
				}
			}
			System.out.println("쌓아둔게 최고입찰가: " + highestBid);
		}
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

	@PostMapping("/bidSuccess/{aucNo}")
	public String bidSuccess(@PathVariable("aucNo") int aucNo, HttpServletRequest request, HttpSession session) {

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

		// 경매모임계좌에 거래내역(입찰,반환) 추가하기
		ATranzVO aTranzVO = new ATranzVO();
		aTranzVO.setAucNo(aucNo);
		aTranzVO.setTranzAccountNo(mAccountNo);
		aTranzVO.setTranzMemberNick(bidderNick);
		aTranzVO.setTranzMoney(bidMoney);
		aTranzVO.setTranzType("입금");

		bidService.insertBidTranz(aTranzVO);

		// 경매모임계좌(hf_a_account) 입찰자 명단에 입찰자, 입찰액 추가하기 (처음 입찰 case + 두번째 이상 입찰 case)
		AAccountVO aAccountVO = new AAccountVO(aucNo, bidderNick, bidMoney);
		bidService.bidding(aAccountVO);

		Map<String, Object> bidInfo = new HashMap<String, Object>();
		bidInfo.put("mAccountNo", mAccountNo);
		bidInfo.put("bidMoney", bidMoney);

		// 입찰해서 회원 계좌에서 돈 출금되기
		mAccountService.bidMoney(bidInfo);

		request.setAttribute("bidMoney", bidMoney);
		session.removeAttribute("bidMoney");
		session.removeAttribute("bidAccountNo");

		return "/bid/bidSuccess";
	}

}
