package com.lcomputerstudy.example.domain;

public class SearchParam {

	private String searchOption = "";
	private String searchKeyword = "";
	
	public SearchParam() {
		
	}
	
	public SearchParam(String searchOption, String searchKeyword) {
		this.searchOption = searchOption;
		this.searchKeyword = searchKeyword;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
}
