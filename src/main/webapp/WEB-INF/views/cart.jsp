<%-- jsp 기본 템플릿입니다. --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%  request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <style>
    /* css 적용 부분 */
    .cart-container {
      background-color: #bcbcbc;
      height: 2000px;
      width: 1000px;
      display: flex;
      justify-content: center;
    }
  </style>
  <title>장바구니</title>

</head>
<body>
  <div class="cart-container">


  </div>
</body>
</html>
