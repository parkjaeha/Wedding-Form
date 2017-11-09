package com.weddingform.qna;

import com.weddingform.Board.BoardDTO;

//질문 게시판

public class QnaDTO extends BoardDTO{

	private int num;
	private int ref;
	private int step;
	private int depth;
	private String password;
	private String opencheck;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOpencheck() {
		return opencheck;
	}
	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}
	
	
}
