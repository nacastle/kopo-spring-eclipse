package hafy.bid.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hafy.aucGoods.vo.AucGoodsVO;
import hafy.bid.dao.BidDAO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;

@Service
public class BidServiceImpl implements BidService {

	@Autowired
	private BidDAO bidDAO;

	
	
	@Override
	public List<ATranzVO> selectBidResult(int aucNo) {
		// TODO Auto-generated method stub
		List<ATranzVO> bidResult = new ArrayList<ATranzVO>();
		bidResult = bidDAO.selectBidResult(aucNo); 
		return bidResult;
	}

	@Override
	public List<ATranzVO> selectATranzByAucNo(int aucNo) {
		// TODO Auto-generated method stub
		List<ATranzVO> aTranzList = new ArrayList<ATranzVO>();
		aTranzList = bidDAO.selectATranzByAucNo(aucNo);

		return aTranzList;
	}

	@Override
	public List<AAccountVO> selectAAccount(int aucNo) {
		// TODO Auto-generated method stub
		return bidDAO.selectAAccount(aucNo);
	}

	@Transactional
	@Override
	public void bidding(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub

		AAccountVO isAccountVO = bidDAO.isBidding(aAccountVO);

		// 첫 입찰이면 insert, 두번 이상 입찰이면 update
		if (isAccountVO == null) {
			bidDAO.insertAAccountBid(aAccountVO);
		} else {
			bidDAO.addBidMoney(aAccountVO);
		}

		
		// 최고 입찰가 구하기
		//// 입찰목록 불러오기
		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidDAO.selectAAccount(aAccountVO.getAucNo());

		int highestBid = bidderList.get(0).getBidMoney();
		for (int i = 1; i < bidderList.size(); i++) {
			if (bidderList.get(i).getBidMoney() >= highestBid) {

				highestBid = bidderList.get(i).getBidMoney();
			}
		}
		
		System.out.println("비드서비스에서 최고입찰가:"+ highestBid);
		
		AAccountVO tempVO = new AAccountVO();
		tempVO.setBidMoney(highestBid);
		tempVO.setAucNo(aAccountVO.getAucNo());
		// hf_auc_goods의 winningBid 컬럼  => 최고 입찰가로 업데이트
		bidDAO.updateWinningBid(tempVO);
	}

	@Override
	public void insertBidTranz(ATranzVO aTranzVO) {
		// TODO Auto-generated method stub

		AAccountVO aAccountVO = new AAccountVO(aTranzVO.getAucNo(), aTranzVO.getTranzMemberNick());
		AAccountVO isBid = bidDAO.isBidding(aAccountVO);

		// 입찰 기록이 있으면 'memberBalance = 해당 모임계좌 bidMoney + tranzMoney'
		// 없으면 'memberBalance = tranzMoney'
		if (isBid == null) {
			bidDAO.insertBidTranzNoBalance(aTranzVO);
		} else {
			bidDAO.insertBidTranz(aTranzVO);
		}

	}

}
