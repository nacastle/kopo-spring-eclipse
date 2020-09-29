package hafy.aucGoods.dao;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.CodeVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.aucGoods.vo.ReturnGoodsVO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.NoticeVO;
import hafy.member.vo.MemberVO;

public interface AucGoodsDAO {
	
	void insertAucGoods(AucGoodsVO aucGoodsVO);
	int genAucNo();
	void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO);
	AucGoodsVO selectAucGoodsByNo(int aucNo);
	List<AucGoodsVO> selectAllAucContents();
	List<AucGoodsVO> selectHotAucContents();
	List<AucGoodsVO> selectRecentAucContents();
	List<AucGoodsVO> selectBidList(MemberVO memberVO);
	List<AucGoodsVO> selectDisplayList(MemberVO memberVO);
//	List<GoodsPhotoVO> selectPhotoListByAucNo(int aucNo);
	List<String> selectPhotoNameByAucNo(int aucNo);
	List<GoodsPhotoVO> selectPhotoListByAucNo(int aucNo);
	void incrementViewCnt(int aucNo);
	void incrementLikeCnt(int aucNo);
	void decrementLikeCnt(int aucNo);
	void insertLike(LikeVO likeVO);
	void deleteLike(LikeVO likeVO);
	LikeVO selectIsLike(LikeVO likeVO);
	List<CodeVO> selectGoodsCategory(String codeCategory);
	List<LikeVO> selectLikeList(MemberVO memberVO);
	List<AucGoodsVO> selectSpecificCategory(String category);
	CodeVO selectCodeVO(String category);
	List<AucGoodsVO> selectAucSearchWord(String searchWord);
	
	void updatePurchaseConfirm(Map<String, Object> updateMap);
	void updateRefundStatus(int aucNo);
	
	List<AucGoodsVO> selectHotAucContentsLazyLoad(Map<String, Object> loadInfo);
	List<AucGoodsVO> selectRecentAucContentsLazyLoad(Map<String, Object> loadInfo);
	
	int selectHotAucTotalCnt();
	
	int selectUnreadNotiCnt(String memberNick);
	
	List<NoticeVO> selectNotiList(String memberNick);
	void updateReadStatus(int notiNo);
	
	List<AucGoodsVO> selectImminentAucsByMin(int setMin);
	
	List<AucGoodsVO> selectOpenAucs();
	
	// 해당 경매가 회원이 설정한 마감임박 알림시간 기준으로 마감임박한 건인지 아닌지 판단하기위한 vo
	AucGoodsVO isImminentAucByMin(Map<String, Object> setMinMap);
	
	void updateNotiReadDatetime(String memberNick);
	
	List<NoticeVO> selectNotiContentsLazyLoad(Map<String, Object> loadInfo);
	
	List<AucGoodsVO> selectOnGoingAucContents(String memberNick);
	List<AucGoodsVO> selectDisplayClosedAucContents(String memberNick);
	List<AucGoodsVO> selectDisplayOnGoingAucContents(String memberNick);
	List<AucGoodsVO> selectWinAucContents(String memberNick);
	
	void insertReturnGoods(ReturnGoodsVO returnGoodsVO);
	void insertReturnPhoto(GoodsPhotoVO goodsPhotoVO);
	
	ReturnGoodsVO selectReturnGoodsByNo(int aucNo);
	
	List<GoodsPhotoVO> selectReturnPhotoListByAucNo(int aucNo);
	
	List<AucGoodsVO> selectDisplayPurchaseConfirmContents(String memberNick);
	List<AucGoodsVO> selectDisplayReturnGoodsContents(String memberNick);
	
	// 낙찰일로부터 confirmDay일 지난 경매건 리스트 구하기
	List<AucGoodsVO> selectNotPurchaseConfirmList(int confirmDay);
}
