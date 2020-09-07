package hafy.bid.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;

@Repository
public class BidDAOImpl implements BidDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	

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
