package kr.ac.kopo.board.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class BoardVO {
	
	private int no;
	
	@Length(min = 2, max = 100, message = "제목은 2글자 이상 이어야 함")
	@NotEmpty(message = "필수항목 입니다. 제목 입력하3")
	private String title;
	
	@Pattern(regexp = "^[a-zA-Z0-9]*$", message = "첫글자는 특수기호를 사용할 수 없숩니다.")
	@NotEmpty(message = "필수항목 입니다. 글쓴이 입력하3")
	private String writer;
	@NotEmpty(message = "필수항목 입니다. 내용 입력하3")
	private String content;
	private int viewCnt;
	private String regDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + "]";
	}
	
	
	

}
