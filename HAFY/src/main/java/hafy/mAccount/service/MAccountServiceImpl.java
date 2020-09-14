package hafy.mAccount.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hafy.mAccount.dao.MAccountDAO;
import hafy.mAccount.vo.MAccountVO;

@Service
public class MAccountServiceImpl implements MAccountService{
	
	@Autowired
	private MAccountDAO mAccountDAO; 
	
	
	
	@Override
	public void deleteMAccount(String accountNo) {
		// TODO Auto-generated method stub
		mAccountDAO.deleteMAccount(accountNo);
		
	}


	@Override
	public void bidMoney(Map<String, Object> bidInfo) {
		// TODO Auto-generated method stub
		
		mAccountDAO.bidMoney(bidInfo);
		
	}


	@Override
	public List<MAccountVO> selectMAccountList(String memberNick) {
		// TODO Auto-generated method stub
		List<MAccountVO> mAccountList = mAccountDAO.selectMAccountList(memberNick);
		return mAccountList;
	}



	@Override
	public void insertMAccount(MAccountVO mAccount) {
		// TODO Auto-generated method stub
		
		mAccountDAO.insertMAccount(mAccount);
		
	}
	
	

}
