<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <!-- css 적용 -->
   <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
 	<link href="../resources/css/header.css" rel="stylesheet" type="text/css" >
	<link href="../resources/css/footer.css" rel="stylesheet" type="text/css" >
	
	<style>
	 h1 {   /* 임시 */
         padding-top: 178px;   /* 하유리: 헤더 영역만큼 아래로 내림(23.07.25.) */
      }
	#login_table{
	width:100%;
	 display: flex;
	 justify-content: center;
	}
	.user-form {
           display: inline-block;
           padding: 30px;
        }
     .fixed_join{
     	 justify-content: center;
         padding-top:12px;
         padding-right:15px;
         } 
	</style>
</head>
<body>
	<h1>1. 주문 상세정보</h1>
	<table class="list_view">
		<tbody align=center>
			<tr style="background:lightgray">
			     <td  width="120px">주문번호 </td>
			     <td  width="120px">주문일자 </td>
				<td  width="120px">주문상품명</td>
				<td  width="120px">수량</td>
				<td  width="120px">주문금액</td>
				<td  width="120px">배송비</td>
				<td  width="120px">주문합계</td>
			</tr>
			<c:forEach var="item" items="${myOrderList }">
			<tr>
				    <td> ${item.fakeOrderNum}</td>
				     <td> ${item.orderCreateTimestamp}</td>
					<%-- <td class="goods_image">
					  <a href="${contextPath}/detail?prodNum=${item.prodNum }">
					    <img width="75" alt=""  src="${contextPath}/thumbnails.do?prodNum=${item.prodNum}&fileName=${item.prodImageName}">
					  </a>
					</td> --%>
					<%-- <td>
					  <h2>
					     <a href="${contextPath}/detail?prodNum=${item.prodNum }">${item.prodName }</a>
					  </h2>
					</td> --%>
					<td>
					  <h2>${item.menuCount }개<h2>
					</td>
					<td><h2>${item.menuCount *item.prodPrice}원 (10% 할인)</h2></td>
					<td><h2>0원</h2></td>
					<td><h2>${1500 *item.menuCount }원</h2></td>
					<td>
					  <h2>${item.menuCount *item.prodPrice}원</h2>
					</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
<form  name="form_order">
	<br>
	<br>
	<h1>2.배송지 정보</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">배송일자</td>
					<td>
					   ${myOrderList[0].prodDeliveryDate }
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">받으실 분</td>
					<td>
					${myOrderList[0].destName }
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">받는분 연락처</td>
					<td>
					 ${myOrderList[0].destPhone} 
					  <%-- ${myOrderList[0].receiver_hp1}-${myOrderList[0].receiver_hp2}-${myOrderList[0].receiver_hp3} --%>
					  </td>
				  </tr>

				<tr class="dot_line">
					<td class="fixed_join">받는분 주소지</td>
					<td>
					   ${myOrderList[0].destLoc1}<br>
					   ${myOrderList[0].destLoc2}
					</td>
				</tr>
				<%-- <tr class="dot_line">
					<td class="fixed_join">배송 메시지</td>
					<td>
					${myOrderList[0].delivery_message}
					</td>
				</tr> --%>
				
			</tbody>
		</table>
		
	</div>
	<div >
	  <br><br>
	   <h2>주문고객</h2>
		 <table >
		   <TBODY>
			 <tr class="dot_line">
				<td ><h2>이름</h2></td>
				<td>
				 <input  type="text" value="${orderer.orderName}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>연락처</h2></td>
				<td>
				 <input  type="text" value="${orderer.orderPhone}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>이메일</h2></td>
				<td>
				   <input  type="text" value="${orderer.orderEmail}" size="15" disabled />
				</td>
			  </tr>
		   </tbody>
		</table>
	</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<%-- <h1>3.결제정보</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">결제방법</td>
					<td>
					   ${myOrderList[0].pay_method }
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">결제카드</td>
					<td>
					   ${myOrderList[0].card_com_name}
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">할부기간</td>
					<td>
					   ${myOrderList[0].card_pay_month }
				    </td>
				</tr>
			</tbody>
		</table>
	</div> --%>
</form>
    <div class="clear"></div>
	<br>
	<br>
	<br>
		<br>
		<br> 
		<a href="${contextPath}/menu"> 
		   <img width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		</a>
<div class="clear"></div>		
	
			
			
			