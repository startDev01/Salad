package com.proj.salad.review.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {

	private int level;
	private int re_articleNO;
	private int re_parentNO;
	private String userId;
	private String re_title;
	private String re_content;
	private Date re_writeDate;
	private String re_noti;
	private int re_viewCnt;
	private List<Review_imageVO> re_imageFileList;
	
	//getter,setter
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getRe_articleNO() {
		return re_articleNO;
	}

	public void setRe_articleNO(int re_articleNO) {
		this.re_articleNO = re_articleNO;
	}

	public int getRe_parentNO() {
		return re_parentNO;
	}

	public void setRe_parentNO(int re_parentNO) {
		this.re_parentNO = re_parentNO;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Date getRe_writeDate() {
		return re_writeDate;
	}

	public void setRe_writeDate(Date re_writeDate) {
		this.re_writeDate = re_writeDate;
	}

	public String getRe_noti() {
		return re_noti;
	}

	public void setRe_noti(String re_noti) {
		this.re_noti = re_noti;
	}

	public int getRe_viewCnt() {
		return re_viewCnt;
	}

	public void setRe_viewCnt(int re_viewCnt) {
		this.re_viewCnt = re_viewCnt;
	}

	public List<Review_imageVO> getre_imageFileList() {
		return re_imageFileList;
	}

	public void setRe_imageFileList(List<Review_imageVO> imageFileList) {
		this.re_imageFileList = imageFileList;
	}
	
	//toString
	@Override
	public String toString() {
		return "ReviewVO [level=" + level + ", re_articleNO=" + re_articleNO + ", re_parentNO=" + re_parentNO
				+ ", userId=" + userId + ", re_title=" + re_title + ", re_content=" + re_content + ", re_writeDate="
				+ re_writeDate + ", re_noti=" + re_noti + ", re_viewCnt=" + re_viewCnt + ", re_imageFileList="
				+ re_imageFileList + "]";
	}
	
}
