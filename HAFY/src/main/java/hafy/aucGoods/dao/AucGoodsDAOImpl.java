package hafy.aucGoods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.CodeVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.aucGoods.vo.LikeVO;
import hafy.aucGoods.vo.ReturnGoodsVO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.NoticeVO;
import hafy.member.vo.MemberVO;

@Repository
public class AucGoodsDAOImpl implements AucGoodsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public void updateNotiReadDatetime(String memberNick) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.updateNotiReadDatetime",memberNick);
	}

	@Override
	public AucGoodsVO isImminentAucByMin(Map<String, Object> setMinMap) {
		// TODO Auto-generated method stub
		AucGoodsVO aucGoodsVO = sqlSession.selectOne("auction.dao.AucGoodsDAO.isImminentAucByMin", setMinMap);
		return aucGoodsVO;
	}

	@Override
	public List<AucGoodsVO> selectOpenAucs() {
		// TODO Auto-generated method stub
		List<AucGoodsVO> openAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectOpenAucs");
		return openAucList;	
	}

	@Override
	public List<AucGoodsVO> selectImminentAucsByMin(int setMin) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectImminentAucsByMin", setMin);
		return aucList;
	}

	@Override
	public void updateReadStatus(int notiNo) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.updateReadStatus",notiNo);
		
	}

	@Override
	public List<NoticeVO> selectNotiList(String memberNick) {
		// TODO Auto-generated method stub
		List<NoticeVO> noticeList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectNotiList", memberNick);
		return noticeList;
	}

	@Override
	public int selectHotAucTotalCnt() {
		// TODO Auto-generated method stub
		int hotTotalCnt = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectHotAucTotalCnt");
		return hotTotalCnt;
	}

	@Override
	public int selectUnreadNotiCnt(String memberNick) {
		// TODO Auto-generated method stub
		int notiCnt = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectUnreadNotiCnt", memberNick);
		return notiCnt;

	}


	@Override
	public void updateRefundStatus(int aucNo) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.updateRefundStatus",aucNo);
	}



	@Override
	public void updatePurchaseConfirm(Map<String, Object> updateMap) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.updatePurchaseConfirm",updateMap);
	}



	@Override
	public List<AucGoodsVO> selectWinAucContents(String memberNick) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> winAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectWinAucContents", memberNick);
		return winAucList;
	}
	
	@Override
	public List<AucGoodsVO> selectDisplayClosedAucContents(String memberNick) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> AucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectDisplayClosedAucContents", memberNick);
		return AucList;	
	}

	@Override
	public List<AucGoodsVO> selectOnGoingAucContents(String memberNick) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> onGoingAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectOnGoingAucContents", memberNick);
		return onGoingAucList;
	}

	@Override
	public List<AucGoodsVO> selectDisplayPurchaseConfirmContents(String memberNick) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectDisplayPurchaseConfirmContents", memberNick);
		return aucList;	}
	
	@Override
	public List<AucGoodsVO> selectDisplayReturnGoodsContents(String memberNick) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectDisplayReturnGoodsContents", memberNick);
		return aucList;	}

	@Override
	public List<AucGoodsVO> selectDisplayOnGoingAucContents(String memberNick) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> onGoingAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectDisplayOnGoingAucContents", memberNick);
		return onGoingAucList;
	}

	@Override
	public List<AucGoodsVO> selectHotAucContents() {
		// TODO Auto-generated method stub
		List<AucGoodsVO> hotAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectHotAucContents");
		return hotAucList;
	}
	
	@Override
	public List<NoticeVO> selectNotiContentsLazyLoad(Map<String, Object> loadInfo) {
		// TODO Auto-generated method stub
		List<NoticeVO> notiList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectNotiContentsLazyLoad", loadInfo);
		return notiList;
	}

	@Override
	public List<AucGoodsVO> selectHotAucContentsLazyLoad(Map<String, Object> loadInfo) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> hotAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectHotAucContentsLazyLoad", loadInfo);
		return hotAucList;
	}
	
	

	@Override
	public List<AucGoodsVO> selectRecentAucContentsLazyLoad(Map<String, Object> loadInfo) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> recentAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectRecentAucContentsLazyLoad", loadInfo);
		return recentAucList;
	}



	@Override
	public List<AucGoodsVO> selectRecentAucContents() {
		// TODO Auto-generated method stub
		List<AucGoodsVO> recentAucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectRecentAucContents");
		return recentAucList;
	}



	@Override
	public CodeVO selectCodeVO(String category) {
		// TODO Auto-generated method stub
		CodeVO codeVO = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectCodeVO",category);
		return codeVO;
	}

	
	
	@Override
	public List<AucGoodsVO> selectAucSearchWord(String searchWord) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectAucSearchWord",searchWord);

		return aucList;
	}

	
	@Override
	public List<AucGoodsVO> selectNotPurchaseConfirmList(int confirmDay) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectNotPurchaseConfirmList",confirmDay);
		return aucList;
	}

	@Override
	public List<AucGoodsVO> selectSpecificCategory(String category) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectSpecificCategory",category);
		return aucList;
	}

	@Override
	public List<LikeVO> selectLikeList(MemberVO memberVO) {
		// TODO Auto-generated method stub
		List<LikeVO> likeList = new ArrayList<LikeVO>();
		likeList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectLikeList",memberVO);
		return likeList;
	}

	@Override
	public List<CodeVO> selectGoodsCategory(String codeCategory) {
		// TODO Auto-generated method stub
		List<CodeVO> category = sqlSession.selectList("auction.dao.AucGoodsDAO.selectGoodsCategory",codeCategory);
		
		return category;
	}

	@Override
	public LikeVO selectIsLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		LikeVO isLikeVO = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectIsLike",likeVO);
		return isLikeVO;
	}

	@Override
	public void insertLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("auction.dao.AucGoodsDAO.insertLike",likeVO);
	}

	@Override
	public void deleteLike(LikeVO likeVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("auction.dao.AucGoodsDAO.deleteLike",likeVO);
	}

	@Override
	public void decrementLikeCnt(int aucNo) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.decrementLikeCnt",aucNo);
	}

	@Override
	public void incrementLikeCnt(int aucNo) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.incrementLikeCnt",aucNo);
		
	}

	@Override
	public void incrementViewCnt(int aucNo) {
		// TODO Auto-generated method stub
		sqlSession.update("auction.dao.AucGoodsDAO.incrementViewCnt",aucNo);
		
	}
	
	
	
	
	@Override
	public List<GoodsPhotoVO> selectReturnPhotoListByAucNo(int aucNo) {
		// TODO Auto-generated method stub
		List<GoodsPhotoVO> returnPhotoList = new ArrayList<GoodsPhotoVO>();
		returnPhotoList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectReturnPhotoListByAucNo",aucNo);
		
		return returnPhotoList;
	}

	@Override
	public List<GoodsPhotoVO> selectPhotoListByAucNo(int aucNo) {
		// TODO Auto-generated method stub
		List<GoodsPhotoVO> goodsPhotoList = new ArrayList<GoodsPhotoVO>();
		goodsPhotoList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectPhotoListByAucNo",aucNo);
		
		return goodsPhotoList;
	}
	
	@Override
	public ReturnGoodsVO selectReturnGoodsByNo(int aucNo) {
		// TODO Auto-generated method stub
		ReturnGoodsVO returnGoodsVO = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectReturnGoodsByNo",aucNo);
		return returnGoodsVO;
	}

	@Override
	public void insertAucGoods(AucGoodsVO aucGoodsVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("auction.dao.AucGoodsDAO.insertAucGoods",aucGoodsVO);
	}
	
	@Override
	public void insertReturnGoods(ReturnGoodsVO returnGoodsVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("auction.dao.AucGoodsDAO.insertReturnGoods",returnGoodsVO);
	}

	@Override
	public int genAucNo() {
		// TODO Auto-generated method stub
		int aucNo = sqlSession.selectOne("auction.dao.AucGoodsDAO.genAucNo");
		
		return aucNo;
	}

	@Override
	public void insertGoodsPhoto(GoodsPhotoVO goodsPhotoVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("auction.dao.AucGoodsDAO.insertGoodsPhoto",goodsPhotoVO);
		
	}
	

	@Override
	public void insertReturnPhoto(GoodsPhotoVO goodsPhotoVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("auction.dao.AucGoodsDAO.insertReturnPhoto",goodsPhotoVO);
		
	}

	@Override
	public AucGoodsVO selectAucGoodsByNo(int aucNo) {
		// TODO Auto-generated method stub
		AucGoodsVO aucGoodsVO = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectAucGoodsByNo", aucNo);
		
		return aucGoodsVO;
	}

	@Override
	public List<AucGoodsVO> selectAllAucContents() {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectAllAucContents");
		return aucList;	
	}
	
	@Override
	public List<AucGoodsVO> selectBidList(MemberVO memberVO) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectBidList", memberVO);
		return aucList;
	}
	
	@Override
	public List<AucGoodsVO> selectDisplayList(MemberVO memberVO) {
		// TODO Auto-generated method stub
		List<AucGoodsVO> displayList = new ArrayList<AucGoodsVO>();
		displayList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectDisplayList", memberVO);

		return displayList;
	}

	/**
	 * 경매번호로 상품사진정보 가져오기
	*/
	@Override
//	public List<GoodsPhotoVO> selectPhotoListByAucNo(int aucNo) {
	public List<String> selectPhotoNameByAucNo(int aucNo) {
		// TODO Auto-generated method stub
		List<String> photoList = new ArrayList<String>();
		photoList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectPhotoNameByAucNo",aucNo);
		
		return photoList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
