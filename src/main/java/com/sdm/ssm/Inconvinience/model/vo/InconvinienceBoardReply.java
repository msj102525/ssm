package com.sdm.ssm.Inconvinience.model.vo;

import java.sql.Date;

public class InconvinienceBoardReply implements java.io.Serializable {
	private int boardNo;
	private String user;
	private Date writeDate;
	private String commentContent;
	
	public InconvinienceBoardReply(int boardNo, String user, Date writeDate, String commentContent) {
		super();
		this.boardNo = boardNo;
		this.user = user;
		this.writeDate = writeDate;
		this.commentContent = commentContent;
	}
	public InconvinienceBoardReply() {
		super();
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	@Override
	public String toString() {
		return "InconvinienceBoardReply [boardNo=" + boardNo + ", user=" + user + ", writeDate=" + writeDate
				+ ", commentContent=" + commentContent + "]";
	}
	
	
	
	

}
