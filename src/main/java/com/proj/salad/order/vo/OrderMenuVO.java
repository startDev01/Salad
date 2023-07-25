package com.proj.salad.order.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

/* 김동혁 추가(23.07.24) */
@Data
@Component
public class OrderMenuVO {
    private int orderMenuNum;
    private int orderNum;
    private String userId;
    private String menuName;
    private int menuCount;
}
