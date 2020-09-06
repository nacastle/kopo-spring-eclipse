package hafy.aucGoods.vo;

public class AucGoodsVO {
	
	private int no;
	private String name;
	private String memberNick;
	private String category;
	private String detail;
	private String regDate;
	private String method;
	private int startPrice;
	private String startDate;
	private String endDate;
	private int viewCnt;
	private int likeCnt;
	private int winningBid;

	
	
	public AucGoodsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    	
	public int getWinningBid() {
		return winningBid;
	}
	public void setWinningBid(int winningBid) {
		this.winningBid = winningBid;
	}
	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	@Override
	public String toString() {
		return "AucGoodsVO [no=" + no + ", name=" + name + ", memberNick=" + memberNick + ", category=" + category
				+ ", detail=" + detail + ", regDate=" + regDate + ", method=" + method + ", startPrice=" + startPrice
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", viewCnt=" + viewCnt + ", likeCnt=" + likeCnt
				+ ", winningBid=" + winningBid + "]";
	}

	

}
