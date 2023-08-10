package dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MatchDBDto {
	private String competition;
	private String round;
	private Date m_date;
	private String stadium;
	private String home_name;
	private String home_logo;
	private int home_harf;
	private int home_s_harf;
	private int home_fulltime;
	private String home_winner;
	private String away_name;
	private String away_logo;
	private int away_harf;
	private int away_s_harf;
	private int away_fulltime;
	private String away_winner;
	private String is_home;

//	private String is_game;

	private String match_fin;

	public MatchDBDto(String competition, String round, Date m_date2, String stadium, String home_name,
			String home_logo, int home_harf, int home_s_harf, int home_fulltime, String home_winner, String away_name,
			String away_logo, int away_harf, int away_s_harf, int away_fulltime, String away_winner, String is_home,
			 String match_fin) {
		this.competition = competition;
		this.round = round;
		this.m_date = m_date2;
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
//		this.is_game = is_game;
		this.match_fin = match_fin;
	}

	public String getCompetition() {
		return competition;
	}

	public void setCompetition(String competition) {
		this.competition = competition;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
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

	public int getHome_harf() {
		return home_harf;
	}

	public void setHome_harf(int home_harf) {
		this.home_harf = home_harf;
	}

	public int getHome_s_harf() {
		return home_s_harf;
	}

	public void setHome_s_harf(int home_s_harf) {
		this.home_s_harf = home_s_harf;
	}

	public int getHome_fulltime() {
		return home_fulltime;
	}

	public void setHome_fulltime(int home_fulltime) {
		this.home_fulltime = home_fulltime;
	}

	public String getHome_winner() {
		return home_winner;
	}

	public void setHome_winner(String home_winner) {
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

	public int getAway_harf() {
		return away_harf;
	}

	public void setAway_harf(int away_harf) {
		this.away_harf = away_harf;
	}

	public int getAway_s_harf() {
		return away_s_harf;
	}

	public void setAway_s_harf(int away_s_harf) {
		this.away_s_harf = away_s_harf;
	}

	public int getAway_fulltime() {
		return away_fulltime;
	}

	public void setAway_fulltime(int away_fulltime) {
		this.away_fulltime = away_fulltime;
	}

	public String getAway_winner() {
		return away_winner;
	}

	public void setAway_winner(String away_winner) {
		this.away_winner = away_winner;
	}

	public String getIs_home() {
		return is_home;
	}

	public void setIs_home(String is_home) {
		this.is_home = is_home;
	}

//	public String getIs_game() {
//		return is_game;
//	}
//
//	public void setIs_game(String is_game) {
//		this.is_game = is_game;
//	}

	public String getMatch_fin() {
		return match_fin;
	}

	public void setMatch_fin(String match_fin) {
		this.match_fin = match_fin;
	}

	
	
	
}
