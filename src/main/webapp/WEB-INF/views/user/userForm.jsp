<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
	.user-form {
           display: inline-block;
           /*  justify-content: center;
            align-items: center; */
            padding: 30px;
        }
     .fixed_join{
     	 justify-content: center;
         padding-top:12px;
         padding-right:15px;
         } 
	</style>
<script>
/* //주소검색(우편번호 사용시)
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.userAddress1; // 도로명 주소 변수
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

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('userAddress1').value = fullRoadAddr;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoUserAddress1) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoUserAddress1 + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else {
          document.getElementById('guide').innerHTML = '';
      }
    }
  }).open();
} */
//ID 중복검사
function fn_overlapped(){
    var _id=$("#_user_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/user/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_user_id').prop("disabled", true);
       	    $('#userId').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>
</head>

<body>
<h2  class="text_center" align="center">회원 가입 입력 </h2>
<form action="${contextPath}/user/addUser.do" method="post"  class="user-form">	
	<div id="login_table">
		<table  align="center">
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join" width="120" ><p align="right">아이디</td>
					<td align="left"><input type="text" name="_user_id"  id="_user_id"  size="20" placeholder="ID(2자-10자)" />
					  <input type="hidden" name="userId"  id="userId" />
					  <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">비밀번호</td>
					<td align="left"><input name="userPwd" type="password" size="20" placeholder="비밀번호(4-12자)"/></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">이름</td>
					<td align="left"><input name="userName" type="text" size="20" placeholder="이름(2-10자)" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">성별</td>
					<td align="left"><input type="radio" name="userGender" value="여" />여성
							<span style="padding-left:20px"></span>
						 <input type="radio" name="userGender" value="남"  />남성
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">이메일<br>(e-mail)</td>
					<td align="left"><input size="30px"   type="email" name="userEmail" id="userEmail" placeholder="E-mail 입력" /> 
							<br> <input type="checkbox" name="userEmail" /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">생년월일</td>
					<td align="left"><input name="userBirth" type="text" size="40px" placeholder="생년월일 입력 8자리(숫자만 입력)" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">연락처</td>
					<td align="left"> <input size="40px"  type="text" name="userPhone" placeholder="전화번호 입력(숫자만 입력)">
						<!-- <select  name="userPhone" id="userPhone">
							<option>없음</option>
							<option selected value="010">010</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
						</select>  -->
					<br> <input type="checkbox"	name="userPhone"  /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
					</td>
				</tr>
			
				<tr class="dot_line">
					<td class="fixed_join" width="120"><p align="right">주소</td>
					<td align="left">
					  <p> 
					  기본 주소: <input type="text" id="userAddress1" name="userAddress1" size="30" placeholder="기본주소" ><br><br>
					  상세 주소: <input type="text" id="userAddress2"  name="userAddress2" size="30" placeholder="상세주소"  />
					   </p>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		
		<br>
		<div class="clear">
		<input type="submit"  value="회원 가입">
		<input  type="reset"  value="다시입력">
		<input type="button" onclick="location.href='${contextPath}/main.do'" value="메인" />
	</div>
</form>	
</body>
</html>