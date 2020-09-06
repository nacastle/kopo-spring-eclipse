package hafy.aucGoods.vo;

public class CodeVO {
	
	private int codeNo;
	private String codeName;
	private String codeCategory;
	private String uriName;
	private String usage;
	
	
	public CodeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CodeVO(int codeNo, String codeName, String codeCategory, String uriName, String usage) {
		super();
		this.codeNo = codeNo;
		this.codeName = codeName;
		this.codeCategory = codeCategory;
		this.uriName = uriName;
		this.usage = usage;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeCategory() {
		return codeCategory;
	}
	public void setCodeCategory(String codeCategory) {
		this.codeCategory = codeCategory;
	}
	public String getUriName() {
		return uriName;
	}
	public void setUriName(String uriName) {
		this.uriName = uriName;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	@Override
	public String toString() {
		return "CodeVO [codeNo=" + codeNo + ", codeName=" + codeName + ", codeCategory=" + codeCategory + ", uriName="
				+ uriName + ", usage=" + usage + "]";
	}
	
	
	
	
	

}
