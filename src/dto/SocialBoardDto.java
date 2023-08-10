package dto;

public class SocialBoardDto {
	private int bno;
	private String writer;
	private String title;
	private String content;
	private int rNum;
	private String wDate;
	private int good;
	private int bad;
	private int rno;
	private String rContent;
	private String rWriter;
	private int step;
	private int rOrder;
	private int ref;
	private String rwDate;
	private String name;
	private String nickName;
	
	public SocialBoardDto(int bno, String writer, String title, String content, int rNum, String wDate, int good,
			int bad, int rno, String rContent, String rWriter, int step, int rOrder, int ref, String rwDate,
			String name, String nickName) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.rNum = rNum;
		this.wDate = wDate;
		this.good = good;
		this.bad = bad;
		this.rno = rno;
		this.rContent = rContent;
		this.rWriter = rWriter;
		this.step = step;
		this.rOrder = rOrder;
		this.ref = ref;
		this.rwDate = rwDate;
		this.name = name;
		this.nickName = nickName;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public void setContent(String contetnt) {
		this.content = contetnt;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getrOrder() {
		return rOrder;
	}

	public void setrOrder(int rOrder) {
		this.rOrder = rOrder;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getRwDate() {
		return rwDate;
	}

	public void setRwDate(String rwDate) {
		this.rwDate = rwDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	
	
	
	
}
