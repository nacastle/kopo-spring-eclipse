package hafy.member.dao;

import java.util.List;
import java.util.Map;

import hafy.member.vo.MemberVO;

public interface MemberDAO {
	
	/**
	 * 회원 등록
	*/
	
	void insert(MemberVO memberVO);
	
	void updateMember(MemberVO memberVO);
	
	/**
	 * 거래 비밀번호 설정
	 * 0000t 였던 pwd 사용자 임의 설정으로 tranzPwd 수정해서 등록
	*/
	void registerPwd(Map<String, String> pwdMap);
	
	MemberVO selectMember(MemberVO memberVO);
	MemberVO checkLogin(MemberVO inputMemberVO);
	
	
}	
