package com.weddingform.invitation;

//청첩장 정보

public class InvitationDTO {
	
	private String id;
	private int num;
	private int image_num;
	private String m_name;
	private String w_name;
	private String m_tel;
	private String w_tel;
	private String wedding_date;
	private String wedding_addr;
	private String greeting;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getImage_num() {
		return image_num;
	}
	public void setImage_num(int image_num) {
		this.image_num = image_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getW_tel() {
		return w_tel;
	}
	public void setW_tel(String w_tel) {
		this.w_tel = w_tel;
	}
	public String getWedding_date() {
		return wedding_date;
	}
	public void setWedding_date(String wedding_date) {
		this.wedding_date = wedding_date;
	}
	public String getWedding_addr() {
		return wedding_addr;
	}
	public void setWedding_addr(String wedding_addr) {
		this.wedding_addr = wedding_addr;
	}
	public String getGreeting() {
		return greeting;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	
	
}
