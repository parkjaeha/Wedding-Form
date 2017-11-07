package com.weddingform.company;

import com.weddingform.common.CommonDTO;

//업체 정보

public class CompanyDTO extends CommonDTO{

	private String id;
	private String company_name;
	private String company_tel;
	private String company_number;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getCompany_number() {
		return company_number;
	}
	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

	
	
}
