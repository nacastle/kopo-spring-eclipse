package hafy.aucGoods.vo;

public class ReturnGoodsVO {
	
	private int aucNo;
	private String title;
	private String detail;
	private String writer;
	private String regDate;
	
	public ReturnGoodsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReturnGoodsVO(int aucNo, String title, String detail, String writer, String regDate) {
		super();
		this.aucNo = aucNo;
		this.title = title;
		this.detail = detail;
		this.writer = writer;
		this.regDate= regDate;
	}
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getAucNo() {
		return aucNo;
	}

	public void setAucNo(int aucNo) {
		this.aucNo = aucNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "ReturnGoodsVO [aucNo=" + aucNo + ", title=" + title + ", detail=" + detail + ", writer=" + writer
				+ ", regDate=" + regDate + "]";
	}

	
	

}
