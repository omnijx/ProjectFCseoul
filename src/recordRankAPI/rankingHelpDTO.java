package recordRankAPI;

public class rankingHelpDTO {
	private int rank;
	private String name;
	private String team;
	private int assist;
	private int games;
	private int num_replace;
	private int assist_game;
	private int year;
	public rankingHelpDTO(int rank, String name, String team, int assist, int games, int num_replace, int assist_game,
			int year) {
		super();
		this.rank = rank;
		this.name = name;
		this.team = team;
		this.assist = assist;
		this.games = games;
		this.num_replace = num_replace;
		this.assist_game = assist_game;
		this.year = year;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public int getAssist() {
		return assist;
	}
	public void setAssist(int assist) {
		this.assist = assist;
	}
	public int getGames() {
		return games;
	}
	public void setGames(int games) {
		this.games = games;
	}
	public int getNum_replace() {
		return num_replace;
	}
	public void setNum_replace(int num_replace) {
		this.num_replace = num_replace;
	}
	public int getAssist_game() {
		return assist_game;
	}
	public void setAssist_game(int assist_game) {
		this.assist_game = assist_game;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
}
