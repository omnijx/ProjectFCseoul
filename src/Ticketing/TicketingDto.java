package Ticketing;

import java.util.ArrayList;

public class TicketingDto {
	String section;
	String round;
	String sold_out;
	int x_start;
	int x_end;
	int y_start;
	int y_end;

	public TicketingDto(String section, String sold_out,int x_start, int x_end, int y_start, int y_end, String round) {
		super();
		this.section = section;
		this.sold_out = sold_out;
		this.x_start = x_start;
		this.x_end = x_end;
		this.y_start = y_start;
		this.y_end = y_end;
		this.round = round;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getSold_out() {
		return sold_out;
	}
	public void setSold_out(String sold_out) {
		this.sold_out = sold_out;
	}
	public int getX_start() {
		return x_start;
	}
	public void setX_start(int x_start) {
		this.x_start = x_start;
	}
	public int getX_end() {
		return x_end;
	}
	public void setX_end(int x_end) {
		this.x_end = x_end;
	}
	public int getY_start() {
		return y_start;
	}
	public void setY_start(int y_start) {
		this.y_start = y_start;
	}
	public int getY_end() {
		return y_end;
	}
	public void setY_end(int y_end) {
		this.y_end = y_end;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
}
