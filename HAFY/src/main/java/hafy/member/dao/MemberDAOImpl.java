package hafy.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hafy.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.dao.MemberDAO.insert",memberVO);

	}

	@Override
	public void registerPwd(Map<String, String> pwdMap) {
		// TODO Auto-generated method stub
		sqlSession.update("member.dao.MemberDAO.registerPwd",pwdMap);
		
	}


}
