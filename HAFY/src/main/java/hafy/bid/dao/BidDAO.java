package hafy.bid.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.bid.vo.NoticeVO;

public interface BidDAO {
	
	void insertAAccountBid(AAccountVO aAccountVO); 
	void addBidMoney(AAccountVO aAccountVO); 
	void insertBidTranz(ATranzVO aTranzVO);
	void insertBidTranzNoBalance(ATranzVO aTranzVO);
	List<ATranzVO> selectATranzByAucNo(int aucNo);
	AAccountVO isBidding(AAccountVO aAccountVO);
	List<AAccountVO> selectAAccount(int aucNo);
	void updateWinningBid(AAccountVO aAccountVO);
	
	// 마감이전의 총입금액 아이디로 그룹바이해서 입찰랭킹 가져오기
	List<ATranzVO> selectBidResult(int aucNo);
	
//	사용자가 입찰한 경매 중 마감된 경매 번호 최신마감일자 순으로 구하기 
	List<Integer> selectMemberClosedAuc(String memberNick);

//	사용자가 입찰한 경매 중 마감된 경매 번호 최신확정일자 순으로 구하기 
	List<Integer> selectMemberClosedAucOBConfirmDate(String memberNick);
	List<Integer> selectMemberClosedAucOBReturnRequestDate(String memberNick);
	
	// 경매모임통장에서 출금된 돈만큼 빠져나가기 (AAccount 업데이트)
	void withdrawAAccount(AAccountVO aAccselectBidResultountVO);
	
	// 마감된 경매 중 환급이 안된 경매번호 리스트 구하기
	List<Integer> selectNotRefundAucList();
	
	List<ATranzVO> selectATranzLazyLoadByAucNo(Map<String, Object> loadInfo);
	
	void insertNoti(NoticeVO noticeVO);

}
