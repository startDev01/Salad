<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- css 적용 -->
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/css/main.css" rel="stylesheet" type="text/css">
    <style>
        /* 김동혁 - css 임시 추가(23.07.13.) */
        .listBox {
            display: inline-block;
        }

        .prodBox {
            display: flex;
            float: left;
            height: 100px;
            width: 350px;
            /*background-color: #f9f9f9;*/
            border: 1px solid gray;
            border-radius: 5px;
            margin: 20px;
            justify-content: left;
            align-items: center;
        }

        .prodBox:hover {
            cursor: pointer;
        }

        .prodP {
            display: flex;
            transition: all 50ms linear;
        }

        .prodP_imgBox {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 10px;
        }

        /* !! 이미지 수정 부분 !! */
        .prodP_img {
            width: 95px;
            height: 95px;
        }

        .prodTextBox {
            margin-left: 10px;
            text-align: left;
        }

        .prodP:hover {
            transform: scale(1.05);
        }
    </style>
    <title>메뉴 고르기</title>

</head>
<body>
<div class="content1">
    <h1>메뉴 담기</h1>

    <%-- 김동혁 수정 ( 리스트 출력 )(23.07.14.)--%>
    <div class="listBox">
        <c:forEach var="prod" items="${prodList}" varStatus="prodNum">
            <%-- 채소 타이틀 출력 --%>
            <c:if test="${prodNum.index == 0}">
                <h2>채소</h2>
            </c:if>

            <%-- 육류 타이틀 출력 --%>
            <c:if test="${prodNum.index == 9}">
                <h2>육류</h2>
            </c:if>
            <c:if test="${prodNum.index mod 3 == 0}">
                <br>
            </c:if>
            <div class="prodBox">
                <div class="prodP">
                    <div class="prodP_imgBox">
                        <img class="prodP_img" src="${prod.prodImageUrl}${prod.prodImageName}">
                        </img>
                    </div>
                    <div class="prodTextBox">
                        <p>${prod.prodName}</p>
                        <p>${prod.prodPrice} ₩ </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


</body>
</html>
