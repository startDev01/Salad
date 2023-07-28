<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- 날짜 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<!-- 파비콘 -->
	<link rel="icon" href="<c:url value='/resources/image/favicon.ico'/>" type="image/x-icon"/>

	<style>	
		/* 폰트 */
 		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
 		
		/* 이벤트페이지 제목1+제목2 */
		.event_sub {
			margin: 50px 0 0 0 ;
			padding-top: 178px;	/* 하유리: 헤더 영역만큼 아래로 내림(23.07.25.) */
		}
	
		/* 이벤트페이지 제목1  */
		.event_text1 {
    		font-family: 'Noto Sans KR', sans-serif;
			font-size: 43px;
			font-weight: 700;
			line-height: 1.2;
    		letter-spacing: -3px;
    		/* margin-bottom: 20px; */	/* 제목1, 제목2 사이 간격 */
		}
	
 		.container {
			width: 100%;
			padding: 0 200px 100px 200px;
			margin: auto;
			text-align: center;
			font-family: 'Noto Sans KR', sans-serif;
 			font-size: 14px;
		}
		
 		.table {
			padding: 20px 0;
			text-align: center;
		}
		
		/* 제목 스타일 */
		.re_title a {
			text-decoration: none;
			color: #000;
		}
	
		/* 페이징 */
		.pagination {
			display: inline-block;
			margin: 20px 0;
		}		
		.pagination a {
			color: black;
			padding: 8px 16px;
			text-decoration: none;
		}		
		/* 현재페이지 스타일 */
		.pagination a.active{
			background-color: #128853;
			color: #fff;
			font-weight: bold;
		}		
		.pagination a:hover:not(.active){
			background-color: #ddd;
		}
		
		/* 글쓰기 버튼 */		
		.writeBtn {
			margin: 0px 0px 60px 0px;
			padding: 5px 10px;
			text-align: center;
			border-radius: 5px;
			border-style: none;
			background-color:#128853;
			color: #fff;
			float: right;
		}
	</style>

</head>

<body>
	<!-- 제목: 변경(23.07.21.) -->
	<div class="event_sub">
		<p class="event_text1">샐러드다이소 리뷰게시판</p>
		<!-- <p class="event_text2">다양한 이벤트를 확인하고 참여해보세요.</p> -->
		<img style="width: 50px" src="${contextPath}/resources/image/event/line.png" />
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
				    						<span><img width="20px" src="${contextPath}/resources/image/review/bestCnt.png"/></span>
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
					    					<span style="font-size:15px; color:#128853"> [베스트]</span>
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
					<a href="${pageMaker.makeQuery(curPage)}">${curPage}</a>
				</c:if>
				<c:if test="${select == curPage }">
					<a class="active" href="${pageMaker.makeQuery(curPage)}">${curPage}</a>
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
				<button class="writeBtn" type="button" onClick="location.href='${contextPath}/review/insert'">글쓰기</button>
			</c:if>
		</div>
	</div>
	
</body>
</html>