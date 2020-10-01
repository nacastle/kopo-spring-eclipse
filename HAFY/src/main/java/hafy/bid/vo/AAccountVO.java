package hafy.bid.vo;

public class AAccountVO {
	
	private int aucNo;
	private String bidderNick;
	private double bidMoney;
	private String firstBidDate;
	
	
	public AAccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AAccountVO(int aucNo, int bidMoney) {
		super();
		this.aucNo = aucNo;
		this.bidMoney = bidMoney;
	}
	


	public AAccountVO(int aucNo, String bidderNick, double bidMoney, String firstBidDate) {
		super();
		this.aucNo = aucNo;
		this.bidderNick = bidderNick;
		this.bidMoney = bidMoney;
		this.firstBidDate = firstBidDate;
	}


	public String getFirstBidDate() {
		return firstBidDate;
	}


	public void setFirstBidDate(String firstBidDate) {
		this.firstBidDate = firstBidDate;
	}


	public AAccountVO(int aucNo, String bidderNick) {
		super();
		this.aucNo = aucNo;
		this.bidderNick = bidderNick;
	}


	public AAccountVO(int aucNo, String bidderNick, double bidMoney) {
		super();
		this.aucNo = aucNo;
		this.bidderNick = bidderNick;
		this.bidMoney = bidMoney;
	}


	public double getBidMoney() {
		return bidMoney;
	}
	public void setBidMoney(double bidMoney) {
		this.bidMoney = bidMoney;
	}
	public int getAucNo() {
		return aucNo;
	}
	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}
	public String getBidderNick() {
		return bidderNick;
	}
	public void setBidderNick(String bidderNick) {
		this.bidderNick = bidderNick;
	}


	@Override
	public String toString() {
		return "AAccountVO [aucNo=" + aucNo + ", bidderNick=" + bidderNick + ", bidMoney=" + bidMoney
				+ ", firstBidDate=" + firstBidDate + "]";
	}


	
	
	
	
	

}
