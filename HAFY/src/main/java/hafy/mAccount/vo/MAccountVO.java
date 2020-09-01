package hafy.mAccount.vo;

public class MAccountVO {
	
	private String bank;
	private String accountNo;
	private String memberNick; // 회원의 닉네임
	private int balance;
	
	
	
	public MAccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MAccountVO(String bank, String accountNo, String memberNick, int balance) {
		super();
		this.bank = bank;
		this.accountNo = accountNo;
		this.memberNick = memberNick;
		this.balance = balance;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	@Override
	public String toString() {
		return "MAccountVO [bank=" + bank + ", accountNo=" + accountNo + ", memberNick=" + memberNick + "]";
	}
	
	
	

}
