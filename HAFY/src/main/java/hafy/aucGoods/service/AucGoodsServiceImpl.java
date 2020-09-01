package hafy.aucGoods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import hafy.aucGoods.dao.AucGoodsDAO;
import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;


@Service
public class AucGoodsServiceImpl implements AucGoodsService{
	
	@Autowired
	private AucGoodsDAO aucGoodsDAO;
	
	
	
	
	@Override
	public LikeVO selectIsLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		LikeVO isLikeVO = aucGoodsDAO.selectIsLike(likeVO);
		return isLikeVO;
	}

	@Override
	public void insertLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		aucGoodsDAO.insertLike(likeVO);
		
	}

	@Override
	public void deleteLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		aucGoodsDAO.deleteLike(likeVO);

	}

	@Override
	public void decrementLikeCnt(int aucNo) {
		// TODO Auto-generated method stub
		aucGoodsDAO.decrementLikeCnt(aucNo);

		
	}

	@Override
	public void incrementLikeCnt(int aucNo) {
		// TODO Auto-generated method stub
		aucGoodsDAO.incrementLikeCnt(aucNo);
		
	}

	@Override
	public Map<AucGoodsVO, List<GoodsPhotoVO>> selectAucByNo(int aucNo) {
		// TODO Auto-generated method stub
		
		aucGoodsDAO.incrementViewCnt(aucNo);
		
		Map<AucGoodsVO, List<GoodsPhotoVO>> aucMap = new HashMap<AucGoodsVO, List<GoodsPhotoVO>>();
		
		AucGoodsVO aucGoodsVO = aucGoodsDAO.selectAucGoodsByNo(aucNo);
		List<GoodsPhotoVO> goodsPhotoList = aucGoodsDAO.selectPhotoListByAucNo(aucNo);
		
		aucMap.put(aucGoodsVO, goodsPhotoList);
		
		return aucMap;
	}

	@Override
	public void insertAucGoods(AucGoodsVO aucGoodsVO) {
		// TODO Auto-generated method stub
		aucGoodsDAO.insertAucGoods(aucGoodsVO);
	}

	@Override
	public int genAucNo() {
		// TODO Auto-generated method stub
		
		int aucNo = aucGoodsDAO.genAucNo();
		
		return aucNo;
	}

	@Override
	public void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO) {
		// TODO Auto-generated method stub
		aucGoodsDAO.insertGoodsPhoto(goodsPhotoVO);
		
	}

	@Override
	public AucGoodsVO selectAucGoodsByNo(int aucNo) {
		// TODO Auto-generated method stub
		
		AucGoodsVO aucGoodsVO = aucGoodsDAO.selectAucGoodsByNo(aucNo);
		return aucGoodsVO;
	}

	
	/**
	 * 첫번째 사진 파일명과 상품정보가 담긴 Map 생성
	*/
	@Override
	public Map<String, AucGoodsVO> selectAllAuc() {
		// TODO Auto-generated method stub
		
		Map<String, AucGoodsVO> aucMap = new HashMap<>();
		List<AucGoodsVO> aucList = aucGoodsDAO.selectAllAucContents();
//		for(AucGoodsVO a : aucList) {
//			System.out.println(a);
//		}
		
		
		for(AucGoodsVO auc : aucList) {
			
			int aucNo = auc.getNo();
//			System.out.println("다음경매번호는? " +aucNo);
			
//			List<GoodsPhotoVO> photoList = new ArrayList<GoodsPhotoVO>();
//			List<GoodsPhotoVO> photoList =  aucGoodsDAO.selectPhotoListByAucNo(aucNo);
			List<String> photoList =  aucGoodsDAO.selectPhotoNameByAucNo(aucNo);
			String firstPhoto = photoList.get(0); 
//			System.out.println("다음 첫사진은? " + firstPhoto);
//			photoList  = aucGoodsDAO.selectPhotoListByAucNo(aucNo);
//			System.out.println("service에서 다음 포토 ? "+ firstPhoto);
			
//			for(GoodsPhotoVO p : photoList) {
//				System.out.println("다음 포토는? " + p);
//			}
			
			aucMap.put(firstPhoto, auc);
			
//			if (photoList.size() != 0) {
//				
//				
//				String firstPhoto = photoList.get(0).getSaveName();
//				aucMap.put(firstPhoto, auc);
//			}
		}
		
		
		return aucMap;
	}
	
	
	
	
	
	
	
	
	

}
