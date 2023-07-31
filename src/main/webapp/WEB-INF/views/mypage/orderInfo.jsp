<%-- jsp 기본 템플릿입니다. --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="../../resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="../../resources/css/footer.css" rel="stylesheet" type="text/css">
    <link href="../../resources/css/mypage/orderInfo.css" rel="stylesheet" type="text/css">
    
    <!-- 사이드 css 맞추기 위해 추가로 넣음 23.07.30 서승희  -->
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css" >
	 <link href="../../resources/css/mypage/side.css" rel="stylesheet" type="text/css">
	 
    <%-- 폰트 적용 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Open+Sans:wght@400;500;600;700&display=swap"
          rel="stylesheet">

    <style>
        /* css 적용 부분 */
	/*.odl-container{    임시 */
        /* padding-top: 178px;    하유리: 헤더 영역만큼 아래로 내림(23.07.27.) */
      }
   /*    .order-info-table{
      font-size:13px;
      } */
    </style>
    <title>주문 상세 정보</title>

</head>
<body>
    <div class="odl-container">
        <table class="order-info-table" border="1px" align="center">
            <tr>
                <td>주문번호</td>
                <td>${orderNum}</td>
            </tr>
            <tr>
                <td>주문일자</td>
                <td>${orderInfo.orderCreateTimestamp}</td>
            </tr>
            <tr>
                <td>배송 예정 일자</td>
                <td>${orderInfo.prodDeliveryDate}</td>
            </tr>
            <tr>
                <td>주문자 이름</td>
                <td>${orderInfo.ordererName}</td>
            </tr>
            <tr>
                <td>상품 목록</td>
                <td>
                    <c:forEach var="menuList" items="${infoMenuList}" varStatus="listStatus">
                        ${menuList.menuName} x ${menuList.menuCount} 개<br>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>주문 상태</td>
                <td>${orderInfo.orderStatus}</td>
            </tr>

        </table>
    </div>
</body>
</html>
