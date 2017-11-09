package com.weddingform.member;

import com.weddingform.common.CommonDTO;

//사용자 정보

public class MemberDTO extends CommonDTO{

	private String id;
	private String birth;
	private String gender;
	private String wedding_day;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWedding_day() {
		return wedding_day;
	}
	public void setWedding_day(String wedding_day) {
		this.wedding_day = wedding_day;
	}
	
}
