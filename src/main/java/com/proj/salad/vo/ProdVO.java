package com.proj.salad.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

/* 김동혁 - VO 추가 */
/* SHOP_PRODUCT, PROD_IMAGE 의 조인을 위해 VO 수정(23.07.14) */
@Data
@Component
public class ProdVO {
    private int prodNum;
    private String prodName;
    private int prodPrice;
    private String prodDescription;
    private String prodBrand;
    private Date prodCreateTimestamp;
    private int prodDeliveryPrice;
    private String prodImageUrl;
    private String prodImageName;
    private Date prodImageDate;
}
