package matchInfoAPI;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class MatchInfoDto2 {
	private String competition;
	private String round;
	private String m_date;
	private String stadium;
	private String home_name;
	private String home_logo;
	private String home_harf;
	private String home_s_harf;
	private String home_fulltime;
	private String home_winner;
	private String away_name;
	private String away_logo;
	private String away_harf;
	private String away_s_harf;
	private String away_fulltime;
	private String away_winner;
	private String is_home;
	private boolean is_game;
	public MatchInfoDto2(/*
						 * String competiton , String round , String m_date, String stadium, String
						 * home_name, String home_logo, String home_harf, String home_fulltime, String
						 * home_winner, String away_name, String away_logo, String away_harf, String
						 * away_fulltime, String away_winner
						 */) {
		System.out.println("MemberVO 생성자 호출");
	}

	public String getcompetiton() {
		return competition;
	}

	public void setcompetiton(String competiton) {
		this.competition = competiton;
	}
	
	public String getround() {
		return round;
	}
	
	public void setround(String round) {
		this.round = round;
	}
	
	public String getm_date() {
		return m_date;
	}
	
	public void setm_date(String m_date) {
		StringBuffer sb = new StringBuffer();
		sb.append(m_date);
		int count = 0;
		while(count < 6) {
			sb.deleteCharAt(sb.length()-1);
			count++;
		}
    	String datere = sb.toString();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss", Locale.KOREA);
    	LocalDateTime dateTime = LocalDateTime.parse(datere, formatter);
    	LocalDateTime nineHoursAfterLocalTime = dateTime.plusHours(9);
    	String dateT = nineHoursAfterLocalTime.toString();
    	String result = dateT.replace('T', ' ');
    	System.out.println(result);
		this.m_date = result;
	}

	public String getstadium() {
		return stadium;
	}

	public void setstadium(String stadium) {
		this.stadium = stadium;
	}
	
	public String gethome_name() {
		return home_name;
	}
	
	public void sethome_name(String home_name) {
		this.home_name = home_name;
	}

	public String gethome_logo() {
		return home_logo;
	}

	public void sethome_logo(String home_logo) {
		this.home_logo = home_logo;
	}
	
	public String gethome_harf() {
		return home_harf;
	}
	
	public void sethome_harf(String home_harf) {
		this.home_harf = home_harf;
	}
	
	public String gethome_s_harf() {
		return home_s_harf;
	}
	
	public void sethome_s_harf(String home_s_harf) {
		this.home_s_harf = home_s_harf;
	}
	
	public String gethome_fulltime() {
		return home_fulltime;
	}
	
	public void sethome_fulltime(String home_fulltime) {
		this.home_fulltime = home_fulltime;
	}
	
	public String gethome_winner() {
		return home_winner;
	}
	
	public void sethome_winner(Object home_winner) {
		if(Objects.isNull(home_winner)) {
			this.home_winner = "무";
		}else {
			if(home_winner.toString().equals("true")) {
				this.home_winner = "승";
			}
			else {
				this.home_winner = "패";
			}
		}
	}
	
	public String getaway_name() {
		return away_name;
	}
	public void setaway_name(String away_name) {
		this.away_name = away_name;
	}

	public String getaway_winner() {
		return away_winner;
	}
	public void setaway_winner(Object away_winner) {
		if(Objects.isNull(away_winner)) {
			this.away_winner = "무";
		}else {
			if(away_winner.toString().equals("true")) {
				this.away_winner = "승";
			}
			else {
				this.away_winner = "패";
			}
		}
	}
	
	public String getaway_logo() {
		return away_logo;
	}
	
	public void setaway_logo(String away_logo) {
		this.away_logo = away_logo;
	}
	
	public String getaway_harf() {
		return away_harf;
	}
	
	public void setaway_harf(String away_harf) {
		this.away_harf = away_harf;
	}
	
	public String getaway_s_harf() {
		return away_s_harf;
	}
	
	public void setaway_s_harf(String away_s_harf) {
		this.away_s_harf = away_s_harf;
	}
	
	public String getaway_fulltime() {
		return away_fulltime;
	}
	
	public void setaway_fulltime(String away_fulltime) {
		this.away_fulltime = away_fulltime;
	}
	
	public String getis_home() {
		return is_home;
	}
	
	public void setis_home(String is_home) {
		if(is_home.equals("FC Seoul")) {
			this.is_home = "True";
		}else {
			this.is_home = "False";
		}
		System.out.println("sethome : " + is_home);
	}
	public boolean isIs_game() {
		return is_game;
	}
	public void setIs_game(String is_game) {
		if(is_game.equals("Match Finished")) {
			this.is_game = true;
		}else {
			this.is_game = false;
		}
	}
	
	}