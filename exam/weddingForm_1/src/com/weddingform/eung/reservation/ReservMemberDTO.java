package com.weddingform.eung.reservation;

public class ReservMemberDTO {
	private String id;
	private String female;
	private String male;
	private String hall_name;
	private String reserv_date;
	private String reserv_time;
	private String contents;
	private String company_id;
	private String confirm;
	private String tel;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFemale() {
		return female;
	}
	public void setFemale(String female) {
		this.female = female;
	}
	public String getMale() {
		return male;
	}
	public void setMale(String male) {
		this.male = male;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
	public String getReserv_time() {
		return reserv_time;
	}
	public void setReserv_time(String reserv_time) {
		this.reserv_time = reserv_time;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	
}
