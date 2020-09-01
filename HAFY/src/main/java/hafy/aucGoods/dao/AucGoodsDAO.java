package hafy.aucGoods.dao;

import java.util.List;
import java.util.Map;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;

public interface AucGoodsDAO {
	
	void insertAucGoods(AucGoodsVO aucGoodsVO);
	int genAucNo();
	void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO);
	AucGoodsVO selectAucGoodsByNo(int aucNo);
	List<AucGoodsVO> selectAllAucContents();
//	List<GoodsPhotoVO> selectPhotoListByAucNo(int aucNo);
	List<String> selectPhotoNameByAucNo(int aucNo);
	List<GoodsPhotoVO> selectPhotoListByAucNo(int aucNo);
	void incrementViewCnt(int aucNo);
	void incrementLikeCnt(int aucNo);
	void decrementLikeCnt(int aucNo);
	void insertLike(LikeVO likeVO);
	void deleteLike(LikeVO likeVO);
	LikeVO selectIsLike(LikeVO likeVO);
	

}
