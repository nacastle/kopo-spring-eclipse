package hafy.bid.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.bid.vo.NoticeVO;

@Repository
public class BidDAOImpl implements BidDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertNoti(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("bid.dao.BidDAO.insertNoti", noticeVO);
	}

	@Override
	public List<Integer> selectNotRefundAucList() {
		// TODO Auto-generated method stub
		List<Integer> notRefundAucList = new ArrayList<Integer>(); 
		notRefundAucList = sqlSession.selectList("bid.dao.BidDAO.selectNotRefundAucList");
		return notRefundAucList;
	}

	@Override
	public List<Integer> selectMemberClosedAuc(String memberNick) {
		// TODO Auto-generated method stub
		List<Integer> aucNoList = new ArrayList<Integer>(); 
		aucNoList =	sqlSession.selectList("bid.dao.BidDAO.selectMemberClosedAuc",memberNick);
		return aucNoList;
	}
	
	@Override
	public List<Integer> selectMemberClosedAucOBConfirmDate(String memberNick) {
		// TODO Auto-generated method stub
		List<Integer> aucNoList = new ArrayList<Integer>(); 
		aucNoList =	sqlSession.selectList("bid.dao.BidDAO.selectMemberClosedAucOBConfirmDate",memberNick);
		return aucNoList;
	}

	@Override
	public List<Integer> selectMemberClosedAucOBReturnRequestDate(String memberNick) {
		// TODO Auto-generated method stub
		List<Integer> aucNoList = new ArrayList<Integer>(); 
		aucNoList =	sqlSession.selectList("bid.dao.BidDAO.selectMemberClosedAucOBReturnRequestDate",memberNick);
		return aucNoList;
	}

	@Override
	public List<ATranzVO> selectBidResult(int aucNo) {
		// TODO Auto-generated method stub
		List<ATranzVO> bidResult = new ArrayList<ATranzVO>();
		bidResult = sqlSession.selectList("bid.dao.BidDAO.selectBidResult", aucNo);
		return bidResult;
	}

	@Override
	public void updateWinningBid(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		sqlSession.update("bid.dao.BidDAO.updateWinningBid",aAccountVO);
		
	}

	@Override
	public AAccountVO isBidding(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		AAccountVO aAccount = sqlSession.selectOne("bid.dao.BidDAO.isBidding",aAccountVO);
		return aAccount;
	}
	
	@Override
	public List<AAccountVO> selectAAccount(int aucNo) {
		// TODO Auto-generated method stub
		List<AAccountVO> bidderList = sqlSession.selectList("bid.dao.BidDAO.selectAAccount",aucNo);
		return bidderList;
	}

	
	
	@Override
	public List<ATranzVO> selectATranzLazyLoadByAucNo(Map<String, Object> loadInfo) {
		// TODO Auto-generated method stub
		List<ATranzVO> aTranzList = new ArrayList<ATranzVO>(); 
		aTranzList = sqlSession.selectList("bid.dao.BidDAO.selectATranzLazyLoadByAucNo", loadInfo);
		
		return aTranzList;
	}

	@Override
	public List<ATranzVO> selectATranzByAucNo(int aucNo) {
		// TODO Auto-generated method stub
		List<ATranzVO> aTranzList = new ArrayList<ATranzVO>(); 
		aTranzList = sqlSession.selectList("bid.dao.BidDAO.selectATranzByAucNo",aucNo);
		
		return aTranzList;
	}

	@Override
	public void insertAAccountBid(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("bid.dao.BidDAO.insertAAccountBid",aAccountVO);
	}
	
	@Override
	public void addBidMoney(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		sqlSession.update("bid.dao.BidDAO.addBidMoney",aAccountVO);
				
	}
	
	@Override
	public void withdrawAAccount(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		sqlSession.update("bid.dao.BidDAO.withdrawAAccount",aAccountVO);
				
	}


	@Override
	public void insertBidTranz(ATranzVO aTranzVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("bid.dao.BidDAO.insertBidTranz",aTranzVO);
		
	}
	
	@Override
	public void insertBidTranzNoBalance(ATranzVO aTranzVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("bid.dao.BidDAO.insertBidTranzNoBalance",aTranzVO);
		
	}
	
	

}
