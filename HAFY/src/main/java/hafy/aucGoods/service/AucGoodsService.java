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
}
