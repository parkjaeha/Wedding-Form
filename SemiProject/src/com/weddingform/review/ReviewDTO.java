package com.weddingform.review;

import com.weddingform.Board.BoardDTO;

//후기 

public class ReviewDTO extends BoardDTO{

	private int num;
	private int star_score;
	private String type;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStar_score() {
		return star_score;
	}
	public void setStar_score(int star_score) {
		this.star_score = star_score;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
