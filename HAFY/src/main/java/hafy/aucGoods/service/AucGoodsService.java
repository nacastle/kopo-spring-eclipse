package hafy.aucGoods.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.CodeVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.member.vo.MemberVO;

public interface AucGoodsService {
	
	void insertAucGoods(AucGoodsVO aucGoodsVO);
	int genAucNo();
	void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO);
	AucGoodsVO selectAucGoodsByNo(int aucNo);
	Map<String, AucGoodsVO> selectAllAuc();
	Map<String, AucGoodsVO> selectHotAuc();
	Map<String, AucGoodsVO> selectSpecificCategory(String category);
	Map<AucGoodsVO, List<GoodsPhotoVO>> selectAucByNo(int aucNo);
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
	void updatePurchaseConfirm(int aucNo);
	
	// 매입확정 이후 작업 (판매자에게 송금,경매모입통장에서 출금)
	void transferBidMoneySeller(Map<String, Object> transferMap);
}
