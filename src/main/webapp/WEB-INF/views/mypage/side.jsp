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
   .list_order{
   	 background-color : lightgray;
 	 border-radius: 3px;
 	 width: 100px;
 	 height: auto;
 	 display: inline-block;
     padding:5px;
 	 margin-bottom: 15px; 
   }
   .list_info{
   	 background-color : lightgray;
 	 border-radius: 3px;
 	 width: 100px;
 	 height: auto;
 	 display: inline-block;
     padding:5px;
 	 margin-bottom: 15px; 
   }
/*    .mynotice{
   	 background-color : lightgray;
 	 border-radius: 3px;
 	 width: 100px;
 	 height: auto;
 	 display: inline-block;
     padding:5px;
 	 margin-bottom: 15px; 
   } */
 </style>
</head>
<body>

<nav>
<br><br>
<ul>
<c:choose>
  <c:when test="${side_menu=='my_page' }">
<li>
		<h3 class="list_order">주문내역</h3>
		<br>
		<ul>
			<li><a href="${contextPath}/mypage/orderList">주문 내역</a></li><br>
			<%-- <li><a href="${contextPath}/mypage/myOrderDetail.do">반품/교환 신청 및 조회</a></li><br> --%>
			<li><a href="#">주문 상세 내역</a></li><br>
			<li><a href="#">취소 주문 내역</a></li><br>
			<!-- <li><a href="#">세금 계산서</a></li><br> -->
		</ul>
	</li><br>
	<li>
		<h3 class="list_info">정보내역</h3>
		<br>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li><br>
			<!-- <li><a href="#">나의 주소록</a></li><br>
			<li><a href="#">개인정보 동의내역</a></li><br>
			<li><a href="#">회원탈퇴</a></li><br> -->
		</ul>
	</li>
  </c:when>
  <c:otherwise>
	<%-- <li>
		<h3 class="list_order">주문내역</h3>
		<br>
		<ul>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li><br>
			<li><a href="#">반품/교환 신청 및 조회</a></li><br>
			<li><a href="#">취소 주문 내역</a></li><br>
			<!-- <li><a href="#">세금 계산서</a></li><br> -->
		</ul>
	</li><br>
	<li>
		<h3 class="list_info">정보내역</h3>
		<br>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li><br>
			<!-- <li><a href="#">나의 주소록</a></li><br>
			<li><a href="#">개인정보 동의내역</a></li><br>
			<li><a href="#">회원탈퇴</a></li><br> -->
		</ul>
	</li> --%>
  </c:otherwise>
</c:choose>	
</ul>
</nav><br>
<%-- <div>
	<h2 class="mynotice">공지</h2>
	<br>
	<ul>
	<c:forEach  var="i" begin="1" end="3" step="1">
		<li><p><a href="${contextPath}/notice/list">[안내] 샐러드다이소 서비스 시스템 점검 안내${ i}</a></p></li>
		
	</c:forEach>
	</ul>
</div>
<br> --%>
<%-- <div class="clear"></div>
<div id="banner">
	<a href="${contextPath}/event/eventPage"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div><br> --%>
<%-- <div id="banner">
	<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div> --%>

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