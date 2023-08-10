package dto;

public class NoticeDTO {
	private int bno;
	private String title;
	private int w_date;
	private String content;
	private int count;
	
	public NoticeDTO(int bno, String title, int w_date, String content, int count) {
		this.bno = bno;
		this.title = title;
		this.w_date = w_date;
		this.content = content;
		this.count = count;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getW_date() {
		return w_date;
	}
	public void setW_date(int w_date) {
		this.w_date = w_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
