<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl 사용하기 위해 라이브러리 추가  -->
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- <c:set var="user" value="${userMap}"/> --%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<!-- Daum에서 제공하는 주소 검색을 사용하기 위해 포함 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <!-- css 적용 -->
   <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
 	<link href="../resources/css/header.css" rel="stylesheet" type="text/css" >
	<link href="../resources/css/footer.css" rel="stylesheet" type="text/css" >
	<style>
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
	
<script>
//주소검색
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress;  // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }
      // 주소 정보를 해당 필드에 넣는다.
      document.getElementById('userAddress1').value = fullRoadAddr;
    }
  }).open();
} 

//수정하기 버튼 클릭 시
// 수정된 회원 정보의 속성과 수정 값을 컨트롤러로 전송합니다.
//수정할 특정 속성을 나타내는 'attribute'를 매개변수로 받고 `value`로 변수를 초기화
 function fn_modify_user_info(attribute){
	var value;
	var frm_mod_user=document.frm_mod_user;
	if(attribute=='userPwd'){
		value=frm_mod_user.userPwd.value;
	}else if(attribute=='userName'){
		value=frm_mod_user.userName.value;
	} else if(attribute=='userGender'){
		var userGender=frm_mod_user.userGender;
		for(var i=0;userGender.length;i++){
			if(userGender[i].checked){
				value=userGender[i].value;
				break;
			}
		}
	}else if(attribute=='email'){  //23.07.20 이메일 수신동의 수정
		var userEmail=frm_mod_user.userEmail;
		var emailsts_yn=frm_mod_user.emailsts_yn;
		
		value_userEmail=userEmail.value;
		value_emailsts_yn=emailsts_yn.checked;
		value=value_userEmail+","+value_emailsts_yn;
		//alert(value);
	}else if(attribute=='userBirth'){
		value=frm_mod_user.userBirth.value;
	}else if(attribute=='phone'){  //23.07.20 연락처 수신동의 수정
		var userPhone=frm_mod_user.userPhone;
		var smssts_yn=frm_mod_user.smssts_yn;
		
		value_userPhone=userPhone.value;
		value_smssts_yn=smssts_yn.checked;
		value=value_userPhone+","+value_smssts_yn;
	}else if(attribute=='address'){
		var userAddress1=frm_mod_user.userAddress1;
		var userAddress2=frm_mod_user.userAddress2;
		
		value_userAddress1=userAddress1.value;
		value_userAddress2=userAddress2.value;
		value=value_userAddress1+","+value_userAddress2;
	} 
	console.log(attribute);
	
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/mypage/modifyMyInfo.do",
		data : {
			attribute:attribute,
			value:value,
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("회원 정보를 수정했습니다.");
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
		},
		error : function(data, textStatus) {
			alert("다시 시도해 주세요."+data);
		},
		complete : function(data, textStatus) {
			
		}
	}); //end ajax
}
</script>
</head>

<body>
<h1  class="text_center" align="center">회원 상세 정보</h1>
<form name="frm_mod_user">	
	<div id="login_table">
		<table  align="center">
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join" width="120" ><p align="right">아이디</td>
					<td align="left"><input type="text" name="userId"  id="userId"  size="20" minlength="2" maxlength="10" required  value="${user.userId }" disabled/>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">비밀번호</td>
					<td align="left"><input name="userPwd" type="password" size="20" minlength="4" maxlength="12" required  value="${user.userPwd }" /></td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('userPwd')"/></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">이름</td>
					<td align="left"><input name="userName" type="text" size="20" minlength="2" maxlength="10" required  value="${user.userName }"/></td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('userName')"/></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">성별</td>
					<td align="left">
					 <c:choose>
					  <c:when test="${user.userGender=='남' }">
						 <input type="radio" name="userGender" value="여" />여성
							<span style="padding-left:20px"></span>
						 <input type="radio" name="userGender" value="남"  checked  />남성
						 </c:when>
						 <c:otherwise>
						  <input type="radio" name="userGender" value="여" checked  />여성
							<span style="padding-left:20px"></span>
						 <input type="radio" name="userGender" value="남" />남성
						 </c:otherwise>
						 </c:choose>
					</td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('userGender')"/></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">이메일<br>(e-mail)</td>
					<td align="left"><input size="30px"   type="email" name="userEmail" id="userEmail" value="${user.userEmail }" /> 
					<br> 
					<!-- 23.07.23 서승희 이메일 수신여부 수정 -->
					<c:choose> 
					    <c:when test="${user.emailsts_yn=='true' || user.emailsts_yn=='Y,'}">
					      <input type="checkbox" name="emailsts_yn"   id="emailsts_y"   value="Y,"  checked /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.
						</c:when>
						<c:otherwise>
						  <input type="checkbox" name="emailsts_yn"   id="emailsts_n"   value="N" /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.
						</c:otherwise>
					 </c:choose>
					</td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('email')"/></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">생년월일</td>
					<td align="left"><input name="userBirth" type="text" size="40px" minlength="8" maxlength="8" required  value="${user.userBirth }"/></td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('userBirth')"/></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">연락처</td>
					<td align="left"> <input size="40px"  type="text" name="userPhone" minlength="10" maxlength="12" required  value="${user.userPhone }"/>
						<!-- <select  name="userPhone" id="userPhone">
							<option>없음</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
						</select>  -->
					<br> 
					<!-- 23.07.23 서승희 연락처 수신여부 수정 -->
					<c:choose> 
					   <c:when test="${user.smssts_yn=='true' || user.smssts_yn=='Y,'}">
					     <input type="checkbox"  name="smssts_yn"  id="smssts_y"  value="Y,"  checked /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
						</c:when>
						<c:otherwise>
						  <input type="checkbox"  name="smssts_yn" id="smssts_n"  value="N" /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
						</c:otherwise>
					 </c:choose>	
					 </td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('phone')"/></td>
				</tr>
			
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">주소지</td>
					<td align="left">
					  <p> 
					  기본 주소: <input type="text" id="userAddress1" name="userAddress1" size="30" value="${user.userAddress1 }"/ ><br><br>
					  상세 주소: <input type="text" id="userAddress2"  name="userAddress2" size="30" value="${user.userAddress2 }"  /><br><br>
					   <input class="addBtn" type="button" onClick="location.href='javascript:execDaumPostcode()'"value="주소검색" style="width:88.5%; "/><br><br>
					   </p>
					</td>
					<td><input type="button" value="수정하기" onClick="fn_modify_user_info('address')"/></td>
				</tr>
			</tbody>
		</table>
		</div>
		<br>
		<div class="clear" align="center">
		<input type="hidden" name="command"  value="modify_my_info" /> 
		<!-- <input name="btn_cancel_member" type="button"  value="수정 취소"> -->
		<%-- <input name="btn_modify_user" type="button" onclick="fn_modify_user_info('modify_all')"  value="수정하기"> --%>
		<input name="btn_cancel_user" type="reset"  value="수정취소">
		<input type="button" onclick="location.href='${contextPath}/mypage/removeUser.do?userId=${user.userId}'" value="회원탈퇴"/><br><br>
		</div>
</form>	


</body>
</html>