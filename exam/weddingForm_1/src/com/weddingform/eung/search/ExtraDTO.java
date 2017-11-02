package com.weddingform.eung.search;

public class ExtraDTO {

	private String id;				// ID
	private String region;			// 웨딩홀 지역		- 서울시 강남구
	private String type;			// 웨딩 타입 		- 일반, 야외, 하우스
	private String meal_cost;			// 식사 가격
	private String meal_menu;		// 식사 메뉴 		- 양식, 일식, 한식
	private String visitor;			// 하객수
	private String subway;			// 인근 지하철 	- 2호선 역삼역
	private String hall_cost;			// 홀 가격
	private String hall_name;		// 홀 이름
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMeal_cost() {
		return meal_cost;
	}
	public void setMeal_cost(String meal_cost) {
		this.meal_cost = meal_cost;
	}
	public String getMeal_menu() {
		return meal_menu;
	}
	public void setMeal_menu(String meal_menu) {
		this.meal_menu = meal_menu;
	}
	public String getVisitor() {
		return visitor;
	}
	public void setVisitor(String visitor) {
		this.visitor = visitor;
	}
	public String getSubway() {
		return subway;
	}
	public void setSubway(String subway) {
		this.subway = subway;
	}
	public String getHall_cost() {
		return hall_cost;
	}
	public void setHall_cost(String hall_cost) {
		this.hall_cost = hall_cost;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}

	
}
