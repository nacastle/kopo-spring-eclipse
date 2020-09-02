package hafy.bid.vo;

public class AAccountVO {
	
	private int aucNo;
	private String bidderNick;
	private int bidMoney;
	
	
	public AAccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AAccountVO(int aucNo, String bidderNick, int bidMoney) {
		super();
		this.aucNo = aucNo;
		this.bidderNick = bidderNick;
		this.bidMoney = bidMoney;
	}


	public int getBidMoney() {
		return bidMoney;
	}
	public void setBidMoney(int bidMoney) {
		this.bidMoney = bidMoney;
	}
	public AAccountVO(int aucNo, String bidderNick) {
		super();
		this.aucNo = aucNo;
		this.bidderNick = bidderNick;
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
		return "AAccountVO [aucNo=" + aucNo + ", bidderNick=" + bidderNick + ", bidMoney=" + bidMoney + "]";
	}
	
	
	
	
	

}
