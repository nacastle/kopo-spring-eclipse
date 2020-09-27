package hafy.aucGoods.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.CodeVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.aucGoods.vo.ReturnGoodsVO;
import hafy.bid.vo.NoticeVO;
import hafy.member.vo.MemberVO;

public interface AucGoodsService {
	
	void insertAucGoods(AucGoodsVO aucGoodsVO);
	int genAucNo();
	void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO);
	AucGoodsVO selectAucGoodsByNo(int aucNo);
	Map<String, AucGoodsVO> selectAllAuc();
	Map<String, AucGoodsVO> selectHotAuc();
	Map<String, AucGoodsVO> selectRecentAuc();
	Map<String, AucGoodsVO> selectSpecificCategory(String category);
	Map<AucGoodsVO, List<GoodsPhotoVO>> selectAucByNo(int aucNo, String memberNick);
	Map<ReturnGoodsVO, List<GoodsPhotoVO>> selectReturnDetailByNo(int aucNo);
	void incrementLikeCnt(int aucNo);
	void decrementLikeCnt(int aucNo);
	void insertLike(LikeVO likeVO);
	void deleteLike(LikeVO likeVO);
	List<CodeVO> selectGoodsCategory(String codeCategory);
	LikeVO selectIsLike(LikeVO likeVO);
	Map<String, AucGoodsVO> selectBidMap(MemberVO memberVO);
	Map<String, AucGoodsVO> selectDisplayMap(MemberVO memberVO);
	Map<String, AucGoodsVO> selectLikeMap(MemberVO memberVO);
	CodeVO selectCodeVO(String category);
	Map<String, AucGoodsVO> selectAucSearchWord(String searchWord);
	
	// 사용자가 낙찰에 성공한 경매리스트 구하기
	Map<String, AucGoodsVO> selectWinBidMap(String memberNick);
	
	// 매입확정 업데이트
	void updatePurchaseConfirm(Map<String, Object> updateMap);
	
	// 매입확정 이후 작업 (판매자에게 송금,경매모입통장에서 출금)
	void transferBidMoneySeller(Map<String, Object> transferMap);
	
	// 인기경매 레이지로딩
	Map<String, AucGoodsVO> selectHotAucLazyLoad(Map<String, Object> loadInfo);
	//최신경매 레이지로딩
	Map<String, AucGoodsVO> selectRecentAucLazyLoad(Map<String, Object> loadInfo);
	
	int selectHotAucTotalCnt();
	
	// 안읽은 알림 총 갯수 구하기
	int selectUnreadNotiCnt(String memberNick);
	
	Map<NoticeVO, String> selectNotiMap(String memberNick);
	
	void updateReadStatus(int notiNo);
	
	List<AucGoodsVO> selectImminentAucsByMin(int setMin);
	
	void updateNotiReadDatetime(String memberNick);
	
	Map<NoticeVO, String> selectNoticeLazyLoad(Map<String, Object> loadInfo);
	
	// 입찰진행내역 불러오기
	Map<String, AucGoodsVO> selectOnGoingAuc(String memberNick);
	// 출품한 경매중 진행내역(진행중/대기중) 불러오기
	Map<String, AucGoodsVO> selectDisplayOnGoingAuc(String memberNick);
	// 낙찰내역 불러오기
	Map<String, AucGoodsVO> selectWinAuc(String memberNick);
	// 출품한 경매 중 마감된 경매 불러오기
	Map<String, AucGoodsVO> selectDisplayClosedAuc(String memberNick);
	
	// 매입확정 내역 불러오기
	Map<String, AucGoodsVO> selectPurchaseConfirmMap(String memberNick);
	
	// 출품내역 중 매입확정 내역 불러오기
	Map<String, AucGoodsVO> selectDisplayPurchaseConfirmMap(String memberNick);
	Map<String, AucGoodsVO> selectReturnGoodsMap(String memberNick);
	
	// 출품내역 중 환불 내역 불러오기
	Map<String, AucGoodsVO> selectDisplayReturnGoodsMap(String memberNick);
	
	void insertReturnGoods(ReturnGoodsVO returnGoodsVO);
	void insertReturnPhoto(GoodsPhotoVO goodsPhotoVO);
}
