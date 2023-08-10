package Ticketing;

import java.sql.*;

public class homeMatchDto {
	String home_name;
	String home_logo;
	String away_name;
	String away_logo;
	String stadium;
	String date;
	public homeMatchDto(String home_name, String home_logo, String away_name, String away_logo, String stadium,
			String date) {
		super();
		this.home_name = home_name;
		this.home_logo = home_logo;
		this.away_name = away_name;
		this.away_logo = away_logo;
		this.stadium = stadium;
		this.date = date;
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
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
