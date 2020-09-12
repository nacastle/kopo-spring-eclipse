package hafy.bid.service;

import java.util.List;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;

public interface BidService {
	
	void bidding(AAccountVO aAccountVO);
	void insertBidTranz(ATranzVO aTranzVO);
	List<ATranzVO> selectATranzByAucNo(int aucNo);
	List<AAccountVO> selectAAccount(int aucNo);
	
	// 마감이전의 총입금액 아이디로 그룹바이해서 입찰랭킹 가져오기
	List<ATranzVO> selectBidResult(int aucNo);
	
}
