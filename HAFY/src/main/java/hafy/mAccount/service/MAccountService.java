package hafy.mAccount.service;

import java.util.List;
import java.util.Map;

import hafy.mAccount.vo.MAccountVO;

public interface MAccountService {
	
	void insertMAccount(MAccountVO mAccount);
	List<MAccountVO> selectMAccountList(String memberNick);
	void bidMoney(Map<String, Object> bidInfo);

}
