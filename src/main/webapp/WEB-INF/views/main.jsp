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
	<!-- 슬라이드 배너 -->
	<div>
		<img class="slideBanner" src="${contextPath}/resources/image/slideBanner4.png" />
	</div>
	<div class="content1">
		<!-- 하유리: 태그 수정(<p> → <h3>)(23.07.14.) -->
		<h3>추천식단</h3><br>

		<%-- 김동혁 수정 ( 리스트 출력 )(23.07.14.)--%>
		<div class="listBox">
			<p>list 출력부분</p><br>
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