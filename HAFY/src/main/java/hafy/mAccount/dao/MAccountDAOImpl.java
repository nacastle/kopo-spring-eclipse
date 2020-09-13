package hafy.mAccount.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hafy.mAccount.vo.MAccountVO;

@Repository
public class MAccountDAOImpl implements MAccountDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	@Override
	public void depositMAccount(Map<String, Object> depositInfo) {
		// TODO Auto-generated method stub
		sqlSession.update("mAccount.dao.MAccountDAO.depositMAccount", depositInfo);
		
	}

	@Override
	public void deleteMAccount(String accountNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("mAccount.dao.MAccountDAO.deleteMAccount", accountNo);
		
	}

	@Override
	public void bidMoney(Map<String, Object> bidInfo) {
		// TODO Auto-generated method stub
		sqlSession.update("mAccount.dao.MAccountDAO.withdrawMAccount", bidInfo);
	}

	@Override
	public List<MAccountVO> selectMAccountList(String memberNick) {
		// TODO Auto-generated method stub
		List<MAccountVO> mAccountList = sqlSession.selectList("mAccount.dao.MAccountDAO.selectMAccountList", memberNick);
		return mAccountList;
	}



	@Override
	public void insertMAccount(MAccountVO mAccountVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("mAccount.dao.MAccountDAO.insert",mAccountVO);
		
		
	}
	
	
	

}
