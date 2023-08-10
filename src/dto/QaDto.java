package dto;

public class QaDto {
	private int bno;
	private String category;
	private String title;
	private String content;
	private String wirter;
	private String w_date;
	private String open;
	private String answer;
	private String a_content;
	private String name;
	
	public QaDto(String name,String wirter) {
		this.name = name;
		this.wirter = wirter;
	}
	public QaDto(int bno, String category, String title, String content, String wirter, String w_date, String open,String name) {
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.wirter = wirter;
		this.w_date = w_date;
		this.open = open;
		this.name = name;
	}
	public QaDto(int bno ,String category,String title,String content,String w_date,String open) {
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.w_date = w_date;
		this.open = open;
	}
	public QaDto(int bno, String category, String title, String content, String wirter, String w_date, String open,
			String answer, String a_content) {
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.wirter = wirter;
		this.w_date = w_date;
		this.open = open;
		this.answer = answer;
		this.a_content = a_content;
	}
	
	public QaDto(int bno, String category, String title, String content, String wirter, String w_date, String open,
			String answer, String a_content,String name) {
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.content = content;
		this.wirter = wirter;
		this.w_date = w_date;
		this.open = open;
		this.answer = answer;
		this.a_content = a_content;
		this.name = name;
	}
	
	// 조인한 이름 가지고 오기
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getWirter() {
		return wirter;
	}
	public void setWirter(String wirter) {
		this.wirter = wirter;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	
	
}
