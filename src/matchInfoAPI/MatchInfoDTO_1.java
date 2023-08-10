package matchInfoAPI;

public class MatchInfoDTO_1 {
	private String competition;
	private String round;
	private String m_date;
	private String stadium;
	private String home_name;
	private String home_logo;
	private Object home_harf;
	private Object home_s_harf;
	private Object home_fulltime;
	private Object home_winner;
	private String away_name;
	private String away_logo;
	private Object away_harf;
	private Object away_s_harf;
	private Object away_fulltime;
	private Object away_winner;
	private String is_home;
	public String getCompetition() {
		return competition;
	}
	
	public MatchInfoDTO_1(String competition, String round, String m_date, String stadium, String home_name,
			String home_logo, Object home_harf, Object home_s_harf, Object home_fulltime, Object home_winner,
			String away_name, String away_logo, Object away_harf, Object away_s_harf, Object away_fulltime,
			Object away_winner, String is_home) {
		super();
		this.competition = competition;
		this.round = round;
		this.m_date = m_date;
		this.stadium = stadium;
		this.home_name = home_name;
		this.home_logo = home_logo;
		this.home_harf = home_harf;
		this.home_s_harf = home_s_harf;
		this.home_fulltime = home_fulltime;
		this.home_winner = home_winner;
		this.away_name = away_name;
		this.away_logo = away_logo;
		this.away_harf = away_harf;
		this.away_s_harf = away_s_harf;
		this.away_fulltime = away_fulltime;
		this.away_winner = away_winner;
		this.is_home = is_home;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getStadium() {
		return stadium;
	}

	public void setStadium(String stadium) {
		this.stadium = stadium;
	}

	public String getHome_name() {
		return home_name;
	}

	public void setHome_name(String home_name) {
		this.home_name = home_name;
	}

	public String getHome_logo() {
		return home_logo;
	}

	public void setHome_logo(String home_logo) {
		this.home_logo = home_logo;
	}

	public Object getHome_harf() {
		return home_harf;
	}

	public void setHome_harf(Object home_harf) {
		this.home_harf = home_harf;
	}

	public Object getHome_s_harf() {
		return home_s_harf;
	}

	public void setHome_s_harf(Object home_s_harf) {
		this.home_s_harf = home_s_harf;
	}

	public Object getHome_fulltime() {
		return home_fulltime;
	}

	public void setHome_fulltime(Object home_fulltime) {
		this.home_fulltime = home_fulltime;
	}

	public Object getHome_winner() {
		return home_winner;
	}

	public void setHome_winner(Object home_winner) {
		this.home_winner = home_winner;
	}

	public String getAway_name() {
		return away_name;
	}

	public void setAway_name(String away_name) {
		this.away_name = away_name;
	}

	public String getAway_logo() {
		return away_logo;
	}

	public void setAway_logo(String away_logo) {
		this.away_logo = away_logo;
	}

	public Object getAway_harf() {
		return away_harf;
	}

	public void setAway_harf(Object away_harf) {
		this.away_harf = away_harf;
	}

	public Object getAway_s_harf() {
		return away_s_harf;
	}

	public void setAway_s_harf(Object away_s_harf) {
		this.away_s_harf = away_s_harf;
	}

	public Object getAway_fulltime() {
		return away_fulltime;
	}

	public void setAway_fulltime(Object away_fulltime) {
		this.away_fulltime = away_fulltime;
	}

	public Object getAway_winner() {
		return away_winner;
	}

	public void setAway_winner(Object away_winner) {
		this.away_winner = away_winner;
	}

	public String getIs_home() {
		return is_home;
	}

	public void setIs_home(String is_home) {
		this.is_home = is_home;
	}

	public void setCompetition(String competition) {
		this.competition = competition;
	}

	
}
