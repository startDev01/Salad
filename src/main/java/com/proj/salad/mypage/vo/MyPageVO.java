package com.proj.salad.mypage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

/*서승희 mypageVO*/
@Data
@Component("mypageVO")
public class MyPageVO {
	private String userId;  //유저아이디 외래키
	private String beginDate;
	private String endDate;
	
    /* OrderVO */
    private int orderNum; // 주문번호
    private String fakeOrderNum; // 주문번호2
    private String orderStatus; // 주문상태
    private Date orderCreateTimestamp; // 주문 생성일자
    private Date orderUpdateTimestamp; // 주문 수정일자
    private String ordererName; // 주문자 이름
    private String ordererPhone; // 주문자 연락처
    private String ordererEmail; // 주문자 이메일
    private String destName; // 받는 사람 이름
    private String destPhone; // 받는 사람 연락처
    private String destLoc1; // 받는 사람 기본주소
    private String destLoc2; // 받는 사람 상세주소
    private int totalPrice; // 총 가격
    private Date prodDeliveryDate; // 배송일자

    /* OrderMenuVO */
    private int orderMenuNum; // 주문메뉴번호
    private String menuName; // 메뉴 이름
    private int menuCount; // 메뉴 수량
	
}
