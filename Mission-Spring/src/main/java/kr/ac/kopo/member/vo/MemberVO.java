package kr.ac.kopo.member.vo;

public class MemberVO {
	
	private String id;
	private String password;
//	private String type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
//	public String getType() {
//		return type;
//	}
//	public void setType(String type) {
//		this.type = type;
//	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + "]";
	}
	
	
	
	

}
