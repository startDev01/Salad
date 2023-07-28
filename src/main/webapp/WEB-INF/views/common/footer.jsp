<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%  request.setCharacterEncoding("UTF-8"); %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하단 부분</title>
	<!-- css 적용 -->
	 <link href="resources/css/style.css" rel="stylesheet" type="text/css" >
	 <link href="resources/css/footer.css" rel="stylesheet" type="text/css" >
</head>

<body>
	<!-- 하유리: footer 전체적으로 수정(23.07.26.) -->
	<div class="footer">
		<div class="footer_img">
			<ul>
				<li><img width="18px" src="${contextPath}/resources/image/common/footer/facebook-logo.png"/></li>
				<li><img width="18px" src="${contextPath}/resources/image/common/footer/instagram-logo.png"/></li>
				<li><img width="18px" src="${contextPath}/resources/image/common/footer/twitter-logo.png"/></li>
			</ul>
		</div>
		<div class="footer_menu">
			<ul>
				<li><a href="${contextPath}/menu">MENU</a></li>
				<li><a href="${contextPath}/review/list">REVIEW</a></li>
				<li><a href="${contextPath}/notice/list">NOTICE</a></li>
				<li><a href="${contextPath}/map">MAP</a></li>
				<li><a href="${contextPath}/event">EVENT</a></li>
			</ul>
		</div>
		<div class="footer_info">
			<ul>
				<li>상호｜㈜SALADDAISO&nbsp;&nbsp;&nbsp;대표｜홍길동</li>
				<li style="display: flex; justify-content: center;">주소｜대전광역시 광역시 계룡로 637 정일빌딩 7층
					  <a href="#"><img width="18px" src="${contextPath}/resources/image/common/footer/magnifier.png"/></a>
				</li>
				<li>대표전화｜1234-1234&nbsp;&nbsp;&nbsp;이메일｜shop@saladdaiso.co.k</li>
				<li>사업자등록번호｜123-45-67890</li>
			</ul>
		</div>
		<div>
			<p>이용약관&nbsp;&nbsp;개인정보처리방침</p>
			<p>©saladdaiso. all rights reserved.</p>
		</div>
	</div>
</body>
</html>