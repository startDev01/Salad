<%-- jsp 기본 템플릿입니다. --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
  <%-- 폰트 적용 --%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- css 적용 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* css 적용 부분 */

    /*  */
    .body-container {
      display: flex;
      justify-content: center;
    }

    .cart-container {
      background-color: aliceblue;
      height: 1000px;
      width: 1000px;
      display: flex;
      flex-direction: column;
      padding: 30px;

      /* 장바구니 부분 기본 폰트 변경 */
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 500;
    }

    .cart-stuff {
      margin-bottom: 20px;
    }

    .cart-box {
      background-color: white;
      height: 500px;
      overflow: auto;
      display: flex;
      flex-direction: column;
    }

    #cart-null {
      font-size: 24px;
      margin-top: 20px;
      margin-bottom: 20px;
    }

    #cart-null-div {
      display: flex;
      justify-content: center;

    }

    .cart-list {
      width: 100%;
      border-bottom: 1px solid gray;
      padding-bottom: 200px;
    }

    .cart-list-ul {
      display: flex;
      flex-direction: column;
    }

    .cart-list-li {
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .cart-list-li > .cart-count {
      height: 30px;
      width: 100px;
    }

    .cart-list-li > div {

    }

    .cart-list-span {
      width: 500px;
      text-align: left;
      margin-left: 20px;
      font-size: 20px;
    }

    .cart-list-del {
      height: 35px;
      width: 60px;
      border: none;
      margin-right: 20px;
    }

    .cart-list-del:hover {
      cursor: pointer;
      background-color: #36DDA6;
      color: white;
    }

    .cart-count {
      font-size: 18px;
      text-align: center;
      width: 50px;
    }

    .cart-sum {
      display: flex;
      flex-direction: column;
      justify-content: center;
      height: 300px;
      width: 100%;
    }

    .cart-sum-res {

    }

    .cart-sum > div {
      align-items: center;
    }

    .cart-sum > div > span {
      font-size: 30px;
    }

    .cart-margin {
      margin-top: 20px;
    }

    .text-h1 {
      font-size: 30px;
    }

    .cart-h1 {
      font-size: 30px;
      border-bottom: 1px solid gray;
      padding-bottom: 10px;
    }

    .button-order {
      background-color: #36DDA6;
      color: white;
      border: none;
      height: 60px;
      width: 180px;
      font-size: 24px;
      font-weight: bold;
    }

    .button-order:hover {
      cursor: pointer;
      border: 2px solid black;
    }
  </style>
  <title>장바구니</title>

</head>
<body>
  <div class="body-container">
    <div class="cart-container">
      <h1 class="text-h1 cart-h1 cart-stuff">장바구니</h1>
      <div class="cart-box cart-stuff">
        <div class="cart-list">
          <ul class="cart-list-ul">
            <%-- 장바구니가 비어있을 경우 --%>
            <c:if test="${empty cartList}">
              <div id="cart-null-div">
                <span id="cart-null">장바구니가 비어있습니다.</span>
              </div>
            </c:if>
            <%-- 장바구니 테이블 목록 출력 --%>
            <c:forEach var="cart" items="${cartList}" varStatus="cartStatus" >
              <li class="cart-list-li">
                <span class="cart-list-span">${cart.prodName}</span>
                <input type="number" class="cart-count" value="${cart.cartCount}" min="1" max="10">
                <input type="button" class="cart-list-del" data-cartnum="${cart.cartNum}" value="삭제">
                <!-- 장바구니 아이템의 가격(단가 * 수량)을 저장하는 hidden input 추가 -->
                <input type="hidden" class="cart-price" value="${cart.prodPrice * cart.cartCount}">
              </li>
            </c:forEach>
              <%-- 밑 코드는 임시 데이터 출력 --%>
<%--            <li class="cart-list-li">--%>
<%--              <span class="cart-list-span">테스트 장바구니 1</span>--%>
<%--              <input class="cart-count" type="number" value="1" min="1" max="10">--%>
<%--              <input class="cart-list-del" type="button" value="삭제">--%>
<%--            </li>--%>
<%--            <li class="cart-list-li">--%>
<%--              <span class="cart-list-span">테스트 물건 2</span>--%>
<%--              <input class="cart-count" type="number" value="1" min="1" max="10">--%>
<%--              <input class="cart-list-del" type="button" value="삭제">--%>
<%--            </li>--%>
          </ul>
        </div>
        <div class="cart-sum">
          <div id="cart-sum-title cart-margin">
            <span>상품 가격</span>
            <span> + </span>
            <span>배송비</span>
            <span> + </span>
            <span>총 가격</span>
          </div>
          <c:if test="${not empty cartList}">
            <div class="cart-sum-res cart-margin">
            <span>
              <c:set var="sum" value="0" scope="session"></c:set>
              <c:forEach var="cart" items="${cartList}" varStatus="cartStatus">
                <c:set var="sum" value="${sum + (cart.prodPrice * cart.cartCount)}" scope="session"></c:set>
              </c:forEach>
              <fmt:formatNumber value="${sum}" pattern="#,###" />
            </span>
              <span> + </span>
              <span>2,500</span>
              <span> + </span>
              <span>
              <fmt:formatNumber value="${sum + 2500}" pattern="#,###" /> 원
              </span>
            </div>
          </c:if>
          <c:if test="${empty cartList}">
            <div class="cart-sum-res cart-margin">
              <span>0 원</span>
            </div>
          </c:if>
        </div>
      </div>


      <div class="order cart-stuff">
        <button class="button-order">
          주문하기
        </button>
      </div>

    </div>
  </div>

<script>
  /* Script 김동혁 추가(23.07.20) */
  $(document).ready(function () {
    let cartNum;
    var total;

    // 장바구니 삭제 버튼 클릭시 Ajax
    $('.cart-list-del').on('click', function () {
      cartNum = $(this).data('cartnum');
      let listItem = $(this).closest('.cart-list-li'); // 클릭한 삭제 버튼이 속한 li 선택
      let cartPrice = parseInt(listItem.find('.cart-price').val()); // 해당 아이템의 가격

      // Ajax로 cartNum 보내기
      $.ajax({
        url: '${contextPath}/delCart',
        type: 'GET',
        data: {cartNum : cartNum},
        dataType: 'json',
        success: function (response) {
          // alert('삭제했습니다.');
          listItem.remove();
          updateTotalPrice(-cartPrice); // 아이템의 가격을 총 가격에서 차감하는 함수 호출
          // location.reload();
        },
        error: function () {
          alert('삭제 실패했습니다.');
        }
      });
    });

    // 장바구니 수량 변경시 Ajax
    $(document).on('change', '.cart-count', function () {
      let listItem = $(this).closest('.cart-list-li'); // 변경한 수량이 속한 li 선택
      let cartNum = listItem.find('.cart-list-del').data('cartnum'); // 해당 아이템의 cartNum
      let cartCount = $(this).val(); // 변경된 수량
      let cartPrice = parseInt(listItem.find('.cart-price').val()); // 해당 아이템의 가격

      // Ajax로 cartNum과 변경된 수량(cartCount) 보내기
      $.ajax({
        url: '${contextPath}/updateCart',
        type: 'GET',
        data: { cartNum: cartNum, cartCount: cartCount },
        dataType: 'json',
        success: function (response) {
          // alert('수량이 변경되었습니다.');
          listItem.find('.cart-count').val(cartCount); // 입력한 수량으로 표시 업데이트
          let totalPrice = cartCount * cartPrice; // 변경된 수량으로 계산한 가격
          listItem.find('.cart-price').val(totalPrice); // 변경된 가격으로 hidden input 업데이트
          updateTotalPrice(totalPrice - cartPrice); // 변경된 가격으로 총 가격 업데이트
        },
        error: function () {
          alert('수량 변경에 실패했습니다.');
        }
      });
    });

    // 장바구니 다시 불러오기
    function loadCartList() {

    }

    // 총 가격 업데이트 함수
    function updateTotalPrice() {
      total = 0; // 총 가격 변수 초기화
      $('.cart-list-li').each(function () {
        var cartPrice = parseInt($(this).find('.cart-price').val()); // 해당 아이템의 가격
        var cartCount = parseInt($(this).find('.cart-count').val()); // 해당 아이템의 수량
        var itemTotalPrice = cartPrice * cartCount; // 각 아이템의 총 가격 계산
        total += itemTotalPrice; // 각 아이템의 총 가격을 총 가격에 누적
      });
      $('.cart-sum-res span:first-child').text(formatNumber(total)); // 포맷 적용하여 총 가격 업데이트
      $('.cart-sum-res span:last-child').text(formatNumber(total + 2500) + ' 원'); // 총 가격 + 배송비 업데이트
    }

    // 숫자 포맷 함수
    function formatNumber(number) {
      return new Intl.NumberFormat('ko-KR').format(number);
    }
  });
</script>
</body>
</html>
