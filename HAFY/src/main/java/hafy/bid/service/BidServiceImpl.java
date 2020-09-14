package hafy.bid.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hafy.aucGoods.dao.AucGoodsDAO;
import hafy.aucGoods.vo.AucGoodsVO;
import hafy.bid.dao.BidDAO;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.mAccount.dao.MAccountDAO;
import hafy.member.dao.MemberDAO;

@Service
public class BidServiceImpl implements BidService {

	@Autowired
	private BidDAO bidDAO;
	@Autowired
	private AucGoodsDAO aucGoodsDAO;
	@Autowired
	private MAccountDAO mAccountDAO;

	
	
	@Override
	public AAccountVO isBidding(AAccountVO aAccountVO) {
		// TODO Auto-generated method stub
		AAccountVO isBid = bidDAO.isBidding(aAccountVO);
		return isBid;
	}

	@Transactional
	@Override
	public void refundBidMoney() {
		// TODO Auto-generated method stub

		// 환급절차 진행할 경매조건 : 마감된  + 미환급된 + 한번이라도 입찰이 진행된(winningBid가 0이 아닌)
		List<Integer> notRefundAucList = new ArrayList<Integer>();
		notRefundAucList = bidDAO.selectNotRefundAucList();

		if (notRefundAucList.size() > 0) {
			for (Integer aucNo : notRefundAucList) {

				List<ATranzVO> bidResult = new ArrayList<ATranzVO>();
				bidResult = bidDAO.selectBidResult(aucNo);

				// 입찰자가 2명 이상이면 아래 코드를 run / 1명 이하이면 낙찰자 돈밖에 없거나 아예 입찰기록이 없기에 아래 코드 run하면 안됨
				if (bidResult.size() >= 2) {

					// 최고입찰가(낙찰가)를 제외한 금액을 환급 (그래서 i=1 부터)
					for (int i = 1; i < bidResult.size(); i++) {

						// 입찰자 닉네임 구하기
						String bidderNick = bidResult.get(i).getTranzMemberNick();
						// 입찰자가 어플에 등록한 계좌 중 첫번째 계좌 구하기
						String bidderAccountNo = mAccountDAO.selectMAccountList(bidderNick).get(0).getAccountNo();
						// 환급할 액수
						int refundMoney = bidResult.get(i).getMemberBalance();

						ATranzVO aTranzVO = new ATranzVO(aucNo, bidderAccountNo, -refundMoney, bidderNick, "출금");
						
						AAccountVO withdrawAAccountInfo = new AAccountVO();
						withdrawAAccountInfo.setAucNo(aucNo);
						withdrawAAccountInfo.setBidderNick(bidderNick);
						withdrawAAccountInfo.setBidMoney(refundMoney);
						
						Map<String, Object> depositInfo = new HashMap<String, Object>();
						depositInfo.put("winBidMoney",refundMoney);
						depositInfo.put("mAccountNo",bidderAccountNo);
						
						// 낙찰액 판매자 계좌로 입금되기
//						Map<String, Object> depositInfo = new HashMap<String, Object>();
//						depositInfo.put("mAccountNo",(String)transferMap.get("sellerAccount"));
//						depositInfo.put("winBidMoney",(Integer)transferMap.get("winBidMoney"));
//						mAccountDAO.depositMAccount(depositInfo);
						
						// 입출금내역에 출금 추가
						bidDAO.insertBidTranz(aTranzVO);
						// 낙찰액 제외 입찰액 모임계좌에서 빠져나가기
						bidDAO.withdrawAAccount(withdrawAAccountInfo);

						// 낙찰자 제외 입찰자의 회원계좌로 입금
						System.out.println("환급돈(Integer)depositInfo.get(\"winBidMoney\")" + (Integer)depositInfo.get("winBidMoney"));
						System.out.println("환급돈 refundMoney" + refundMoney);
						mAccountDAO.depositMAccount(depositInfo);
					}
				}
				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
				String nowTime = now.format(formatter);
				
				// 해당경매 환급상태 컬럼 '환급완료'로 바꾸기
				aucGoodsDAO.updateRefundStatus(aucNo);
				System.out.println(nowTime + "에 "+ aucNo +"번 경매 환급완료");

			}
		} else {
			System.out.println("환급할 내역이 없습니다.");
		}

	}

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

//		System.out.println("비드서비스에서 최고입찰가:" + highestBid);

		AAccountVO tempVO = new AAccountVO();
		tempVO.setBidMoney(highestBid);
		tempVO.setAucNo(aAccountVO.getAucNo());
		// hf_auc_goods의 winningBid 컬럼 => 최고 입찰가로 업데이트
		bidDAO.updateWinningBid(tempVO);
	}

	@Transactional
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
			
			// 수정한부분
			int pastBidMoney = isBid.getBidMoney();
			int nowBidMoney = aTranzVO.getTranzMoney();
			// 지금 입찰액과 과거 입찰액 차액만큼 입금액 추가 
			aTranzVO.setTranzMoney(nowBidMoney - pastBidMoney);
			// 여기까지해서
			
			bidDAO.insertBidTranz(aTranzVO);
		}

	}

}
