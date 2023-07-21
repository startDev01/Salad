package com.proj.salad.user.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

/*CREATE TABLE shop_user (
		userId			varchar2(20)		NOT NULL  PRIMARY KEY, --유저아이디(기본키)
		userPwd			varchar2(200)		NOT NULL,   --유저비밀번호
		userName		varchar2(50)		NOT NULL, --유저이름
		userBirth		varchar2(20)		NOT NULL, --유저탄생일
		userGender	varchar2(20)		NOT NULL, --유저성별
		userEmail		varchar2(50)		NOT NULL, --유저이메일 
		userPhone		varchar2(20)		NOT NULL,  --유저연락처
		userAddress1		varchar2(200)		NOT NULL,  --유저기본주소	
		userAddress2	varchar2(200)		NULL  --유저상세주소
	); */
	
/*서승희 userVO*/
@Data
@Component("userVO")
public class UserVO {
	private String userId;
	private String userPwd;
	private String userName;
	private String userBirth;
	private String userGender;
	private String userEmail;
	private String userPhone;
	private String userAddress1;
	private String userAddress2;
	private String smssts_yn;        //SMS 수신동의 여부(23.07.20 추가)
	private String emailsts_yn;    //Email 수신동의 여부(23.07.20 추가)
}
