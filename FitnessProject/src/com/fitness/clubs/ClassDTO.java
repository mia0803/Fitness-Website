package com.fitness.clubs;

public class ClassDTO {
	private int c_id;
	private String c_day;
	private String title;
	private String teacher;
	private String c_time;
	private String club;
	private String time1;
	private String time2;
	private String time3;
	
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getC_time() {
		c_time = time1 + "-" + time2 + " " + time3;
		return c_time;
	}
	public void setC_time(String c_time) {
		String[] a = c_time.split("-");
		String[] b = a[1].split(" ");
		time1 = a[0];
		time2 = b[0];
		time3 = b[1];
	}
	public String getClub() {
		return club;
	}
	public void setClub(String club) {
		this.club = club;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getTime3() {
		String lc_time = time3.toLowerCase();
		return lc_time;
	}
	public void setTime3(String time3) {
		String uc_time3 = time3.toUpperCase();
		this.time3 = uc_time3;
	}
}
