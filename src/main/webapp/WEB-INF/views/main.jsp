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
		/* 김동혁 - css 임시 추가(23.07.13.) */
		.listBox {
			display: inline-block;
		}

		.prodBox {
			display: flex;
			float: left;
			height: 300px;
			width: 300px;
			background-color: #bcbcbc;
			margin: 20px;
			justify-content: center;
			align-items: center;
		}

		.prodBox:hover {
			cursor: pointer;
		}

		.prodP {
			display: block;
			transition: all 0.1s linear;
		}

		.prodP:hover {
			transform: scale(1.2);
		}
	</style>
  	
</head>
<body>
<!-- 하유리: 슬라이드 배너(23.07.14.) -->
<!-- 하유리: 슬라이드 효과(23.07.15.) -->
<div class="section">
	<input type="radio" name="slide" id="slide1" checked>
	<input type="radio" name="slide" id="slide2">
	<input type="radio" name="slide" id="slide3">
	<div class="slideWrap">
		<ul class="slideBannerList">
			<!-- 하유리: 이미지 간 간격을 없애기 위해 </li>사용하지 않음 -->
			<li><img class="slideBanner" src="${contextPath}/resources/image/main/slideBanner1.png" />
			<li><img class="slideBanner" src="${contextPath}/resources/image/main/slideBanner2.png" />
			<li><img class="slideBanner" src="${contextPath}/resources/image/main/slideBanner3.png" />
		</ul>
		<div class="slideControl">	<!-- 슬라이드배너 이동 -->
			<div class="control1">		<!-- label for="input의 id값"으로 input-label 연결 > label 안의 이미지 클릭 시 input이 체크됨  -->
				<label for="slide3" class="left"></label>
				<label for="slide2" class="right"></label>
			</div>
			<div class="control2">
				<label for="slide1" class="left"></label>
				<label for="slide3" class="right"></label>
			</div>
			<div class="control3">
				<label for="slide2" class="left"></label>
				<label for="slide1" class="right"></label>
			</div>
		</div>
	</div>
</div>
<div class="content1">
	<!-- 하유리: 태그 수정(<p> → <h3>)(23.07.14.) -->
	<h3>추천식단</h3><br>

	<%-- 김동혁 수정 ( 리스트 출력 )(23.07.14.)--%>
	<div class="listBox">
		<!-- <p>list 출력부분</p><br> --><!-- 하유리: 주석처리(23.07.14) -->
		<c:forEach var="prod" items="${prodList}" varStatus="prodNum">
			<c:if test="${prodNum.index mod 3 == 0}">
				<br>
			</c:if>
			<div class="prodBox">
				<div class="prodP">
					<p>이미지 :
							<%--<c:if test="${prod.prodImageUrl == null}">
								NULL
							</c:if>--%>
					</p>
					<p>제목 : ${prod.prodName}</p>
					<p>가격 : ${prod.prodPrice} ₩  </p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>