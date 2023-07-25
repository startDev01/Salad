<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 서승희 23.07.25 전체 수정 -->
<!DOCTYPE html>
<html>
<head>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
</head>
<body>

<nav>
<br><br>
<ul>
<c:choose>
  <c:when test="${side_menu=='my_page' }">
  </c:when>
  <c:otherwise>
	<li>
		<h3>주문내역</h3>
		<br>
		<ul>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li><br>
			<li><a href="#">반품/교환 신청 및 조회</a></li><br>
			<li><a href="#">취소 주문 내역</a></li><br>
			<!-- <li><a href="#">세금 계산서</a></li><br> -->
		</ul>
	</li><br>
	<li>
		<h3>정보내역</h3>
		<br>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li><br>
			<!-- <li><a href="#">나의 주소록</a></li><br>
			<li><a href="#">개인정보 동의내역</a></li><br>
			<li><a href="#">회원탈퇴</a></li><br> -->
		</ul>
	</li>
  </c:otherwise>
</c:choose>	
</ul>
</nav><br>
<div class="clear"></div>
<div id="banner">
	<a href="${contextPath}/event/eventPage"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div><br>
<div id="notice">
	<h2>공지</h2>
	<br>
	<ul>
	<c:forEach  var="i" begin="1" end="3" step="1">
		<li><a href="${contextPath}/review">공지사항${ i}</a></li><br>
	</c:forEach>
	</ul>
</div>
<br>
<div id="banner">
	<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>

<!-- <body>
	<h1>사이드 메뉴</h1>

	<h1>
		<a href="#"  class="no-underline">회원관리</a><br>
		<a href="#"  class="no-underline">게시판관리</a><br>
		<a href="#"  class="no-underline">상품관리</a><br>
	</h1>
</body> -->
</body>
</html>