package hafy.aucGoods.vo;

public class LikeVO {
	
	private String memberNick;
	private int aucNo;
	public LikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LikeVO(String memberNick, int aucNo) {
		super();
		this.memberNick = memberNick;
		this.aucNo = aucNo;
	}

	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public int getAucNo() {
		return aucNo;
	}
	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}
	@Override
	public String toString() {
		return "LikeVO [memberNick=" + memberNick + ", aucNo=" + aucNo + "]";
	}
	
	

}
