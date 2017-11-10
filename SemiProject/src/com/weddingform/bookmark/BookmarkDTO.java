package com.weddingform.bookmark;

//즐겨찾기

public class BookmarkDTO {

	private String id;
	private int invitation_num;
	private int wadding_num;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getInvitation_num() {
		return invitation_num;
	}
	public void setInvitation_num(int invitation_num) {
		this.invitation_num = invitation_num;
	}
	public int getWadding_num() {
		return wadding_num;
	}
	public void setWadding_num(int wadding_num) {
		this.wadding_num = wadding_num;
	}
	
}
