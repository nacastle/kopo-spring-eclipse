package hafy.bid.dao;

import java.util.List;

import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;

public interface BidDAO {
	
	void insertAAccountBid(AAccountVO aAccountVO); 
	void addBidMoney(AAccountVO aAccountVO); 
	void insertBidTranz(ATranzVO aTranzVO);
	void insertBidTranzNoBalance(ATranzVO aTranzVO);
	List<ATranzVO> selectATranzByAucNo(int aucNo);
	AAccountVO isBidding(AAccountVO aAccountVO);
	List<AAccountVO> selectAAccount(int aucNo);
	void updateWinningBid(AAccountVO aAccountVO);

}
