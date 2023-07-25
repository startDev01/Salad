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
	
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		* { 
 			font-family: 'Noto Sans KR', sans-serif;
 			font-size: 14px;
		}
	
		.container {
/* 			width: 100%;
			display: flex;
			justify-content: center; */
			text-align: center;
			/* margin: 0 auto; */
		}
		
		/* 게시판 제목: 리뷰게시판 */
		.subject {
			font-size: 24px;
			margin-bottom: 20px;
		}
		
		/* 중앙정렬 */
		.insert_table {
			width: 100%;
			display: flex;
			justify-content: center;
		}
		
		/* 하유리: 행 간격 띄우기(23.07.17.) */
		.insert_table table {
			text-align: left;	/* th 왼쪽정렬 */
			border-collapse: separate;
			border-spacing: 10px 20px;
		}
	
		/* 하유리: 글자-input박스 간 간격(23.07.17.) */
		.insert_table th {
			font-weight: normal;
			flex: left;
			padding-right: 100px;
		}
		
		.insert_table input, textarea {
			padding: 5px 5px;
		}
		
		/* input, textarea 스타일 지정 */
		.insert_table input {
			border: 1px solid #e3e3e3;
			border-radius: 5px;
			width: 640px;
			height: 44px;
		}
		
		.insert_table textarea {
			border: 1px solid #e3e3e3;
			border-radius: 5px;
			width: 640px;
			height: 250px;
		}
		
		/* input, textarea 클릭 시 생기는 테두리 스타일 지정(23.07.17.)  */
		input:focus{
			outline: 1px solid #000;
		}
		
		textarea:focus {
			outline: 1px solid #000;
		}
		
		.insert_btn {
			float: right;
			padding-right: 10px;
		}
	
		.writeBtn{
			margin: 0px 0px 60px 0px;
			padding: 5px 10px;
			border-radius: 5px;
			border-style: none;
			background-color:#128853;
			color: #fff;
			float: right;
			margin-left: 20px;
			float: center;
		}
	</style>

</head>

<body>
	<div class="container mt-3">
		<!-- 제목 -->
		<h3 class="subject">리뷰게시판</h3>
	
		<!-- 게시판 -->
		<div class="insert_table">
			<form action="<c:url value='/notice/update'/>" method="POST" enctype="multipart/form-data">
				<input name="re_articleNO" type="hidden" value="${notice.articleNO }">
				<table>
					<tr>
						<th>주문상품</th>
						<td>	<input class="insert_input" name="orderList" required autocomplete="off" width="440px" disabled/></td>
					</tr>
				
 					<tr>
						<th>작성자</th>
						<td>	
							<input class="insert_input" name="userId" value="${notice.userId }" type="text" placeholder="이름을 입력해 주세요." 
							required autocomplete="off">
						</td>
					</tr>
		
					<tr>
						<th>제목</th>
						<td>	
							<input class="insert_input" name="re_title" value="${notice.title }" type="text" placeholder="제목을 입력해 주세요." 
							required autocomplete="off"></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td>
							<textarea class="insert_input" name="re_content" cols="50" rows="10" placeholder="내용을 입력해 주세요." 
							required autocomplete="off">${notice.content }</textarea>
						</td>
					</tr>
					
					<tr>
						<th>이미지 파일 업로드</th>
						<td><input type="file" multiple="multiple"></td>
					</tr>			
				</table>
				
				<div class="insert_btn">
					<button class="writeBtn" type="button" onClick="location.href='/notice/list'">글목록</button>
					<button class="writeBtn" type="reset" >초기화</button>
					<button class="writeBtn" type="submit">글등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>