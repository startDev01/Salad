package com.proj.salad.prod.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

/* 영양소 VO / 김동혁 추가 (23.07.18) */
/* Lombok 미적용시 Getter Setter 생성해주세요!! */
@Data
@Component
public class NutrientVO {
    private int prodNum;
    private double kcal;
    private double carbohydrates;
    private double sugar;
    private double protein;
    private double fat;
    private double saturated_fat;
    private double natrium;
}
