package hafy.member.vo;

public class MemberVO {
	
	private String nickname;
	private String name;
	private String resNo;
	private String address1;
	private String address2;
	private String phoneCompany;
	private String phone;
	private String sex;
	private String tranzPwd;
	
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO(String nickname, String name, String resNo, String address1, String address2, String phoneCompany,
			String phone, String sex, String tranzPwd) {
		super();
		this.nickname = nickname;
		this.name = name;
		this.resNo = resNo;
		this.address1 = address1;
		this.address2 = address2;
		this.phoneCompany = phoneCompany;
		this.phone = phone;
		this.sex = sex;
		this.tranzPwd = tranzPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResNo() {
		return resNo;
	}
	public void setResNo(String resNo) {
		this.resNo = resNo;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhoneCompany() {
		return phoneCompany;
	}
	public void setPhoneCompany(String phoneCompany) {
		this.phoneCompany = phoneCompany;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTranzPwd() {
		return tranzPwd;
	}
	public void setTranzPwd(String tranzPwd) {
		this.tranzPwd = tranzPwd;
	}
	@Override
	public String toString() {
		return "MemberVO [nickname=" + nickname + ", name=" + name + ", resNo=" + resNo + ", address1=" + address1
				+ ", address2=" + address2 + ", phoneCompany=" + phoneCompany + ", phone=" + phone + ", sex=" + sex
				+ ", tranzPwd=" + tranzPwd + "]";
	}
	
	
	
	
	

	
	
	
	
	
	
	

}
