package hafy.bid.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.bid.vo.NoticeVO;

public interface BidService {
	
	void bidding(AAccountVO aAccountVO);
	void insertBidTranz(ATranzVO aTranzVO);
	List<ATranzVO> selectATranzByAucNo(int aucNo);
	List<AAccountVO> selectAAccount(int aucNo);
	
	// 마감이전의 총입금액 아이디로 그룹바이해서 입찰랭킹 가져오기
	List<ATranzVO> selectBidResult(int aucNo);
	
	// 마감후 낙찰제외 돈 환급
	void refundBidMoney();
	
	// 사용자가 특정 경매 입찰중인지 아닌지
	AAccountVO isBidding(AAccountVO aAccountVO);
	
	List<ATranzVO> selectATranzLazyLoadByAucNo(Map<String, Object> loadInfo);
	
	void insertNoti(NoticeVO noticeVO);
	void noticeClosedBid();
	void noticeImminentAucs();
	
	// confirmDay 기준으로 낙찰된 날 이후 confrimDay만큼 지나면 알아서 매입확정하기
	void autoPurchaseConfirm(int confirmDay);
	
	void returnBidMoney(AAccountVO aAccountVO,Map<String,Object> depositInfo,ATranzVO aTranzVO);
	
}
