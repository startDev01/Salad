<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/footer.css" rel="stylesheet" type="text/css">
<style>
  body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
  }

  main {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    padding-top: 178px;   /* 하유리: 헤더 영역만큼 아래로 내림(23.07.27.) */
  }

#h1{
color : #333;
font-size:40px;
margin-top : 70px;
margin-bottom: 150px;
}
		.h3{
         display: flex;
         justify-content: flex-start;
         align-items: center;
         font-size:15px;
         font-weight: bold;
         margin-left:15px;
        }

 			.info-block {
            margin-bottom: 20px;
            border: none;
            padding: 10px;
            background-color: #f9f9f9;
 		 }

       .line {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            flex-direction: row;
        }

        .line-title {
            width: 120px;
            font-weight: bold;
            margin-right: 10px;
            padding:10px;
            background-color: #128853;
            color: #fff;
        }

        .line-content {
             flex-grow: 1;
             text-align: left;
             padding-left:10px;
        }
        
</style>
<title>Insert title here</title>
</head>
<body>
<main>
<p id = "h1">결제가 완료되어 주문이 접수됐습니다.<p>

<p class="h3">주문 정보</p>
    <div class="info-block to">
        <div class="line">
          <div class="line-title"><label for="name">이름</label></div>
          <div class="line-content"><label name="username" id="username" >${userName}</label>
          </div>
        </div>
        <div class="line">
          <div class="line-title"><label for="orderNum">주문번호</label></div>
          <div class="line-content"><label name="orderNum" id="orderNum">${randomNumber}</label>
          </div>
        </div>
        <div class="line">
          <div class="line-title"><label for="orderTime">주문일자</label></div>
          <div class="line-content"><label name="orderTime" id="orderTime">${formattedOrderTime}</label>
          </div>
        </div>
        </div>
</main>
</body>
</html>