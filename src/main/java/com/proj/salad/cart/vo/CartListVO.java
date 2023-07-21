package com.proj.salad.cart.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

/* CartListVO : 제품 테이블, 장바구니 테이블 Join - 김동혁 추가(23.07.19)  */
@Data
@Component("CartListVO")
public class CartListVO {
    private int cartNum;
    private String userId;
    private int prodNum;
    private String prodName;
    private int prodPrice;
    private String prodDescription;
    private String prodBrand;
    private Date prodCreateTimestamp;
    private int prodDeliveryPrice;
    private int cartCount;
}
