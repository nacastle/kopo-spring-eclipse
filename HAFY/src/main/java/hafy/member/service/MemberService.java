package hafy.member.service;

import java.util.Map;

import hafy.member.vo.MemberVO;
import hafy.member.vo.NoticeSettingVO;

public interface MemberService {
	
	void insertMember(MemberVO memberVO);
	void insertNoticeSetting(MemberVO memberVO);
	void updateMember(MemberVO memberVO);
	void updateNoticeSetting(NoticeSettingVO noticeSettingVO);
	void deleteMember(MemberVO memberVO);
	void registerPwd(Map<String, String> pwdMap);
	MemberVO selectMember(MemberVO memberVO);
	MemberVO checkLogin(MemberVO inputMemberVO);
	NoticeSettingVO selectNoticeSettingVOByNick(String nickname);
	MemberVO checkID(String id);
	
	
//	List<ReplyVO> selectReplyList (int boardNo);
//	void removeReply(int replyNo);
//	void removeReply(ReplyVO replyVO);
	
	

}
