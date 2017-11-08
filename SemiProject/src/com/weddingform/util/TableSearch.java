package com.weddingform.util;

//sql조회시 사용

public class TableSearch {
	private String kind;
	private String search;
	
	public String getKind() {
		if(kind==null) {
			return "title";
		}else {
			return kind;
		}
	}
	
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public String getSearch() {
		if(search==null) {
			return "";
		}else {
			return search;
		}
	}
	
	public void setSearch(String search) {
		this.search = search;
	}
	
}
