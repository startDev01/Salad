<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
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
      #orderhis_Form{
      	/* width:100%; */
      	display: flex;
	 	justify-content: center;
      }
      .list_order_sub{
        display: flex;
	 	justify-content: center;
      }
	</style>

</head>
<body>
	<!-- 서승희 23.07.25 추가 -->
	<h1>주문 내역 </h1>
	<br><br>
	<form method="post" id="orderhis_Form">
		<table>
			<tbody>
				<tr>
					<td>
					<input type="radio" name="simple" checked /> 간단조회
						&nbsp;&nbsp;&nbsp; <input type="radio" name="simple" /> 일간
						&nbsp;&nbsp;&nbsp; <input type="radio" name="simple" /> 월간
					</td>
				</tr>
				<tr>
					<td><select name="search_condition">
							<option value="2015" checked>전체</option>
							<option value="2014">주문일자</option>
							<option value="2013">주문자</option>
							<option value="2012">주문번호</option>
					</select> <input type="text" size="30" /> 
					<input type="button" onClick="search_order_history('${fixedSearchPeriod }') " value="조회" />
					</td>
				</tr><br>
				<%-- <tr>
					<td><select name="curYear">
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
									<c:when test="${endYear==endYear-i }">
										<option value="${endYear}" selected>${endYear}</option>
									</c:when>
									<c:otherwise>
										<option value="${endYear-i }">${endYear-i }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>년 <select name="curMonth">
							<c:forEach var="i" begin="1" end="12">
								<c:choose>
									<c:when test="${endMonth==i }">
										<option value="${i }" selected>${i }</option>
									</c:when>
									<c:otherwise>
										<option value="${i }">${i }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>월 <select name="curDay">
							<c:forEach var="i" begin="1" end="31">
								<c:choose>
									<c:when test="${endDay==i }">
										<option value="${i }" selected>${i }</option>
									</c:when>
									<c:otherwise>
										<option value="${i }">${i }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>일
					&nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp;   --%>
					<tr>
						<td>
					<a href="javascript:search_order_history('today')"> 
					<img src="${contextPath}/resources/image/search/btn_search_one_day.jpg">
					</a> 
					<a href="javascript:search_order_history('one_week')"> 
					<img src="${contextPath}/resources/image/search/btn_search_1_week.jpg">
					</a> 
					<a href="javascript:search_order_history('two_week')"> 
					<img src="${contextPath}/resources/image/search/btn_search_2_week.jpg">
					</a> 
					<a href="javascript:search_order_history('one_month')"> 
					<img src="${contextPath}/resources/image/search/btn_search_1_month.jpg">
					</a> 
					<a href="javascript:search_order_history('two_month')"> 
					<img src="${contextPath}/resources/image/search/btn_search_2_month.jpg">
					</a> 
					<a href="javascript:search_order_history('three_month')"> 
					<img src="${contextPath}/resources/image/search/btn_search_3_month.jpg">
					</a> 
					<a href="javascript:search_order_history('four_month')"> 
					<img src="${contextPath}/resources/image/search/btn_search_4_month.jpg">
					</a> &nbsp;까지 조회
					</td>
				</tr><br>
				<tr>
					<td>조회한 기간  <input type="text" size="3" value="${beginYear}" />년
						<input type="text" size="3" value="${beginMonth}" />월 
						<input type="text" size="3" value="${beginDay}" />일 &nbsp; ~ 
						<input type="text" size="3" value="${endYear}" />년 
						<input type="text" size="3" value="${endMonth}" />월 
						<input type="text" size="3" value="${endDay}" />일
					</td>
				</tr>
			</tbody>
		</table>
		<div class="clear"></div>
	</form>
	<div class="clear"></div>
	
	<div class="list_order_sub">
		<table class="list_order_view">
			<thead class="list_order_head" style="text-align: center;">
				<tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;">
					<th width="120px">주문번호</th>
					<th width="120px">주문일자</th>
					<th width="120px">주문내역</th>
					<th width="120px">주문금액</th>
					<th width="120px">주문자</th>
					<!-- <th width="120px">결제금액</th> -->
					<th width="120px">주문상태</th>
					<th width="120px">주문취소</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${empty myOrderHistList }">
						<tr>
							<td colspan=8 class="fixed"><strong>주문한 상품이 없습니다.</strong></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${myOrderHistList }" varStatus="i">
							<c:choose>
								<c:when test="${item.orderNum != pre_orderNum}">
									<tr>
										<td>
										<a href="${contextPath}/mypage/myOrderDetail.do?fakeOrderNum=${item.fakeOrderNum }"><strong>${item.fakeOrderNum }</strong>
										<%-- <a href="${contextPath}/mypage/myOrderDetail.do?orderNum=${item.orderNum }"><strong>${item.orderNum }</strong> --%>
										</a></td>
										<td><strong>${item.orderCreateTimestamp }</strong></td>
										<span>${orderMenuVO.menuName }</span>
										<td><strong> 
										<c:forEach var="item2"
													items="${myOrderHistList}" varStatus="j">
													<c:if test="${item.orderNum ==item2.orderNum}">
														<%-- <a href="${contextPath}/detail?prodNum=${item2.prodNum }">${item2.menuName }</a> --%>
														<br>
													</c:if>
												</c:forEach>
										</strong></td>
										<td><strong> 
										<c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
													<c:if test="${item.orderNum ==item2.orderNum}">
													${item.totalPrice }원<br>
				             						<%-- ${item.totalPrice*item.menuCount }원/${item.menuCount }<br> --%>
													</c:if>
												</c:forEach>
										</strong></td>
										<td><strong>${item.ordererName }</strong></td> 
										<td><strong>
										<c:choose>
													<c:when test="${item.orderStatus=='delivery_prepared' }">
					       							배송준비중
					   								 </c:when>
													<c:when test="${item.orderStatus=='delivering' }">
					       							배송중
					    							</c:when>
													<c:when
														test="${item.orderStatus=='finished_delivering' }">
					       								배송완료
					    							</c:when>
													<c:when test="${item.orderStatus=='cancel_order' }">
					       								주문취소
					    							</c:when>
													<c:when test="${item.orderStatus=='returning_goods' }">
					     								  반품
					    						</c:when>
												</c:choose>
										</strong>
										</td>
										<td>
										<c:choose>
												<c:when test="${item.orderStatus=='delivery_prepared'}">
													<input type="button"onClick="fn_cancel_order('${item.orderNum}')" value="주문취소" />
												</c:when>
												<c:otherwise>
													<%-- <input type="button" onClick="fn_cancel_order('${item.orderNum}')" value="주문취소" disabled /> --%>
													<input type="button" onClick="fn_cancel_order('${item.orderNum}')" value="주문취소" />
													
												</c:otherwise>
											</c:choose></td>
									</tr>
									<c:set var="pre_orderNum" value="${item.orderNum }" />
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
			
		<div class="clear" ></div>
	</div>
	<br><br>
	<script>
	function search_order_history(fixedSearchPeriod) {
		var formObj = document.createElement("form");
		var i_fixedSearch_period = document.createElement("input");
		i_fixedSearch_period.name = "fixedSearchPeriod";
		i_fixedSearch_period.value = fixedSearchPeriod;
		formObj.appendChild(i_fixedSearch_period);
		document.body.appendChild(formObj);
		formObj.method = "get";
		formObj.action = "${contextPath}/mypage/listMyOrderHistory.do";
		formObj.submit();
	}
 
	function fn_cancel_order(orderNum) {
		var answer = confirm("주문을 취소하시겠습니까?");
		if (answer == true) {
			var formObj = document.createElement("form");
			var i_orderNum = document.createElement("input");

			i_orderNum.name = "orderNum";
			i_orderNum.value = orderNum;

			formObj.appendChild(i_orderNum);
			document.body.appendChild(formObj);
			formObj.method = "post";
			formObj.action = "${contextPath}/mypage/cancelMyOrder.do";
			formObj.submit();
		}
	}
</script>
	
</body>
</html>