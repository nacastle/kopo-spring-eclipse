package hafy.bid.controller;

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
	
	
	@GetMapping("bidForm/{aucNo}")
	public String bidForm(@PathVariable("aucNo")int aucNo, HttpServletRequest request, HttpSession session) {
		
		AucGoodsVO aucGoodsVO = aucGoodsService.selectAucGoodsByNo(aucNo);
		request.setAttribute("aucGoodsVO", aucGoodsVO);
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		String memberNick = memberVO.getNickname();
		List<MAccountVO> mAccountList = mAccountService.selectMAccountList(memberNick);
		request.setAttribute("mAccountList", mAccountList);
		
		return "/bid/bidForm";
	}
	
	@PostMapping("/bidConfirm/{aucNo}")
	public String bidConfirm(@PathVariable("aucNo")int aucNo, HttpServletRequest request, HttpSession session) {
		
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
	public String pwd(@PathVariable("aucNo")int aucNo, HttpServletRequest request) {
		request.setAttribute("aucNo", aucNo);
		return "/bid/pwd";
	}
	
	@PostMapping("/bidSuccess/{aucNo}")
	public String bidSuccess(@PathVariable("aucNo")int aucNo, HttpServletRequest request, HttpSession session) {
		
		request.setAttribute("aucNo", aucNo);
		
		
		String mAccountNo = (String)session.getAttribute("bidAccountNo"); 
		int bidMoney = (Integer)session.getAttribute("bidMoney");
		
		Map<String, Object> bidInfo = new HashMap<String, Object>();
		bidInfo.put("mAccountNo", mAccountNo);
		bidInfo.put("bidMoney", bidMoney);
		
		mAccountService.bidMoney(bidInfo);
		
		request.setAttribute("bidMoney",bidMoney);
		session.removeAttribute("bidMoney");
		session.removeAttribute("bidAccountNo");
		
		
		
		
		return "/bid/bidSuccess";
	}

}
