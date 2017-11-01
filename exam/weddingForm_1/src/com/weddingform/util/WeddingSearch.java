package com.weddingform.util;

public class WeddingSearch {
	private String region;
	private String subway;
	private String type;
	private String meal_cost;
	private String meal_menu;
	private String visitor;
	private String hall_name;
	
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		if(region == null) {
			this.region = "|";
		} else {
			this.region = region;
		}
	}
	public String getSubway() {
		return subway;
	}
	public void setSubway(String subway) {
		if(subway == null) {
			this.subway = "|";
		} else {
			this.subway = subway;
		}
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		if(type == null) {
			this.type = "|";
		} else {
			this.type = type;
		}
	}
	public String getMeal_cost() {
		return meal_cost;
	}
	public void setMeal_cost(String meal_cost) {
		if(meal_cost == null) {
			this.meal_cost = "|";
		} else {
			this.meal_cost = meal_cost;
		}
	}
	public String getMeal_menu() {
		return meal_menu;
	}
	public void setMeal_menu(String meal_menu) {
		if(meal_menu == null) {
			this.meal_menu = "|";
		} else {
			this.meal_menu = meal_menu;
		}
	}
	public String getVisitor() {
		return visitor;
	}
	public void setVisitor(String visitor) {
		if(visitor == null) {
			this.visitor = "|";
		} else {
			this.visitor = visitor;
		}
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		if(hall_name == null) {
			this.hall_name = "|";
		} else {
			this.hall_name = hall_name;
		}
	}
	
	
}
