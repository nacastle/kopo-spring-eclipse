package hafy.bid.vo;

public class NoticeVO {
	
	private int notiNo;
	private String notiMemberNick;
	private String notiType;
	private int notiContentNo;
	private String notiMsg;
	private String notiUrl;
	private String notiDatetime;
	private String notiReadDatetime;
	
	
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(String notiMemberNick, String notiType, int notiContentNo, String notiMsg) {
		super();
		this.notiMemberNick = notiMemberNick;
		this.notiType = notiType;
		this.notiContentNo = notiContentNo;
		this.notiMsg = notiMsg;
	}
	public int getNotiNo() {
		return notiNo;
	}
	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}
	public String getMemberNick() {
		return notiMemberNick;
	}
	public void setMemberNick(String memberNick) {
		this.notiMemberNick = memberNick;
	}
	public String getNotiType() {
		return notiType;
	}
	public void setNotiType(String notiType) {
		this.notiType = notiType;
	}
	public int getNotiContentNo() {
		return notiContentNo;
	}
	public void setNotiContentNo(int notiContentNo) {
		this.notiContentNo = notiContentNo;
	}
	public String getNotiMsg() {
		return notiMsg;
	}
	public void setNotiMsg(String notiMsg) {
		this.notiMsg = notiMsg;
	}
	public String getNotiUrl() {
		return notiUrl;
	}
	public void setNotiUrl(String notiUrl) {
		this.notiUrl = notiUrl;
	}
	public String getNotiDatetime() {
		return notiDatetime;
	}
	public void setNotiDatetime(String notiDatetime) {
		this.notiDatetime = notiDatetime;
	}
	public String getNotiReadDatetime() {
		return notiReadDatetime;
	}
	public void setNotiReadDatetime(String notiReadDatetime) {
		this.notiReadDatetime = notiReadDatetime;
	}
	@Override
	public String toString() {
		return "NoticeVO [notiNo=" + notiNo + ", notiMemberNick=" + notiMemberNick + ", notiType=" + notiType
				+ ", notiContentNo=" + notiContentNo + ", notiMsg=" + notiMsg + ", notiUrl=" + notiUrl
				+ ", notiDatetime=" + notiDatetime + ", notiReadDatetime=" + notiReadDatetime + "]";
	}
	
	


}
