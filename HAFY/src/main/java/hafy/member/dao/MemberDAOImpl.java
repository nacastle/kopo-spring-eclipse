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
	public MemberVO checkLogin(MemberVO inputMemberVO) {
		// TODO Auto-generated method stub
		MemberVO memberVO = sqlSession.selectOne("member.dao.MemberDAO.checkLogin",inputMemberVO);
		return memberVO;
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.update("member.dao.MemberDAO.memberUpdate",memberVO);
		
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		MemberVO vo = sqlSession.selectOne("member.dao.MemberDAO.selectMember",memberVO);
		return vo;
	}



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
