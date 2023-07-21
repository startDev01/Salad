package com.proj.salad.cart.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

/* 김동혁 CartVO 추가 (23.07.19) */
@Data
@Component("CartVO")
public class CartVO {
    private String userId;
    private int prodNum;
    private int cartCount;
    private int cartNum;
}
