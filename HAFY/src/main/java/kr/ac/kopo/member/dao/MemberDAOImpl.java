package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberVO login(MemberVO member) {
		// TODO Auto-generated method stub
		
		MemberVO loginVO = sqlSession.selectOne("member.dao.MemberDAO.login", member);
		
		
		return loginVO;
	}
	
	

}
