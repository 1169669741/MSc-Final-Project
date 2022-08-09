package com.boot.security.server.model;

import java.util.Date;

public class Paper extends BaseEntity<Long> {

	private String author;
	private String docLocation;
	private String keyword;
	private String pabstract;
	private String paperId;
	private String source;
	private String studentId;
	private String title;
	private Date uploadingTime;

	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDocLocation() {
		return docLocation;
	}
	public void setDocLocation(String docLocation) {
		this.docLocation = docLocation;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPabstract() {
		return pabstract;
	}
	public void setPabstract(String pabstract) {
		this.pabstract = pabstract;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getUploadingTime() {
		return uploadingTime;
	}
	public void setUploadingTime(Date uploadingTime) {
		this.uploadingTime = uploadingTime;
	}

}
