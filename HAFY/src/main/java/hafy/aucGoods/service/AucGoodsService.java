package hafy.aucGoods.service;

import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;

public interface AucGoodsService {
	
	void insertAucGoods(AucGoodsVO aucGoodsVO);
	int genAucNo();
	void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO);
	AucGoodsVO selectAucGoodsByNo(int aucNo);
	Map<String, AucGoodsVO> selectAllAuc();
	Map<AucGoodsVO, List<GoodsPhotoVO>> selectAucByNo(int aucNo);
	void incrementLikeCnt(int aucNo);
	void decrementLikeCnt(int aucNo);
	void insertLike(LikeVO likeVO);
	void deleteLike(LikeVO likeVO);
	
	LikeVO selectIsLike(LikeVO likeVO);

}
