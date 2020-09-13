package hafy.aucGoods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.CodeVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.bid.vo.AAccountVO;
import hafy.member.vo.MemberVO;

public interface AucGoodsDAO {
	
	void insertAucGoods(AucGoodsVO aucGoodsVO);
	int genAucNo();
	void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO);
	AucGoodsVO selectAucGoodsByNo(int aucNo);
	List<AucGoodsVO> selectAllAucContents();
	List<AucGoodsVO> selectHotAucContents();
	List<AucGoodsVO> selectRecentAucContents();
	List<AAccountVO> selectBidList(MemberVO memberVO);
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
	
	void updatePurchaseConfirm(int aucNo);
	void updateRefundStatus(int aucNo);

}
