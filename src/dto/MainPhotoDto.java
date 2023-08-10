package dto;

public class MainPhotoDto {
	private int bno;
	private String round;
	private String title;
	private String r_date;
	private String image;
	private String league;
	private String category;

	public MainPhotoDto(int bno, String round, String title, String r_date, String image, String league, String category) {
		super();
		this.bno = bno;
		this.round = round;
		this.title = title;
		this.r_date = r_date;
		this.image = image;
		this.league = league;
		this.category = category;
	}
	

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLeague() {
		return league;
	}

	public void setLeague(String league) {
		this.league = league;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
}
