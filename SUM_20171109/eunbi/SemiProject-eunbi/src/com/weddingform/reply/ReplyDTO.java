package com.weddingform.reply;

import com.weddingform.Board.BoardDTO;

public class ReplyDTO extends BoardDTO{
 private int num;
 private int ref;
 private int step;
 private int depth;
 private int reviewNum;
 private String type;
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public int getReviewNum() {
	return reviewNum;
}
public void setReviewNum(int reviewNum) {
	this.reviewNum = reviewNum;
}
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
}
