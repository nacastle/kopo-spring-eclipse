package hafy.mAccount.dao;

import java.util.List;
import java.util.Map;

import hafy.mAccount.vo.MAccountVO;

public interface MAccountDAO {
	
	void insertMAccount(MAccountVO mAccountVO);
	List<MAccountVO> selectMAccountList(String memberNick);
	void bidMoney(Map<String, Object> bidInfo);

}
