<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- css 적용 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="../resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="../resources/css/footer.css" rel="stylesheet" type="text/css">
	<style>
		/* 폰트 */
 		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
 		
		/* 이벤트페이지 제목1+제목2 */
		.event_sub {
			margin: 50px 0 ;
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
/*			display: flex;
			justify-content: center; */
			text-align: center;
			font-family: 'Noto Sans KR', sans-serif;
 			font-size: 14px;
			margin: 0 auto;
		}

		/* 중앙정렬 */
		.content_table {
			width: 100%;
			display: flex;
			justify-content: center;
		}
		
		/* 하유리: 행 간격 띄우기(23.07.17.) */
		.content_table table {
			text-align: left;	/* th 왼쪽정렬 */
			border-collapse: separate;
			border-spacing: 10px 20px;
		}
	
		/* 하유리: 글자-input박스 간 간격(23.07.17.) */
		.content_table th {
			font-weight: normal;
			flex: left;
			padding-right: 100px;
		}
		
		.content_table input, textarea, .review_preview {
			padding: 5px 5px;
		}
		
		.review_preview {
			margin-top: -5px;
		}
	
		/* input, textarea 스타일 지정 */
		.content_table .content_input {
			border: 1px solid #e3e3e3;
			border-radius: 5px;
			width: 640px;
			height: 44px;
		}
		
		.content_table .content_text {
			border: 1px solid #e3e3e3;
			border-radius: 5px;
			width: 640px;
			height: 250px;
		}
		
		.content_table .content_input_file {
			border: 1px solid #e3e3e3;
			border-radius: 5px;
			width: 640px;	
		}
		
		/* input, textarea 클릭 시 생기는 테두리 스타일 지정(23.07.17.)  */
		.content_text:focus{
			outline: 1px solid #000;
		}
		
		.content_input_file:focus {
			outline: 1px solid #000;
		}
		
		/* 업로드 이미지 파일이름 뜨는 input박스 */
		.review_imgName {
			border: none;	/* 테두리 없애기 */
		}
		
		/* 버튼 */
		.content_btn1 {
			float: left;
			margin-left: 10px;
		}
		
		.content_btn2 {
			float: right;
			margin-right: 10px;
		}
	
		.contentBtn{
			margin: 0px 0px 60px 0px;
			padding: 5px 10px;
			border-radius: 5px;
			border-style: none;
			background-color:#128853;
			color: #fff;
		}
	</style>
</head>

<body>		
	<div class="container mt-3">
		<!-- 제목: 변경(23.07.21.) -->
		<div class="event_sub">
			<p class="event_text1">샐러드다이소 리뷰게시판</p>
			<!-- <p class="event_text2">다양한 이벤트를 확인하고 참여해보세요.</p> -->
			<img style="width: 50px" src="${contextPath}/resources/image/event/line.png" />
		</div>
		
		<!-- 게시판 -->
		<div class="content_table">
			<form action="<c:url value='/review/update'/>" method="POST" enctype="multipart/form-data" role="form">
				<input name="re_articleNO" type="hidden" value="${review.re_articleNO }" disabled>
				<table>
					<tr>
						<th>주문상품</th>
						<td>	<input class="content_input" name="orderList" type="text" disabled/></td>
					</tr>
				
 					<tr>
						<th>작성자</th>
						<td>	
							<input class="content_input" name="userId" type="text" value="${review.userId }" disabled>
						</td>
					</tr>
		
					<tr>
						<th>제목</th>
						<td>	
							<input class="content_input" name="review_title" type="text"  value="${review.re_title }" disabled></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td>
							<textarea class="content_text" name="review_content" cols="50" rows="10" disabled>${review.re_content }</textarea>
						</td>
					</tr>
					
					<tr>
						<th>이미지 파일 업로드</th>
						<td>	
							
								<c:choose>
									<c:when test="${empty review.re_imageFileList}">
										<input class="content_input" name="orderList" type="text" disabled/>
									</c:when>
									<c:otherwise>
										<div class="content_input_file">
											<c:forEach items="${review.re_imageFileList}" var="re_imageFileList">
												<input class="review_imgName" name="review_image" type="text" value="${re_imageFileList.re_originalFileName}"  disabled/><br/>
												<img class="review_preview" src="${contextPath}/review/imgDown?re_storedFileName=${re_imageFileList.re_storedFileName}" style="width:200px;"/><br/>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							
						</td>					
					</tr>
								
					<tr>
						<th>조회수</th>
						<td><input class="content_input" name="review_viewCnt" value="${review.re_viewCnt }" disabled></td>
					</tr>	
							
					<tr>
						<th>작성일</th>
						<td><input class="content_input" name="review_upload" value="${review.re_writeDate }" disabled></td>
					</tr>		
						
				</table>
				
				<!-- 버튼 -->
				<div> 
					<div class="content_btn1">
						<button type="button" class="contentBtn" onClick="location.href='${contextPath}/review/list'">목록</button>
						<button type="button" class="contentBtn" onClick="location.href='${contextPath}/review/insert'">글쓰기</button>
					</div>
					<div class="content_btn2">
						<button type="button" class="contentBtn" onClick="location.href='${contextPath}/review/reply?re_articleNO=${review.re_articleNO }'">답글</button>
						<!-- 하유리: 본인 게시글만 수정, 삭제할 수 있도록 처리(23.07.18.) -->
						<c:if test="${user.userId == review.userId }">
							<button type="button" class="contentBtn" onClick="location.href='${contextPath}/review/update?re_articleNO=${review.re_articleNO }'">수정</button>
							<button type="button" class="contentBtn" onClick="location.href='${contextPath}/review/delete?re_articleNO=${review.re_articleNO }'">삭제</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>