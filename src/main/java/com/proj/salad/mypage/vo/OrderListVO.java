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

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public String getFakeOrderNum() {
        return fakeOrderNum;
    }

    public void setFakeOrderNum(String fakeOrderNum) {
        this.fakeOrderNum = fakeOrderNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getOrderCreateTimestamp() {
        return orderCreateTimestamp;
    }

    public void setOrderCreateTimestamp(Date orderCreateTimestamp) {
        this.orderCreateTimestamp = orderCreateTimestamp;
    }

    public Date getOrderUpdateTimestamp() {
        return orderUpdateTimestamp;
    }

    public void setOrderUpdateTimestamp(Date orderUpdateTimestamp) {
        this.orderUpdateTimestamp = orderUpdateTimestamp;
    }

    public String getOrdererName() {
        return ordererName;
    }

    public void setOrdererName(String ordererName) {
        this.ordererName = ordererName;
    }

    public String getOrdererPhone() {
        return ordererPhone;
    }

    public void setOrdererPhone(String ordererPhone) {
        this.ordererPhone = ordererPhone;
    }

    public String getOrdererEmail() {
        return ordererEmail;
    }

    public void setOrdererEmail(String ordererEmail) {
        this.ordererEmail = ordererEmail;
    }

    public String getDestName() {
        return destName;
    }

    public void setDestName(String destName) {
        this.destName = destName;
    }

    public String getDestPhone() {
        return destPhone;
    }

    public void setDestPhone(String destPhone) {
        this.destPhone = destPhone;
    }

    public String getDestLoc() {
        return destLoc;
    }

    public void setDestLoc(String destLoc) {
        this.destLoc = destLoc;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getProdDeliveryDate() {
        return prodDeliveryDate;
    }

    public void setProdDeliveryDate(Date prodDeliveryDate) {
        this.prodDeliveryDate = prodDeliveryDate;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public int getOrderMenuNum() {
        return orderMenuNum;
    }

    public void setOrderMenuNum(int orderMenuNum) {
        this.orderMenuNum = orderMenuNum;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getMenuCount() {
        return menuCount;
    }

    public void setMenuCount(int menuCount) {
        this.menuCount = menuCount;
    }

    @Override
    public String toString() {
        return "OrderListVO{" +
                "orderNum=" + orderNum +
                ", fakeOrderNum='" + fakeOrderNum + '\'' +
                ", userId='" + userId + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderCreateTimestamp=" + orderCreateTimestamp +
                ", orderUpdateTimestamp=" + orderUpdateTimestamp +
                ", ordererName='" + ordererName + '\'' +
                ", ordererPhone='" + ordererPhone + '\'' +
                ", ordererEmail='" + ordererEmail + '\'' +
                ", destName='" + destName + '\'' +
                ", destPhone='" + destPhone + '\'' +
                ", destLoc='" + destLoc + '\'' +
                ", totalPrice=" + totalPrice +
                ", prodDeliveryDate=" + prodDeliveryDate +
                ", memo='" + memo + '\'' +
                ", orderMenuNum=" + orderMenuNum +
                ", menuName='" + menuName + '\'' +
                ", menuCount=" + menuCount +
                '}';
    }
}
