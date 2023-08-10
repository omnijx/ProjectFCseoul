package dto;

//RANK
//TEAM
//GAMES
//POINT
//WIN
//DRAW
//LOSE
//GOALS
//CONCED
//GOALS_DIFF
//TEAM_LOGO
//YEAR
public class RankDto {
	private int rank;
	private String team;
	private int games;
	private int point;
	private int win;
	private int draw;
	private int lose;
	private int goals;
	private int conced;
	private int goals_diff;
	private String team_logo;
	private int year;
	public RankDto(int rank, String team, int games, int point, int win, int draw, int lose, int goals, int conced,
			int goals_diff, String team_logo, int year) {
		super();
		this.rank = rank;
		this.team = team;
		this.games = games;
		this.point = point;
		this.win = win;
		this.draw = draw;
		this.lose = lose;
		this.goals = goals;
		this.conced = conced;
		this.goals_diff = goals_diff;
		this.team_logo = team_logo;
		this.year = year;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public int getGames() {
		return games;
	}
	public void setGames(int games) {
		this.games = games;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getGoals() {
		return goals;
	}
	public void setGoals(int goals) {
		this.goals = goals;
	}
	public int getConced() {
		return conced;
	}
	public void setConced(int conced) {
		this.conced = conced;
	}
	public int getGoals_diff() {
		return goals_diff;
	}
	public void setGoals_diff(int goals_diff) {
		this.goals_diff = goals_diff;
	}
	public String getTeam_logo() {
		return team_logo;
	}
	public void setTeam_logo(String team_logo) {
		this.team_logo = team_logo;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	
}
