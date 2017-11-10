package com.weddingform.extra;

import com.weddingform.common.CommonDTO;

// 회원 가입시 추가 정보

public class ExtraDTO extends CommonDTO{

	private String id;
	private String region;
	private String type;
	private String meal_cost;
	private String meal_menu;
	private String visitor;
	private String subway;
	private String hall_cost;
	private String hall_name;
	
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
