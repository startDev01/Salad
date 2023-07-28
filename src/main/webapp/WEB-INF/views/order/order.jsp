<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="totalPrice" value="0"/> <!-- 총가격 변수 초기화 -->
<c:set var="shippingCost" value="3000"/> <!-- 배송비 변수 초기화 -->
<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <meta charset="UTF-8">

    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

       main {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            padding-top: 178px;   /* 하유리: 헤더 영역만큼 아래로 내림(23.07.27.) */
        }

        h2, h3 {
            color: #333;

        }

        h2 {
            font-weight: bold;
            font-size: 30px;
        }

        .info-block {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
        }

        .line {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            flex-direction: row;
        }

        .line-title {
            width: 120px;
            font-weight: bold;
            margin-right: 10px;
        }

        .line-content {
            /*width: 300px;*/
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        button {
            background-color: #128853;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .item-box {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
        }

        .info-block.pay {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
        }

        .line input[type="radio"], .line label.radiolabel {
            display: inline-flex;
            align-items: center;
            margin-right: 10px;
        }

        /* 추가: 라디오 버튼과 라벨 가로로 나열 */
        .line .pay-info input[type="text"], .line .pay-info label {
            display: inline-flex;
            align-items: center;
            margin-right: 10px;
        }

        /* 그 외의 스타일링을 추가로 진행합니다. */
    </style>

    <title>주문하기</title>
</head>
<body>
<main>
    <h2>주문 / 결제</h2>

    <form action="${contextPath}/payment" method="post">
        <h3>구매자 정보</h3>
        <div class="info-block to">
            <div class="line">
                <div class="line-title"><label for="name">이름</label></div>
                <div class="line-content"><input type="text" name="username" id="username" value="${userVO.userName}"
                                                 required>
                    <input type="text" name="ordererName" value="${userVO.userName}" hidden>
                </div>
            </div>
            <div class="line">
                <div class="line-title"><label for="address">배송주소</label></div>
                <div class="line-content"><input type="text" name="useraddress" id="useraddress"
                                                 value="${userVO.userAddress1} ${userVO.userAddress2}" required>
                </div>
            </div>
            <div class="line">
                <div class="line-title"><label for="phoneNb">연락처</label></div>
                <div class="line-content"><input type="text" name="userphone" id="userphoneNb" maxlength="11"
                                                 value="${userVO.userPhone}" required>
                    <input type="text" name="ordererPhone" value="${userVO.userPhone}" hidden>
                </div>
            </div>
        </div>
        <h3>받는 사람 정보
            <button type="button" id="copyButton" class="info-setting">구매자와 동일</button>
        </h3>
        <div class="info-block to">
            <div class="line">
                <div class="line-title"><label for="name">이름</label></div>
                <div class="line-content"><input type="text" name="destName" id="name" placeholder="받으실 분의 이름을 입력하세요"
                                                 required>
                </div>
            </div>
            <div class="line">
                <div class="line-title"><label for="address">배송주소</label></div>
                <div class="line-content"><input type="text" name="destLoc" id="address" placeholder="배송 주소를 입력하세요"
                                                 required>
                </div>
            </div>
            <div class="line">
                <div class="line-title"><label for="phoneNb">연락처</label></div>
                <div class="line-content"><input type="text" name="destPhone" id="phoneNb" maxlength="11"
                                                 placeholder="'-'없이 입력 하세요" required>
                </div>
            </div>
            <div class="line">
                <div class="line-title"><label for="memo">배송시 요청사항</label></div>
                <div class="line-content"><input type="text" name="memo" id="memo" placeholder="요청 사항을 입력해주세요" required>
                </div>
            </div>
        </div>
<h3>결제 상품 목록</h3>
        <div class="item-box">
            <c:forEach items="${orderList}" var="cartList" varStatus="listStatus">
                <div class="info-block">
                    <div class="line">
                        <div class="line-title">상품명: ${cartList.prodName}</div>
                            <%--                        <input type="text" value="${cartList.prodName}" name="" hidden>--%>
                        <div class="line-content">수량: ${cartList.cartCount}</div>
                            <%--                        <input type="text" value="${cartList.cartCount}" hidden>--%>
                        <div class="line-content">상품 가격: ${cartList.prodPrice}</div>
                            <%--                        <input type="text" value="${cartList.prodPrice}" hidden>--%>
                    </div>
                    <!-- 다른 속성들도 필요하면 여기에 추가 -->
                        <%-- cartList의 가격을 totalPrice에 더함 --%>
                    <c:set var="totalPrice" value="${totalPrice + (cartList.prodPrice * cartList.cartCount)}"/>

                    <%-- 장바구니에 담긴 상품 정보들 Controller로 전송 --%>
<%--                    <c:set var="CL_prodName${listStatus.index}" value="${cartList.prodName}"></c:set>--%>
                    <input type="text" name="CL_prodName${listStatus.index}" value="${cartList.prodName}" hidden>
<%--                    <c:set var="CL_cartCount${listStatus.index}" value="${cartList.cartCount}"></c:set>--%>
                    <input type="text" name="CL_cartCount${listStatus.index}" value="${cartList.cartCount}" hidden>
<%--                    <c:set var="CL_prodPrice${listStatus.index}" value="${cartList.prodPrice}"></c:set>--%>
                    <input type="text" name="CL_prodPrice${listStatus.index}" value="${cartList.prodPrice}" hidden>

                    <%-- 최대 반복수(listCount) Controller로 넘기기 --%>
                    <c:if test="${listStatus.last}">
                        <c:set var="listCount" value="${listStatus.index + 1}"></c:set>
                        <input type="text" name="listCount" value="${listCount}" hidden>
                    </c:if>
                </div>

            </c:forEach>
            <input type="text" value="${totalPrice + 3000}" name="totalPrice" hidden>
        </div>

        <h3>결제 정보</h3>
        <div class="info-block">
            <div class="line">
                <div class="line-title">총상품가격</div>
                <div class="line-content all-item"><fmt:formatNumber value="${totalPrice}" pattern="###,###원"/></div>
            </div>
            <div class="line">
                <div class="line-title">배송비</div>
                <div class="line-content">3,000원</div>
            </div>
            <div class="line">
                <div class="line-title">총결제금액</div>
                <div class="line-content total"><fmt:formatNumber value="${totalPrice+shippingCost}"
                                                                  pattern="###,###원"/></div>
            </div>
            <div class="line">
                <div class="line-title">결제방법</div>
                <div class="line-content">
                    <div class="line">
                        <input type="radio" id="transfer" name="purchaseType" value="transfer" disabled>
                        <label class="radiolabel" for="transfer">계좌이체</label>

                        <input type="radio" id="credit-card" name="purchaseType" value="credit" checked>
                        <label class="radiolabel" for="credit-card">신용/체크카드</label>

                        <input type="radio" id="corporation-card" name="purchaseType" value="corporation" disabled>
                        <label class="radiolabel" for="corporation-card">법인카드</label>

                        <input type="radio" id="phone" name="purchaseType" value="phone" disabled>
                        <label class="radiolabel" for="phone">휴대폰</label>

                        <input type="radio" id="deposit-without-passbook" name="payment" value="depositWithout"
                               disabled>
                        <label class="radiolabel" for="deposit-without-passbook">무통장입금(가상계좌)</label>
                    </div>
                    <div class="pay-info">
                        <div class="form-label">
                            <label for="card">카드번호</label>
                        </div>
                        <div class="form-input">
                            <input type="text" id="card" name="cardNum1" size="2" minlength="4" maxlength="4" required>
                            <input type="text" name="cardNum2" size="2" minlength="4" maxlength="4" required>
                            <input type="text" name="cardNum3" size="2" minlength="4" maxlength="4" required>
                            <input type="text" name="cardNum4" size="2" minlength="4" maxlength="4" required>
                        </div>
                        
                        <div class="form-label">
                            <label for="period">유효기간</label>
                        </div>
                        
                        <div class="form-input">
                            <input type="text" id="period" name="period1" size="2" minlength="2" maxlength="2" placeholder="mm"
                                   required> /
                            <input type="text" name="period2" size="2" minlength="2" maxlength="2" placeholder="yy" required>
                        </div>
                        
                        <div class="form-label">
                            <label for="cvc">CVC</label>
                        </div>
                        
                        <div class="form-input">
                            <input type="text" id="cvc" name="cvc" minlength="3" maxlength="3" required>
                        </div>
<%--                        <input type="submit" id="button" hidden>--%>
                    </div>
                </div>
            </div>
        </div>
        <input type="text" name="orderStatus" value="결제완료" hidden>

<%--        <label for="button">결제하기</label>--%>
        <input type="submit" value="결제하기">
    </form>
</main>

<script>
    // 버튼 클릭 시 입력 내용 복사
    $('#copyButton').on('click', function () {
        var username = $('#username').val();
        var useraddress = $('#useraddress').val();
        var userphoneNb = $('#userphoneNb').val();
        // 원본 입력란의 내용을 가져와서 목적지 입력란에 설정합니다
        $('#name').val(username);
        $('#address').val(useraddress);
        $('#phoneNb').val(userphoneNb);

    });
</script>
</body>
</html>