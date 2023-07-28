package com.proj.salad.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

/* 주문 + 주문 메뉴 + 결제 vo - 김동혁 추가(23.07.24) */
@Data
@Component("OrderVO")
public class OrderVO {
	
    /* 주문 테이블(shop_order) */
    private int orderNum; // 주문번호
    private String fakeOrderNum; // 주문번호2
    private String userId; // 유저아이디
    private String orderStatus; // 주문상태
    private Date orderCreateTimestamp; // 주문 생성일자
    private Date orderUpdateTimestamp; // 주문 수정일자
//    private int orderCount; // 주문 수량
    private String ordererName; // 주문자 이름
    private String ordererPhone; // 주문자 연락처
    private String ordererEmail; // 주문자 이메일
    private String destName; // 받는 사람 이름
    private String destPhone; // 받는 사람 연락처
    private String destLoc; // 받는 사람 주소
    private int totalPrice; // 총 가격
    private Date prodDeliveryDate; // 배송일자
    private String memo; // 배송 요청사항

    /* 주문 메뉴 테이블(order-menu) */
//    private int orderMenuNum; // 주문 메뉴 번호
////    private int orderNum; -- 이미 있음
//    private String menuName; // 메뉴 이름
//    private int menuCount; // 메뉴 개수

    /* 결제 테이블(shop_pay) */
//    private String accountNumber; // 계좌 번호
//    private String accountName; // 예금주
//    private Date accountDate; // 결제일
//    private String purchaseType; // 결제수단
	
	


}
