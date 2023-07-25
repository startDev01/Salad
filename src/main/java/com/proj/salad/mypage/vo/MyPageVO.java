package com.proj.salad.mypage.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

/*서승희 mypageVO*/
@Data
@Component("mypageVO")
public class MyPageVO {
	private String userId;  //유저아이디 외래키
	private String beginDate;
	private String endDate;
}
