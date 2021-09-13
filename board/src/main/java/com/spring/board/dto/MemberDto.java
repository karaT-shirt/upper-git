package com.spring.board.dto;

public class MemberDto {
	String account_id;
	String account_pw;
	String account_name;
	
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getAccount_pw() {
		return account_pw;
	}
	public void setAccount_pw(String account_pw) {
		this.account_pw = account_pw;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
}
