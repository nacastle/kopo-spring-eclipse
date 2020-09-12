package hafy;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import hafy.aucGoods.dao.AucGoodsDAO;
import hafy.aucGoods.service.AucGoodsService;
import hafy.aucGoods.vo.AucGoodsVO;
import hafy.aucGoods.vo.GoodsPhotoVO;
import hafy.bid.dao.BidDAO;
import hafy.bid.service.BidService;
import hafy.bid.vo.AAccountVO;
import hafy.bid.vo.ATranzVO;
import hafy.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
@ContextConfiguration(locations = { "classpath:config/**/*.xml" })
public class JUnitTest {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BidService bidService;
	@Autowired
	private DataSource ds;
	@Autowired
	private AucGoodsDAO aucGoodsDAO;
	@Autowired
	private BidDAO bidDAO;
	@Autowired
	private AucGoodsService aucGoodsService;

	
	
	
	@Ignore
	@Test
	public void 사용자입찰경매중_마감된경매구하기() {
		// TODO Auto-generated method stub
		
		
		List<Integer> list = sqlSession.selectList("bid.dao.BidDAO.selectMemberClosedAuc", "nacastle");
		
		for ( Integer i : list) {
			System.out.println(i);
		}
		
	}
	
	@Ignore
	@Test
	public void 경매결과구하기 (){
		// TODO Auto-generated method stub
		List<ATranzVO> bidResultList = bidDAO.selectBidResult(137);
		for ( ATranzVO i : bidResultList) {
			System.out.println(i);
		}
	}
	
//	@Ignore
	@Test
	public void 사용자가낙찰성공한_경매구하기() {
		// TODO Auto-generated method stub
		
		Map<String, AucGoodsVO> map = aucGoodsService.selectWinBidMap("nacastle");
		for (String key : map.keySet()) {

			AucGoodsVO value = map.get(key);
			System.out.println("key: " + key + "value: " + value);

		}
	}
	
	@Ignore
	@Test
	public void 로그인테스트() {
		// TODO Auto-generated method stub
		
		MemberVO m = new MemberVO();
		m.setNickname("nacastle");
		m.setTranzPwd("1212q");
		
		MemberVO memberVO = sqlSession.selectOne("member.dao.MemberDAO.checkLogin", m);

		System.out.println("로그인한애: " +memberVO);

	}
	
	
	@Ignore
	@Test
	public void 테스트해보기() throws Exception {
		System.out.println(ds);

	}
	
	@Ignore
	@Test
	public void 회원이_입찰기록있는지_확인() throws Exception {
		
		AAccountVO aAccountVO = new AAccountVO(125,"kiwi");
		AAccountVO isBid = sqlSession.selectOne("bid.dao.BidDAO.isBidding",aAccountVO);
		System.out.println(isBid);
		
	}
	
	
	@Ignore
	@Test
	public void 인기경매테스트() {
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectHotAucContents");
		
		System.out.println("인기경매 테스트");
		
		for(AucGoodsVO a : aucList) {
			System.out.println(a);
		}
		
		System.out.println("경매수: " + aucList.size());
	}
	
	@Ignore
	@Test
	public void 검색테스트() {
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>();
		aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectAucSearchWord","사진");
		
		for(AucGoodsVO a : aucList) {
			System.out.println(a);
		}
	}
	
	@Ignore
	@Test
	public void 전체경매내용리스트불러오기() {
//		List<AucGoodsVO> aucList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectAllAucContents");
		
		List<AucGoodsVO> aucList = new ArrayList<AucGoodsVO>(); 
		aucList = aucGoodsDAO.selectAllAucContents();
		
		for(AucGoodsVO a : aucList) {
			System.out.println(a);
		}
		
	}


	@Ignore
	@Test
	public void 입찰목록보기() throws Exception {

		List<AAccountVO> bidderList = new ArrayList<AAccountVO>();
		bidderList = bidService.selectAAccount(121);
		System.out.println(bidderList.isEmpty());
	}

	@Ignore
	@Test
	public void 세션테스트() {
		System.out.println(sqlSession);
	}

//	public void 입출금내역() {
//		List<ATranzVO> aTranzList = sqlSession.selectList("bid.dao.BidDAO.selectATranzByAucNo",124);
//		
//	}
	
	

	@Ignore
	@Test
	public void selectATranzByAucNo() {
		// TODO Auto-generated method stub
		List<ATranzVO> aTranzList = sqlSession.selectList("bid.dao.BidDAO.selectATranzByAucNo", 123);

		for (ATranzVO a : aTranzList) {
			System.out.println(a);
		}
		System.out.println("거래개수: " + aTranzList.size());

	}

	@Ignore
	@Test
	public void 경매번호생성() throws Exception {

//		List<ReplyVO> list = sqlSession.selectList("reply.dao.ReplyDAO.selectAll", 7);
		List<Integer> nos = sqlSession.selectList("auction.dao.AucGoodsDAO.genAucNo");

		for (Integer no : nos) {
			System.out.println(no);
		}

	}

	@Ignore
	@Test
	public void selectPhotoListByAucNo() throws Exception {
		// TODO Auto-generated method stub

//		List<String> nameList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectPhotoNameByAucNo",120);
//		for (String n : nameList) {
//			System.out.println(n);
//		}
//		
//		System.out.println("첫번째사진: " +nameList.get(0));

//		String firstPhoto = sqlSession.selectOne("auction.dao.AucGoodsDAO.selectFirstPhotoByAucNo", 120);

//		System.out.println("하단에 출력됨");
//		System.out.println("첫번쨰사진: " + firstPhoto);

		List<GoodsPhotoVO> photoList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectPhotoListByAucNo", 120);
		for (GoodsPhotoVO p : photoList) {
			System.out.println(p);
		}

//		List<Map<String, Object>> photoList = sqlSession.selectList("auction.dao.AucGoodsDAO.selectPhotoListByAucNo", 120);
//		for(Map<String, Object> map : photoList) {
//			Set<String> keys = map.keySet();
//			for(String key : keys) {
//				System.out.println(key + " : " + map.get(key));
//			}
//		}

	}

}

//package kr.ac.kopo;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import kr.ac.kopo.reply.vo.ReplyVO;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
//public class ReplyTest {
//	
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	
//	@Test
//	public void 전체댓글조회() throws Exception {
//		
//		List<ReplyVO> list = sqlSession.selectList("reply.dao.ReplyDAO.selectAll", 7);
//		
//		for(ReplyVO vo : list) {
//			System.out.println(vo);
//		}
//		
//	}
//	
//	public void 댓글수증가Test() throws Exception {
//		
//		sqlSession.update("board.dao.BoardDAO.incrementReplyCnt",7);
//		
//	}
//
//}
