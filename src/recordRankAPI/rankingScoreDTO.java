package recordRankAPI;

public class rankingScoreDTO {
	private int rank;
	private String name;
	private String team;
	private int goals;
	private int games;
	private int num_replace;
	private int goals_game;
	private int year;
	public rankingScoreDTO(int rank, String name, String team, int goals, int games, int num_replace, int goals_game,
			int year) {
		super();
		this.rank = rank;
		this.name = name;
		this.team = team;
		this.goals = goals;
		this.games = games;
		this.num_replace = num_replace;
		this.goals_game = goals_game;
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
	public int getGoals() {
		return goals;
	}
	public void setGoals(int assist) {
		this.goals = goals;
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
	public int getgoals_game() {
		return goals_game;
	}
	public void setgoals_game(int assist_game) {
		this.goals_game = assist_game;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
}
