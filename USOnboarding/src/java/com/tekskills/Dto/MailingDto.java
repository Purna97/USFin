package com.tekskills.Dto;

import java.util.List;

public class MailingDto {
	private String message;
	private String frommail;
	private String toamil;
	private String fromname;
	private String toname;
	private String subject;
	private String comments;
	private String content;
	private String password;
	private String username;
	List<String> cclist;
	public List<String> getCclist() {
		return cclist;
	}
	public void setCclist(List<String> cclist) {
		this.cclist = cclist;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getFrommail() {
		return frommail;
	}
	public void setFrommail(String frommail) {
		this.frommail = frommail;
	}
	public String getToamil() {
		return toamil;
	}
	public void setToamil(String toamil) {
		this.toamil = toamil;
	}
	public String getFromname() {
		return fromname;
	}
	public void setFromname(String fromname) {
		this.fromname = fromname;
	}
	public String getToname() {
		return toname;
	}
	public void setToname(String toname) {
		this.toname = toname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
