package News;

import java.util.Date;

public class NewsDTO {
	private int bno;
	private String title;
	private String content;
	private String Image;
	private Date writedate;
	
	public NewsDTO(int bno, String title, String content, String image, Date writedate) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.Image = image;
		this.writedate = writedate;
	}
	public NewsDTO() {
		
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
}
