package com.proj.salad.order.vo;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("AccountVO")
public class AccountVO {
	private int OrderAccountNum; // 기본키
	private int OrderNum; // 외래키
	private String accountNumber; // 계좌 번호
	private String accountPeriod; // 유효날짜
	private String accountCVC; // CVC
	private String accountName; // 예금주
	private String purchaseType; // 결제수단
	
}
