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
    .order-done-h1 {
      font-size: 28px;
      font-weight: bold;
      margin-top: 50px;
      margin-bottom: 50px;
    }

  </style>
  <title>결제 완료</title>

</head>
<body>
<h1 class="order-done-h1">주문이 완료되었습니다.</h1>

</body>
</html>
