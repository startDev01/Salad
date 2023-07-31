package com.proj.salad.mypage.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
@Component("OrderListVO")
public class OrderListVO {
    /* OrderVO */
    private int orderNum; // 주문번호
    private String fakeOrderNum; // 주문번호2
    private String userId; // 유저아이디
    private String orderStatus; // 주문상태
    private Date orderCreateTimestamp; // 주문 생성일자
    private Date orderUpdateTimestamp; // 주문 수정일자
    private String ordererName; // 주문자 이름
    private String ordererPhone; // 주문자 연락처
    private String ordererEmail; // 주문자 이메일
    private String destName; // 받는 사람 이름
    private String destPhone; // 받는 사람 연락처
    private String destLoc; // 받는 사람 주소
    private int totalPrice; // 총 가격
    private Date prodDeliveryDate; // 배송일자
    private String memo; // 배송 요청사항

    /* OrderMenuVO */
    private int orderMenuNum; // 주문메뉴번호
    private String menuName; // 메뉴 이름
    private int menuCount; // 메뉴 수량

}
