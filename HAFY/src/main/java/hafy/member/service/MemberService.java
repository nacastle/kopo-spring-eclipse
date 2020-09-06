package hafy.member.service;

import java.util.Map;

import hafy.member.vo.MemberVO;

public interface MemberService {
	
	void insertMember(MemberVO memberVO);
	void updateMember(MemberVO memberVO);
	void registerPwd(Map<String, String> pwdMap);
	MemberVO selectMember(MemberVO memberVO);
	MemberVO checkLogin(MemberVO inputMemberVO);
	
	
//	List<ReplyVO> selectReplyList (int boardNo);
//	void removeReply(int replyNo);
//	void removeReply(ReplyVO replyVO);
	
	

}
