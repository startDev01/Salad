<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <!-- css 적용 -->
   <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
 	<link href="../resources/css/header.css" rel="stylesheet" type="text/css" >
	<link href="../resources/css/footer.css" rel="stylesheet" type="text/css" >
	
	<style>
	  .myinfo{   /* 임시 */
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
     .list_order_view{
      	display: flex;
	 	justify-content: center;
         }
	</style>
	
<c:if test="${message=='cancel_order'}">
	<script>
	window.onload=function()
	{
	  init();
	}
	
	function init(){
		alert("주문을 취소했습니다.");
	}
	</script>
</c:if>
<script>
function fn_cancel_order(orderNum){
	var answer=confirm("주문을 취소하시겠습니까?");
	if(answer==true){
		var formObj=document.createElement("form");
		var i_orderNum = document.createElement("input"); 
	    
		i_orderNum.name="orderNum";
		i_orderNum.value=orderNum;
		
	    formObj.appendChild(i_orderNum);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/mypage/cancelMyOrder.do";
	    formObj.submit();	
	}
}

</script>
</head>
<body>
<h1 class="myinfo">나의 정보</h1><br>
<table border=1 width=70% cellpadding=10 cellspacing=10 align="center">
  <tr>
    <td  align="center">
	   이메일
   </td>
    <td  align="center">
	   <strong>${user.userEmail}</strong>
   </td>
   </tr>
   <tr>
    <td  align="center">
	   연락처
   </td>
    <td  align="center">
	   <strong>${user.userPhone }</strong>
   </td>
   </tr>
   <tr>
    <td  align="center">
	  주소지 
   </td>
    <td  align="center">
		 기본 주소:  &nbsp;&nbsp; <strong>${user.userAddress1 }</strong>  <br>
		 상세 주소:   &nbsp;&nbsp; <strong>${user.userAddress2 }</strong> 
   </td>
   </tr>
</table>
<br><br>
<h1>최근주문내역</h1><br>
<table class="list_order_view">
		<tbody align="center" >
			<tr style="background:lightgray" >
				<td  width="120px">주문번호</td>
				<td  width="120px">주문일자</td>
				<!-- <td  width="120px">주문상품/수량</td> -->
				<td  width="120px">주문자</td>
				<td  width="120px">주문상태</td>
				<td  width="120px">주문취소</td>
			</tr>
	<%-- 주문내역이 비어있을 경우 --%>
	<c:choose>
         <c:when test="${ empty myOrderList  }">
		  <tr>
		    <td colspan=5 class="fixed">
				  <strong>주문한 상품이 없습니다.</strong>
		    </td>
		  </tr>
        </c:when>
        <%-- 주문 테이블 목록 출력 --%>
        <c:otherwise>
	      <c:forEach var="item" items="${myOrderList }"  varStatus="i">
	       <c:choose> 
             <c:when test="${ pre_orderNum != item.orderNum}">
              <%-- <c:choose>
	              <c:when test="${item.orderStatus=='delivery_prepared' }">
	                <tr  bgcolor="lightgreen">    
	              </c:when>
	              <c:when test="${item.orderStatus=='finished_delivering' }">
	                <tr  bgcolor="lightgray">    
	              </c:when>
	              <c:otherwise>
	                <tr  bgcolor="orange">
	              </c:otherwise>
	            </c:choose> --%>
            <tr>
             <td>
		      <%--  <a href="${contextPath}/mypage/myOrderDetail.do?fakeOrderNum=${item.fakeOrderNum }"> --%>
		      <span><a href="#">${item.fakeOrderNum } </a></span>
		     </td>
		    <td><span>${item.orderCreateTimestamp }</span></td>
			 <td><span>${item.ordererName }</span></td>
			 <td><span>${item.orderStatus }</span></td>
			<%-- <td align="left">
			   <strong>
			      <c:forEach var="item2" items="${myOrderList}" varStatus="j">
			          <c:if  test="${item.orderNum ==item2.orderNum}" >
			           <a href="${contextPath}/cart?prodNum=${item2.prodNum }"></a>${item2.orderNum }/${item.totalPrice }개<br>
			         </c:if>
				 </c:forEach>
				</strong></td> --%>
			<%-- <td>
			  <c:choose>
			    <c:when test="${item.orderStatus=='delivery_prepared' }">
			       배송준비중
			    </c:when>
			    <c:when test="${item.orderStatus=='delivering' }">
			       배송중
			    </c:when>
			    <c:when test="${item.orderStatus=='finished_delivering' }">
			       배송완료
			    </c:when>
			    <c:when test="${item.orderStatus=='cancel_order' }">
			       주문취소
			    </c:when>
			    <c:when test="${item.orderStatus=='returning_goods' }">
			       반품완료
			    </c:when>
			  </c:choose>
			</td> --%>
			<td>
			  <c:choose>
			   <c:when test="${item.orderStatus=='delivery_prepared'}" >
			       <input  type="button" onClick="fn_cancel_order('${item.orderNum}')" value="주문취소"  />
			   </c:when>
			   <c:otherwise>
			      <input  type="button" onClick="fn_cancel_order('${item.orderNum}')" value="주문취소"  />
			   </c:otherwise>
			  </c:choose>
			</td>
			</tr>
          <c:set  var="pre_orderNum" value="${item.orderNum}" />
           </c:when>
      </c:choose>
	   </c:forEach>
	  </c:otherwise>
    </c:choose> 	    
</tbody>
</table>
<br><br>	
<h1>계좌내역</h1><br>
<div class="pay_form" align="center">
<table border=1  width=70%  cellpadding=10 cellspacing=10>
  <tr>
    <td align="center">
	   예치금 &nbsp;&nbsp;  <strong>5000원</strong>
   </td>
    <td align="center">
	   쇼핑머니 &nbsp;&nbsp; <strong>1000원</strong>
   </td>
   </tr>
   <tr>
    <td align="center">
	   쿠폰 &nbsp;&nbsp;  <strong>3000원</strong>
   </td>
    <td align="center">
	   포인트 &nbsp;&nbsp; <strong>2000원</strong>
   </td>
   </tr>
   <tr>
    <td align="center">
	   상품권 &nbsp;&nbsp;  <strong>10000원</strong>
   </td>
    <td align="center">
		디지털머니 &nbsp;&nbsp; <strong>3000원</strong>
   </td>
   </tr>
</table>

</div>
 <br><br>
</body>
</html>
