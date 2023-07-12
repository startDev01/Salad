package com.proj.salad.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

/* 김동혁 - VO 추가 */
@Data
@Component
public class ProdVO {
    private int prodNum;
    private String prodName;
    private int prodPrice;
    private String prodDescription;
    private String prodImageUrl;
    private String prodBrand;
    private Date prodCreateTimestamp;
    private int prodDeliveryPrice;
}
