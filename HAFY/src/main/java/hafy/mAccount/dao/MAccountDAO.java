package hafy.mAccount.dao;

import java.util.List;
import java.util.Map;

import hafy.mAccount.vo.MAccountVO;

public interface MAccountDAO {
	
	void insertMAccount(MAccountVO mAccountVO);
	void deleteMAccount(String accountNo);
	List<MAccountVO> selectMAccountList(String memberNick);
	void bidMoney(Map<String, Object> bidInfo);
	void depositMAccount(Map<String, Object> depositInfo);

}
