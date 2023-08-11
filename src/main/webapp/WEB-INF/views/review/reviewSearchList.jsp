<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- 날짜 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<!-- 리뷰 css 적용 -->
    <link href="../resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="../resources/css/footer.css" rel="stylesheet" type="text/css">
	<link href="../resources/css/review.css" rel="stylesheet" type="text/css">
	<link href="../resources/css/review/reviewSearch" rel="stylesheet" type="text/css">

	<style>
		.search-bar {
			border: none;
			border-bottom: 1px solid black;
		}

		.search-bar:focus {
			outline: none;
		}

		.search-btn {
			border: none;
			height: 28px;
			width: 50px;
			font-size: 12px;
			background: #128853;
			color: white;
		}
	</style>
</head>

<body>
	<!-- 제목: 변경(23.07.21.) -->
	<div class="review_sub">
		<p class="review_text">REVIEW</p>		<!-- 하유리: 텍스트 수정(23.07.29.) -->
	</div>

	<%-- 검색: 추가(23.08.11) --%>
	<div class="review_search">
		<form action="${contextPath}/review/search" method="get">
			<input type="text" class="search-bar" name="s_title">
			<input type="submit" class="search-btn" value="검색">
		</form>
	</div>
	
	<!-- 게시판 -->
	<div class="container mt-3">
		<table class="table table-hover">
			<thead class="table_tread" style="text-align: center;">
	    		<tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;"> 
					<th scope="col" width="15%">글 번호</th>
			      	<th scope="col" width="40%">제목</th>
			      	<th scope="col" width="15%">작성자</th>
			      	<th scope="col" width="15%">작성일</th>
			      	<th scope="col" width="15%">조회수</th>
			    </tr>
	  		</thead>
	  		
	  		<tbody>
		  		<c:choose>
					<c:when test="${!empty reviewList}">
						<c:forEach items="${reviewList }" var="review" varStatus="reviewStatus">
				    		<tr>
				    			<!-- 글 번호 -->
				    			<th scope="row">	
				    				<c:choose>
				    					<c:when test="${reviewStatus.count<=3}">	<!-- 최다조회수 게시글 3개 상위노출 및 이미지 출력  -->
<%--				    						<span><img width="20px" src="${contextPath}/resources/image/review/bestCnt.png"/></span>--%>
											<span>${review.re_articleNO }</span>

				    					</c:when>
				    					<c:otherwise>	<!-- 일반글 -->
				    						<span>${review.re_articleNO }</span>
				    					</c:otherwise>
				    				</c:choose>
				    			</th>
				    			
				    			<!-- 글 제목 -->
				    			<td class="re_title" align="left">
					    			<c:choose>
					    				<c:when test="${reviewStatus.count<=3}"><!-- 베스트글 표시 -->
<%--					    					<span style="font-size:15px; color:#128853"> [베스트]</span>--%>
					    					<a href="${contextPath}/review/content?re_articleNO=${review.re_articleNO }"><c:out value="${review.re_title }"/></a>
					    				</c:when>
					    				
					    				<c:when test="${review.level>1 }"> <!-- 답변 표시 -->
					    					<c:forEach begin="1" end="${review.level }" step="2">
					    						<span style="padding-left: 25px"></span>
					    					</c:forEach>
					    					<span style="font-size:15px; color:#128853;">➥</span>
					    					<a href="${contextPath}/review/content?re_articleNO=${review.re_articleNO }"><c:out value="${review.re_title}" /></a>
					    				</c:when>
				
<%-- 					    				<c:otherwise> <!-- 최신글 표시 -->
	 				    					<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
											<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 변환 -->
											<fmt:parseNumber value="${review.re_writeDate.time / (1000*60*60*24)}" integerOnly="true" var="writeDate" /><!-- 게시글 작성일를 숫자로 변환 -->
											<c:if test="${today - writeDate <= 1}"><!-- 하루동안 new 표시 -->
												<a href="${contextPath}/review/content?re_articleNO=${review.re_articleNO }">${review.re_title }</a>
												<img src="${contextPath}/resources/image/review/new.png" width="32px" alt="new" />
												<img src="${contextPath}/resources/image/review/new2.png" width="25px" alt="new" />
												<img src="${contextPath}/resources/image/review/new3.png" width="25px" alt="new" />
											</c:if>
											<c:if test="${today - writeDate > 1}">
												<a href="${contextPath}/review/content?re_articleNO=${review.re_articleNO }">${review.re_title }</a>
											</c:if>
										</c:otherwise> --%>
										<c:otherwise> <!-- 최신글 표시 -->
										    <c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
										    <c:set var="oneDayMillis" value="86400000" /><!-- 1일을 밀리초로 변환 -->
										
										    <c:set var="timeDiff" value="${now.time - review.re_writeDate.time}" /><!-- 현재시간과 게시글 작성일의 시간 차이 -->
										
										    <c:if test="${timeDiff <= oneDayMillis}"><!-- 하루동안 new 표시 -->
										        <a href="${contextPath}/review/content?re_articleNO=${review.re_articleNO}">${review.re_title}</a>
										        <img src="${contextPath}/resources/image/review/new.png" width="32px" alt="new" />
										    </c:if>
										    <c:if test="${timeDiff > oneDayMillis}">
										        <a href="${contextPath}/review/content?re_articleNO=${review.re_articleNO}">${review.re_title}</a>
										    </c:if>
										</c:otherwise>
					    			</c:choose>				    			
				    			</td>
				    			<!-- 작성자 -->
								<td>${review.userId }</td>
								<!-- 작성일자 -->
								<td><fmt:formatDate value="${review.re_writeDate }" pattern="yyyy.MM.dd"/></td>
								<!-- 조회수 -->
								<td><c:out value="${review.re_viewCnt }"/></td>
				    		</tr>
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
					</c:otherwise>  
				</c:choose>
	  		</tbody>
		</table>
		
		<!-- 페이징 -->
		<div class="pagination">
			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev}">
            	<a href="${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
            </c:if>
              	
			<!-- 각 번호 페이지 버튼 -->				
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="curPage">
				<c:if test="${select != curPage }">
					<a href="search${pageMaker.makeSearchQuery(curPage, s_title)}">${curPage}</a>
				</c:if>
				<c:if test="${select == curPage }">
					<a class="active" href="search${pageMaker.makeSearchQuery(curPage, s_title)}">${curPage}</a>
				</c:if>
			</c:forEach>
			
			<!-- 다음페이지 버튼 -->
            <c:if test="${pageMaker.next && pageMaker.endPage>0}">
                <a href="${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a>
            </c:if>  
			<form id="moveForm" method="get">
				<input type="hidden" name="curPage" value="${pageMaker.criteria.curPage }">
				<input type="hidden" name="postsPerPage" value="${pageMaker.criteria.postsPerPage }">
			</form>
		</div>
		
		<!-- 글쓰기 버튼  -->
		<div>
			<!-- 하유리: 로그인한 사용자만 글쓰기 버튼 활성화(23.07.18.) -->
			<c:if test="${isLogOn==true && user!=null}">
				<button class="writeBtn" type="button" onClick="handleButtonClick()">글쓰기</button>
			</c:if>
		</div>
	</div>

<script>
	function handleButtonClick() {
		// 경고창 띄우기
		if (true) {
			alert("주문하신 상품을 선택해주세요.")
			// 사용자가 확인 버튼을 누른 경우 페이지 이동
			const contextPath = '${contextPath}'; // 여기에 원하는 경로를 입력하세요
			const insertUrl = contextPath + '/mypage/orderList';
			window.location.href = insertUrl;
		} else {
			// 사용자가 취소 버튼을 누른 경우 아무 작업 없음
			// 필요에 따라 취소 버튼을 눌렀을 때의 동작을 추가할 수 있습니다.
		}
	}
</script>
	
</body>
</html>