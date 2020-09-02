package hafy.bid.service;

import java.util.List;

import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;

public interface BidService {
	
	void bidding(AAccountVO aAccountVO);
	void insertBidTranz(ATranzVO aTranzVO);
	List<ATranzVO> selectATranzByAucNo(int aucNo);
	List<AAccountVO> selectAAccount(int aucNo);

}
