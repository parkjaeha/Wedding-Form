package com.weddingform.reservation;

import com.weddingform.member.MemberDTO;

//예약하기

public class ReservationDTO {

	private String id;
	private String pre_date;
	private String pre_region;
	private String contents;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPre_date() {
		return pre_date;
	}
	public void setPre_date(String pre_date) {
		this.pre_date = pre_date;
	}
	public String getPre_region() {
		return pre_region;
	}
	public void setPre_region(String pre_region) {
		this.pre_region = pre_region;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	
	
}
