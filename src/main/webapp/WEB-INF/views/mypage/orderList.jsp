<%-- jsp 기본 템플릿입니다. --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="../resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="../resources/css/footer.css" rel="stylesheet" type="text/css">
    <link href="../resources/css/mypage/orderList.css" rel="stylesheet" type="text/css">

    <%-- 폰트 적용 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:wght@400;500;600;700&display=swap"
          rel="stylesheet">

    <style>
        /* css 적용 부분 */

    </style>
    <title>주문 내역</title>

</head>
<body>
<%--<h1 class="test-h1">테스트!!</h1>--%>
<div class="odl-container">
    <div class="odl-box">
                <%--<div class="odl-1box">
                    <div>

                        <c:if test="${orderNum != list.orderNum}">
                        <div id="odl-underbar"></div>
                            ${list.orderNum}
                    </div>
                    <div>
                        </c:if>
                        <c:set var="orderNum" value="${list.orderNum}"/>

                            ${list.menuName}
                    </div>
                </div>--%>
            <table border="1" class="odl-table">
                <th class="odl-table-th" width="20%">주문일자</th>
                <th class="odl-table-th" width="10%">주문번호</th>
                <th class="odl-table-th" width="20%">주문자이름</th>
                <th class="odl-table-th" width="20%">결제금액</th>
                <th class="odl-table-th" width="20%">배송상태</th>
                <th class="odl-table-th" width="10%">주문수정</th>

                <c:forEach var="list" items="${orderList}" varStatus="listStatus">
                    <tr>
                        <td class="odl-table-td">${list.orderCreateTimestamp}</td>
                        <td class="odl-table-td odl-td-pointer" onclick="location.href='${contextPath}/mypage/orderInfo/${list.orderNum}'">${list.orderNum}</td>
                        <td class="odl-table-td">${list.ordererName}</td>
                        <td class="odl-table-td"><fmt:formatNumber value="${list.totalPrice}" pattern="#,###" /> 원</td>
                        <td class="odl-table-td">${list.orderStatus}</td>
                        <td class="odl-table-td">
                            <c:if test="${list.orderStatus == '결제완료'}">
                                <button class="odl-table-del" onclick="showConfirmation('${list.orderNum}')">주문취소</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
    </div>
<%--    <div class="odl-box2">--%>

<%--    </div>--%>
</div>

<script>
    function showConfirmation(orderNum) {
        // 주문수정 버튼을 눌렀을 때 실행될 함수
        var confirmation = confirm("주문번호 " + orderNum + "를 취소하시겠습니까?");

        if (confirmation) {
            // 사용자가 확인을 눌렀을 경우
            // 여기에 주문 취소 처리를 위한 Ajax 요청 또는 다른 로직을 추가할 수 있습니다.
            // alert("주문이 취소되었습니다.");

            $.ajax({
                type: "POST", // 또는 "GET" 등 HTTP 요청 방식을 선택합니다.
                url: "${contextPath}/mypage/cancelOrder", // 주문 취소를 처리할 서버의 URL을 입력합니다.
                data: {orderNum: orderNum}, // 주문 번호를 서버에 전달합니다.
                success: function (aaa) {
                    alert("주문이 취소되었습니다.");
                    location.href = "${contextPath}/mypage/orderList";
                    // 주문이 취소된 후 필요한 작업을 수행할 수 있습니다.
                    // 예를 들어, 주문 목록을 다시 로드하거나 특정 요소를 업데이트할 수 있습니다.
                },
                error: function (bbb) {
                    alert("주문 취소에 실패했습니다. 다시 시도해주세요.");
                }
            });
        } else {
            // 사용자가 취소를 눌렀을 경우
            // alert("주문 취소가 취소되었습니다.");
        }
    }
</script>
</body>
</html>
