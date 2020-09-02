package hafy.bid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hafy.bid.dao.BidDAO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;

@Service
public class BidServiceImpl implements BidService {
	
	@Autowired
	private BidDAO bidDAO;
	
	

	@Override
	public List<ATranzVO> selectATranzByAucNo(int aucNo) {
		// TODO Auto-generated method stub
		List<ATranzVO> aTranzList = bidDAO.selectATranzByAucNo(aucNo);
		
		return aTranzList;
	}
	
	@Override
	public List<AAccountVO> selectAAccount(int aucNo) {
		// TODO Auto-generated method stub
		return bidDAO.selectAAccount(aucNo);
	}

	@Override
	public void bidding(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		
		AAccountVO isAccountVO =  bidDAO.isBidding(aAccountVO);
		
		if (isAccountVO == null) {
			bidDAO.insertAAccountBid(aAccountVO);
		} else {
			bidDAO.addBidMoney(aAccountVO);
		}
		
		
		
		
	}

	@Override
	public void insertBidTranz(ATranzVO aTranzVO) {
		// TODO Auto-generated method stub
		
		AAccountVO aAccountVO = new AAccountVO(aTranzVO.getAucNo(),aTranzVO.getTranzMemberNick());
		AAccountVO isBid = bidDAO.isBidding(aAccountVO);
		
		// 입찰 기록이 있으면   'memberBalance =  해당 모임계좌 bidMoney + tranzMoney'
		// 		      없으면	 'memberBalance =  tranzMoney'
		if (isBid == null) {
			bidDAO.insertBidTranzNoBalance(aTranzVO);
		} else {
		bidDAO.insertBidTranz(aTranzVO);
		}
		
	}
	
	
	
	
	

}
