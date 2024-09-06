package com.lcomputerstudy.example.domain;

import java.util.List;

public class Comment {

	private int cId;			//c_id pk
	private String cContent;	//c_content
	private String cWriter;		//c_writer
	private String cDatetime;	//c_datetime
	private int bId;			//b_id
	private String username;	//u_id
	private int parentId;		//parent_id
	private int group;			//어느 댓글에 속하는가
	private int order;			//한 댓글에서 몇번째에 해당하는가(Ex 부모댓(1) 대댓(2) 대댓의 대댓(3) 새로운대댓(4) 이런식)
	private int depth;			//메인(0) 대댓글(1) 대댓글의 대댓글(2) ... 이런식으로 증가
	
	private List<Comment> replies; //대댓글 리스트를 저장할 필드
	
	
	public List<Comment> getReplies() {
		return replies;
	}
	public void setReplies(List<Comment> replies) {
		this.replies = replies;
	}
	
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcWriter() {
		return cWriter;
	}
	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}
	public String getcDatetime() {
		return cDatetime;
	}
	public void setcDatetime(String cDatetime) {
		this.cDatetime = cDatetime;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	
}
