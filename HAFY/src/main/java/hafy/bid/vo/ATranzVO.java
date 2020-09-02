package hafy.bid.vo;

public class ATranzVO {
	
	private int aucNo;
	private String tranzDate;
	private String tranzAccountNo;
	private int tranzMoney;
	private int memberBalance;
	private String tranzMemberNick;
	private String tranzType;
	
	
	
	
	public ATranzVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ATranzVO(int aucNo, String tranzDate, String tranzAccountNo, int tranzMoney, String tranzMemberNick,
			String tranzType) {
		super();
		this.aucNo = aucNo;
		this.tranzDate = tranzDate;
		this.tranzAccountNo = tranzAccountNo;
		this.tranzMoney = tranzMoney;
		this.tranzMemberNick = tranzMemberNick;
		this.tranzType = tranzType;
	}
	public ATranzVO(int aucNo, String tranzDate, String tranzAccountNo, int tranzMoney, int memberBalance,
			String tranzMemberNick, String tranzType) {
		super();
		this.aucNo = aucNo;
		this.tranzDate = tranzDate;
		this.tranzAccountNo = tranzAccountNo;
		this.tranzMoney = tranzMoney;
		this.memberBalance = memberBalance;
		this.tranzMemberNick = tranzMemberNick;
		this.tranzType = tranzType;
	}
	public int getAucNo() {
		return aucNo;
	}
	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}
	public String getTranzAccountNo() {
		return tranzAccountNo;
	}
	public void setTranzAccountNo(String tranzAccountNo) {
		this.tranzAccountNo = tranzAccountNo;
	}
	public int getTranzMoney() {
		return tranzMoney;
	}
	public void setTranzMoney(int tranzMoney) {
		this.tranzMoney = tranzMoney;
	}
	public String getTranzMemberNick() {
		return tranzMemberNick;
	}
	public void setTranzMemberNick(String tranzMemberNick) {
		this.tranzMemberNick = tranzMemberNick;
	}
	public String getTranzType() {
		return tranzType;
	}
	public void setTranzType(String tranzType) {
		this.tranzType = tranzType;
	}
	
	public String getTranzDate() {
		return tranzDate;
	}
	public void setTranzDate(String tranzDate) {
		this.tranzDate = tranzDate;
	}
	public int getMemberBalance() {
		return memberBalance;
	}
	public void setMemberBalance(int memberBalance) {
		this.memberBalance = memberBalance;
	}
	@Override
	public String toString() {
		return "ATranzVO [aucNo=" + aucNo + ", tranzDate=" + tranzDate + ", tranzAccountNo=" + tranzAccountNo
				+ ", tranzMoney=" + tranzMoney + ", memberBalance=" + memberBalance + ", tranzMemberNick="
				+ tranzMemberNick + ", tranzType=" + tranzType + "]";
	}
	
	
	

}
