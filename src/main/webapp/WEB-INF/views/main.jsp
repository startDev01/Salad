<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%  request.setCharacterEncoding("UTF-8"); %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<title>메인 페이지</title>
  	<script src="http://code.jquery.com/jquery-latest.js"></script>
  	<!-- css 적용 -->
 	<link href="resources/css/style.css" rel="stylesheet" type="text/css" >
	<link href="resources/css/main.css" rel="stylesheet" type="text/css" >
  	<style>
		/* 김동혁 - css 임시 추가 */
		.listBox {
			display: inline-block !important;
		}
  	</style>
  	
</head>
<body>
	<div class="content1">
		<p>추천식단</p><br>
		<%-- 김동혁 수정 --%>
		<div class="listBox">
			<p>list 출력부분</p><br>
			<c:forEach var="prod" items="${prodList}" varStatus="prodNum">
				<c:if test="${prodNum.index mod 3 == 0}">
					<br>
				</c:if>
				<span>제목 : ${prod.prodName}</span>
				<span>가격 : ${prod.prodPrice} ₩  </span>
			</c:forEach>
		</div>
	</div>
</body>
</html>