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
    <!-- <link href="../resources/css/notice.css" rel="stylesheet" type="text/css"> -->
    <style>
    
/* 폰트 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
/* 이벤트페이지 제목1+제목2 */
.notice_sub {
	margin: 50px 0 0 0 ;
	padding-top: 178px;	/* 하유리: 헤더 영역만큼 아래로 내림(23.07.25.) */
}

/* 이벤트페이지 제목1  */
.notice_text1 {
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

/* 게시물 제목 스타일 */
.notice_title a {
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
	<div class="notice_sub">
		<p class="notice_text1">샐러드다이소 공지게시판</p>
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
					<c:when test="${!empty noticeList}">
						<c:forEach items="${noticeList }" var="notice" varStatus="noticeStatus">
				    		<tr>
				    			<!-- 글 번호 -->
				    			<th scope="row">	
				    				<span>${notice.articleNO }</span>
				    			</th>
				    			
				    			<!-- 글 제목 -->
				    			<td class="notice_title" align="left">
				    				<!-- 최신글 표시 -->
				    				<div>
					    				<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
									    <c:set var="oneDayMillis" value="86400000" /><!-- 1일을 밀리초로 변환 -->
									
									    <c:set var="timeDiff" value="${now.time - notice.writeDate.time}" /><!-- 현재시간과 게시글 작성일의 시간 차이 -->
									
									    <c:if test="${timeDiff <= oneDayMillis}"><!-- 하루동안 new 표시 -->
									        <a href="${contextPath}/notice/content?articleNO=${notice.articleNO}">${notice.title}</a>
									        <img src="${contextPath}/resources/image/notice/new.png" width="32px" alt="new" />
									    </c:if>
									    <c:if test="${timeDiff > oneDayMillis}">
									        <a href="${contextPath}/notice/content?articleNO=${notice.articleNO}">${notice.title}</a>
								    	</c:if>
				    				</div>
				    			</td>
				    			<!-- 작성자 -->
								<td>${notice.userId }</td>
								<!-- 작성일자 -->
								<td><fmt:formatDate value="${notice.writeDate }" pattern="yyyy.MM.dd"/></td>
								<!-- 조회수 -->
								<td><c:out value="${notice.viewCnt }"/></td>
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
		<div class="noticeBtn">
			<!-- 하유리: id가 admin(관리자)인 사람만 글쓰기 버튼 활성화(23.07.24.) -->
			<c:set var="userId" value="admin" />
				<c:if test="${userId eq 'admin'}">
				    <button class="writeBtn" type="button" onClick="location.href='${contextPath}/notice/insert'">글쓰기</button>
				</c:if>			
		</div>
	</div>
	
</body>
</html>